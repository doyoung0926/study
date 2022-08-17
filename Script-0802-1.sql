use sakila;

select customer_id, count(*) # count(*) - 각 그룹의 모든 행의 수를 계산
from rental
group by customer_id;   # 각 사용자 ID별 대여 회수를 계산

select customer_id, count(*)
from rental
group by customer_id 
order by 2 desc;  # 가장 많이 대여한 회수: 46회

desc payment;

# 암시적 그룹 결과
# group by절을 사용하지 않음: 집계 함수에 의해 생성된 값
select max(amount) as max_amt,
	min(amount) as min_amt,
	avg(amount) as avg_amt,
	sum(amount) as tot_amt,
	count(*) as num_payments
from payment;

# 명시적 그룹
# 집계 함수를 적용하기 위해 group by절에 그룹화할 열의 이름 지정
select customer_id,
	max(amount) as max_amt,
	min(amount) as min_amt,
	avg(amount) as avg_amt,
	sum(amount) as tot_amt,
	count(*) as num_payments
from payment
group by customer_id;

select count(customer_id) as num_rows,
	count(distinct customer_id) as num_customers