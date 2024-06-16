use shaurya

select * from [dbo].[salesman]

select * from [dbo].[customer]

select * from [dbo].[Orders]


select salesman.name as 'salesman', cust_name , salesman.city from salesman, customer where salesman.city = customer.city

select ord_no, purch_amt, cust_name, customer.city from Orders, customer
where orders.customer_id = customer.customer_id and 
purch_amt between 500 and 2000;

select cust_name as 'Customer Name', customer.city, salesman.name , salesman.commission 
from customer inner join salesman 
on customer.salesman_id = salesman.salesman_id

select cust_name as 'Customer Name', customer.city, salesman.name as 'salesman',salesman.commission from 
customer inner join salesman on customer.salesman_id = salesman.salesman_id 
where salesman.commission>.12;

select cust_name, customer.city, salesman.name as 'salesman' , salesman.city,salesman.commission from 
customer inner join salesman on customer.salesman_id = salesman.salesman_id 
where salesman.commission > .12 and customer.city <> salesman.city;


select ord_no, ord_date, purch_amt, cust_name as 'customer', grade, salesman.name as 'salesman', salesman.commission from 
orders inner join customer on orders.customer_id = customer.customer_id inner join salesman on 
orders.salesman_id = salesman.salesman_id;

select cust_name as 'customer name', customer.city, grade, salesman.name, salesman.city from customer 
inner join salesman on customer.salesman_id = salesman.salesman_id order by customer_id;

select cust_name, customer.city, grade, salesman.name, salesman.city from 
customer left join salesman on customer.salesman_id = salesman.salesman_id 
where customer.grade < 300 order by customer_id;

select cust_name, customer.city, ord_no, ord_date,purch_amt from 
customer left join orders on customer.customer_id = orders.customer_id 
order by ord_date;

select cust_name as 'customer', customer.city, ord_no, ord_date, purch_amt, salesman.name , salesman.commission from 
customer left join orders on customer.customer_id = orders.customer_id left join salesman on  salesman.salesman_id = orders.salesman_id;

select cust_name, customer.city, grade, salesman.name as 'salesman', salesman.city from 
customer right join salesman on customer.salesman_id = salesman.salesman_id  order by salesman.salesman_id;

SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", c.ord_no, c.ord_date, c.purch_amt FROM customer a RIGHT  JOIN salesman b 
ON b.salesman_id=a.salesman_id  RIGHT  JOIN orders c ON c.customer_id=a.customer_id;

SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", c.ord_no, c.ord_date, c.purch_amt FROM customer a RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id LEFT OUTER JOIN orders c ON c.customer_id=a.customer_id WHERE c.purch_amt>=2000 AND a.grade IS NOT NULL;

SELECT a.cust_name,a.city, b.ord_no, b.ord_date,b.purch_amt AS "Order Amount" FROM customer a LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id;

SELECT a.cust_name,a.city, b.ord_no, b.ord_date,b.purch_amt AS "Order Amount"  FROM customer a  FULL OUTER JOIN orders b ON a.customer_id=b.customer_id 
WHERE a.grade IS NOT NULL;

SELECT * FROM salesman a CROSS JOIN customer b;

SELECT * FROM salesman a CROSS JOIN customer b WHERE a.city IS NOT NULL;

SELECT * FROM salesman a CROSS JOIN customer b WHERE a.city IS NOT NULL and b.city is not null;

SELECT * FROM salesman a CROSS JOIN customer b WHERE a.city IS NOT NULL and b.city is not null and a.city<> b.city;

SELECT * FROM item_mast INNER JOIN company_mast ON item_mast.pro_com= company_mast.com_id; 

SELECT item_mast.pro_name, pro_price, company_mast.com_name FROM item_mast INNER JOIN company_mast ON item_mast.pro_com = company_mast.com_id; 


SELECT AVG(pro_price) as 'Average_price', company_mast.com_name FROM 
item_mast INNER JOIN company_mast  ON item_mast.pro_com= company_mast.com_id
GROUP BY company_mast.com_name; 

 SELECT AVG(pro_price), company_mast.com_name FROM item_mast INNER JOIN company_mast ON item_mast.pro_com= company_mast.com_id GROUP BY company_mast.com_name
 HAVING AVG(pro_price) >= 350;

 SELECT A.pro_name, A.pro_price, F.com_name
   FROM item_mast A INNER JOIN company_mast F
   ON A.pro_com = F.com_id
     AND A.pro_price =
     (
       SELECT MAX(A.pro_price)
         FROM item_mast A
         WHERE A.pro_com = F.com_id
     );









 