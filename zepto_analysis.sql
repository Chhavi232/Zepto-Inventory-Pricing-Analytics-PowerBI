drop table if exists zepto;

create table zepto(
sku_id serial primary key,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms integer,
outOfStock boolean,
quantity integer
);

--data exploration

--count of rows
select count(*) from zepto;

--sample data
select * from zepto
limit 10;

--null values
select * from zepto
where category is null
or
name is null
or 
mrp is null
or
discountpercent is null
or
availablequantity is null
or
discountedsellingprice is null
or
weightingms is null 
or
outofstock is null
or 
quantity is null;

--different product categories
select distinct(category)
from zepto
order by category;

--products in stock vs out of stock
select outofstock,count(sku_id)
from zepto
group by outofstock;

--product names present multiple times
select name,count(sku_id)
from zepto
group by name
having count(sku_id)>1
order by count(sku_id)desc;

--data cleaning

--products with price=0
select * from zepto
where mrp=0 or discountedsellingprice=0;

delete from zepto
where mrp=0;

--convert paise into rupees
update zepto
set mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

select mrp,discountedsellingprice from zepto;

--Business Insights

-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name,category,mrp,discountpercent,discountedsellingprice
from zepto
order by discountpercent desc
limit 10;

-- Q2. What are the products with high mrp but out of stock.
select distinct name,mrp
from zepto
where outofstock = true and mrp>300
order by mrp desc;

--Q3. Calculate Estimated Revenue for each category.
select category,
sum(discountedsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue;

--Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name,mrp,discountpercent 
from zepto
where mrp>500 and discountpercent < 10
order by mrp desc,discountpercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category,round(avg(discountpercent),2)as avg_discount
from zepto
group  by category
order by avg_discount desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name,weightingms,discountedsellingprice,
round(discountedsellingprice/weightingms,2) as price_per_gram
from zepto
where weightingms>100
order by price_per_gram;

--Q7. Group the products into categories like Low, Medium, Bulk.
select distinct name,weightingms,
case when weightingms < 1000 then 'Low'
when weightingms < 5000 then 'Medium'
else 'Bulk'
end as weight_category
from zepto;

--Q8. What is the total Inventory weight per category?
select category,
sum(weightingms*availablequantity) as total_weight
from zepto
group by category
order by total_weight;

--Q9. Which categories generate the highest revenue?
select category,
sum(discountedsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue desc;

--Q10. Top 10 most expensive products.
select name,category,mrp
from zepto
order by mrp desc
limit 10;

--Q11. Cheapest products
select name,
discountedsellingprice
from zepto
order by discountedsellingprice
limit 10;

--Q12. Average MRP of each category
select category,
round(avg(mrp),2) as avg_price
from zepto
group by category
order by avg_price desc;

--Q13. Which category has maximum products?
select category,
count(*) as products
from zepto
group by category
order by products desc;

--Q14. Highest inventory value product
select
name,
category,
discountedsellingprice,
availablequantity,
discountedsellingprice*availablequantity as inventory_value
from zepto
order by inventory_value desc;

--Q15. Which category has highest inventory value?
select
category,
sum(discountedsellingprice*availablequantity) as inventory_value
from zepto
group by category
order by inventory_value desc;

--Q16. Find products having above average MRP
select name,mrp
from zepto
where mrp >
(
select avg(mrp)
from zepto
);

--Q17. Rank products by price.
select name,category,mrp,
rank() over(order by mrp desc) as ranking
from zepto;

--Q18. Rank products by price without skipping rank numbers in case of ties.
select name,category,mrp,
dense_rank() over(order by mrp desc) as dense_rank
from zepto;

--Q19. Rank within category
 select name,category,mrp,
rank() over(partition by category order by mrp desc)
from zepto;

--Q20. Top 3 expensive products in every category.
with cte as
(
select *,
rank() over(partition by category order by mrp desc) rnk
from zepto
)

select *
from cte
where rnk<=3;

--Q21. Assign a unique row number to every product based on MRP.
select name,category,mrp,
row_number() over(order by mrp desc) as row_num
from zepto;

--Q22. Calculate the running total of discounted selling prices.
select name,discountedSellingPrice,
sum(discountedSellingPrice)
over(order by discountedSellingPrice) as running_total
from zepto;

--Q23. Find products whose MRP is higher than the average MRP of their own category.
select z1.name,z1.category,z1.mrp
from zepto z1
where mrp >
(
select avg(z2.mrp)
from zepto z2
where z1.category = z2.category
);

--Q24. Find the categories with the highest available stock quantity.
select category,
sum(availableQuantity) as total_stock
from zepto
group by category
order by total_stock desc;

--Q25. Find products that offer a higher discount than the overall average discount.
select name,category,discountPercent
from zepto
where discountPercent >
(
select avg(discountPercent)
from zepto
);

--Q26. Find the highest discount offered in each product category.
select category,
max(discountPercent) as highest_discount
from zepto
group by category
order by highest_discount desc;

--Q27. Calculate the percentage of products that are currently out of stock.
select
round(
100.0 *
sum(case when outOfStock = true then 1 else 0 end)
/
count(*)
,2) as out_of_stock_percentage
from zepto;

--Q28. Find the total number of products in each weight category (Low, Medium, Bulk).
select
case
    when weightInGms < 1000 then 'Low'
    when weightInGms < 5000 then 'Medium'
    else 'Bulk'
end as weight_category,
count(*) as total_products
from zepto
group by weight_category
order by total_products desc;


--Q29. Create an index on the Category column to improve query performance.
create index idx_category
on zepto(category);

--Q30. Create an index on the MRP column to speed up price-based searches.
create index idx_mrp
on zepto(mrp);
























