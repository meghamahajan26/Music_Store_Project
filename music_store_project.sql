create database music_store

use music_store;

--- 1. Who is the senior most employee based on job title? ---

select * from employee
order by levels desc limit 1;

--- 2. Which countries have the most Invoices? --

select count(*) as counts, billing_country
 from invoice
 group by billing_country
 order by counts desc;

--- 3. What are top 3 values of total invoice?  

select total from invoice
order by total desc
limit 3;

---4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
      Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals  

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc;

---- 5. Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that 
		returns the person who has spent the most money  
        
select c.customer_id, c.first_name, c.last_name, SUM(invoice.total) as total
from customer as c 
join invoice on c.customer_id = invoice.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total desc
limit 1;

