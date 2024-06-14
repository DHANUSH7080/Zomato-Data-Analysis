1. What is the total amount each customer spent on zomato ?

select a.userid,sum(b.price) as TotalSpend from sales a inner join product b on a.product_id=b.product_id
group by a.userid

2. How many days has each customer visited zomato ?

select userid,count(distinct created_date) as Visited_Count from sales group by userid;

3. What was the first product ordered by each customer ?

select * from
(select *,rank()over(partition by userid order by created_date )rnk from sales) a where rnk=1

4.What is the most purchased item on the menu and how many times was it purchased by all customers?

select userid,count(product_id) as Count from sales where product_id=
(select top 1 product_id from sales group by product_id order by count(product_id) desc) group by userid

5. Which item was the most popular for each customer ?

select * from
(select *,rank() over(partition by userid order by cnt desc) rnk from
(select userid,product_id,count(product_id) cnt from sales group by userid,product_id)a)b
where rnk=1

select * from goldusers_signup
select * from users
select * from sales
select * from product