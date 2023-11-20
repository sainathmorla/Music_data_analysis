1.) Who is the senior most employee based on the title?
select * from employee 
order by levels desc limit 1;

2.) Which countries have the most invoices?

select billing_country,count(*) as no_of_invoices from invoice
group by billing_country order by no_of_invoices desc;

3.) What are the top 3 values of total invoice?

select total from invoice 
order by total desc limit 3


select billing_city,sum(total) as total_invoice from invoice
group by billing_city order by sum(total) desc

select sum(total),c.customer_id,first_name,last_name from invoice as i 
inner join customer as c on i.customer_id=c.customer_id
group by c.customer_id order by sum(total) desc limit 1


select distinct(c.email),c.last_name,c.first_name,g.name from customer as c 
join invoice as i 
on c.customer_id = i.customer_id 
join invoice_line as il 
on i.invoice_id = il.invoice_id
join track as t
on il.track_id=t.track_id
join genre as g
on t.genre_id = g.genre_id
where g.name='Rock'
order by c.email 

select a.artist_id, ar.name,count(*) from genre as g 
join track as t
on g.genre_id=t.genre_id 
join album as a
on t.album_id=a.album_id 
join artist as ar
on a.artist_id=ar.artist_id
where g.name like 'Rock'
group by a.artist_id,ar.name
order by count(*) desc limit 10
