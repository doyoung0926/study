use sakila;

select * from language;

select name, last_update from language;

select * from language;

select language_id,
	'COMMON' language_usage,
	language_id * 3.14 lang_pi_value,
	upper(name) language_name
from language;

select actor_id from film_actor order by actor_id;

select distinct actor_id from film_actor order by actor_id;

# 서브쿼리 내용: cust 라고 정함 (as cust)
select first_name, last_name, email from customer
where first_name='JESSIE';

#select concat(cust.last_name, ', ', cust.first_name) as full_name
select cust.last_name, cust.first_name
from
	(select first_name, last_name, email
		from customer
		where first_name = 'JESSIE'
	)as cust;
	
create temporary table actors_j
	(actor_id smallint(5),
	first_name varchar(45),
	last_name varchar(45)
);

# 원본 쿼리 #1: J로 시작하는 last_name을 검색
select actor_id, first_name, last_name
from actor where last_name like '%J';

# 원본 쿼리 1의 출력 결과를 actors_j 테이블에 데이터 추가
insert into actors_j
select actor_id, first_name, last_name
from actor where last_name like 'J%';

select * from actors_j;

# 가상 테이블 (view) 생성
create view cust_vw as
select customer_id, first_name, last_name, active
from customer;

# 가상 테이블(view) 활용
select first_name, last_name from cust_vw
where active=0;

drop view cust_vw; # view 삭제


# Join(Inner Join)
select customer.customer_id, customer.first_name, customer.last_name,
	time(rental.rental_date) as rental_time
from customer inner join rental
	on customer.customer_id = rental.customer_id
where date(rental.rental_date)='2005-06-14';

# date()함수: YYYY-MM-DD 정보 리턴
select date('2022-07-29 09:02:03') as day1;

# time(): HH:MI:SS 정보 리턴
select time('2022-07-29 09:02:03') as time1;

select c.first_name, c.last_name,
	time(r.rental_date) as rental_time
from customer as c inner join rental as r 
	on c.customer_id = r.customer_id 
where date(r.rental_date)='2005-06-14';

# where 절
select title, rating, rental_duration
from film
where rating='G' and rental_duration >= 7;

select title, rating, rental_duration
from film
where rating='G' or rental_duration >= 7;

# Group by절과 having절
select c.first_name, c.last_name, count(*)
from customer as c
	inner join rental as r 
	on c.customer_id = r.customer_id.
group by c.first_name, c.last_name 
having count(*) >= 40;

# order by 절
# 오름차순 정렬: ASC
select c.first_name, c.last_name,
	time(r.rental_date) as rental_time
from customer as c
	inner join rental as r 
	on c.customer_id = r.customer_id 
where date(r.rental_date) = '2005-06-14'
order by c.last_name, c.first_name asc;

# rental_date 기준으로 내림차순 정렬
select c.first_name, c.last_name,
	time(r.rental_date) as rental_time
from customer as c
	inner join rental as r 
	on c.customer_id = r.customer_id 
where date(r.rental_date) = '2005-06-14'
order by time(r.rental_date) desc;

# 연습 문제 실습 3-1
select actor_id, first_name, last_name
from actor
order by last_name, first_name;

# 연습 문제 실습 3-2
select actor_id, first_name, last_name
from actor
where (last_name = 'WILLIAMS') or (last_name='DAVIS');

# 연습 문제 실습 3-3
select distinct customer_id
from rental
where date(rental_date) = '2005-07-05';

# 연습 문제 3.8
select c.store_id, c.email, r.return_date
from customer as c
inner join rental as r
on c.customer_id=r.customer_id 
where date(r.rental_date) = '2005-06-14'
order by return_date desc;

-- select customer_id, count(*)
-- from rental
-- group by customer_id
-- having date(rental.rental_date='2005-07-05';

select customer_id, rental_date
from rental
where rental_date <= '2005-06-16'
	and rental_date >= '2005-06-14';
	
select customer_id, rental_date
from rental
where date(rental_date) <= '2005-06-16'
	and date(rental_date) >= '2005-06-14';
	
select customer_id, rental_date
from rental
where rental_date between '2005-06-14' and '2005-06-16';

select customer_id, payment_date, amount
from payment
where amount between 10.0 and 11.99;

select last_name, first_name
from customer
where last_name between 'FA' and 'FRB';

# %PET%: PET를 포함 -> 영화 등급은 모두 G, PG를 리턴
select title, rating
from film
where rating in (select rating from film where title like '%PET%');

select title, rating
from film
where rating not in ('PG-13', 'R', 'NC-17');

select last_name, first_name
from customer
where last_name like '_A_T%S';

select last_name, first_name
from customer c where last_name like 'Q%' or last_name like 'Y%';

select last_name, first_name
from customer
where last_name regexp '^[QY]';

select rental_id, customer_id, return_date
from rental
where return_date is null;

select rental_id, customer_id, return_date
from rental
where return_date is not null;

select rental_id, customer_id, return_date
from rental
where return_date is null 
or return_date not between '2005-05-01' and '2005-09-01';

select payment_id, customer_id, amount, date(payment_date) as payment_date
from payment
where (payment_id between 101 and 120);

select payment_id, customer_id, amount, date(payment_date) payment_date
from payment
where (payment_id between 101 and 120)
and (customer_id != 5 and (amount > 8 or date(payment_date) = '2005-08-23'));

select payment_id, customer_id, amount, date(payment_date) payment_date
from payment
where (payment_id between 101 and 120)
and (customer_id = 5) and not (amount > 6 or date(payment_date) = '2005-06-19';