# 데이터베이스와 sql
# 5장. 다중 테이블 쿼리
# 목차
# 조인(join)
# 세 개 이상 테이블 조인
# 셀프 조인
# join
# 다중 테이블 쿼리
# 대부분의 쿼리는 여러 테이블을 필요로 함
# 여러 테이블을 연결할 연결 수단이 필요: 외래 키(foreign key)
# 조인(join): 두 테이블의 열을 하나의 결과셋에 포함하도록 연결
# 고객의 성과 이름, 주소를 검색할 경우
# customer 테이블의 first_name, last_name 열을 검색
# address 테이블의 address 열을 검색
# 연결 수단: address_id는 두 테이블에 공통으로 포함되어 있음
# join: join의 종류별 그림
# join의 종류
# self join, right join, full join, inner join, cross join, left join
# join: 교차 조인
# 데카르트 곱(Catesian product): 교차 조인
# 두 개의 테이블에서 한 테이블의 모든 행들과 다른 테이블의 모든 행을 결합
# 교차 조인(cross join): join의 조건이 없이 모든 행을 결합
# select (조회 컬럼) from 테이블명1 [cross] join 테이블명2;
# 상품 테이블 (3개의 행)x재고 테이블(3개의 행)=총 9개의 행
# 교차 조인
# customer 및 address 테이블을 join(교차조인)
# 결합(join)의 조건 없이 모든 행을 결합
select c.first_name, c.last_name, a.address
from customer as c join address as a;

select count(*) from customer;

select count(*) from address;

select count(*) from customer as c join address as a;  # 교차 조인
# join: 내부 조인
# 내부 조인(inner join): 가장 일반적인 join 유형
# 두 개 이상의 테이블을 묶어서 하나의 결과 집합을 만들어 내는 것
# 일치하지 않는 데이터는 검색하지 않음
# select <열 목록> from <기준 테이블> [inner] join <참조할 테이블>
	# on <조인 조건>
# [where 검색 조건]
# 부서ID 4는 부서명에 존재하지 않기 때문에 검색하지 않음

# 내부 조인 예제
# 앞의 교차 조인에서 각 고객에 대해 단일 행만 반환하도록 쿼리 수정
# customer 테이블의 address_id와 address 테이블의 address_id가 같은 경우에만 조인
select c.first_name, c.last_name, a.address
from customer as c inner join address as a 
on c.address_id = a.address_id;
# inner join에서 inner 생략 가능

# join: 외부 조인
# 외부 조인 (outer join)
# 외부 조인
# 한쪽 테이블에만 존재하는 데이터들을 다른 테이블에 결합하는 방식
# select <열 목록>
# from <첫 번째 테이블 (left)>
	#<left|right|full> [outer] join <두 번째 테이블(right)>
	# on <조인 조건>
# [where 검색조건];

# ANSI join 문법
# 교재의 테이블 조인 표기법
# ANSI SQL 표준의 SQL92버전 사용
# 이전 문법 표기
# 내부 조인 및 필터 조건: where절에 표기
select c.first_name, c.last_name, a.address
from customer as c join address as a 
where c.address_id=a.address_id and a.postal_code=52137;
# 조인 조건과 필터 조건을 구분하기 어려움
# SQL92 문법 표기
# join 조건: on 절
# 필터 조건: where 절
select c.first_name, c.last_name, a.address, a.postal_code
from customer as c join address as a 
	on c.address_id = a.address_id 
where a.postal_code=52137;

# 세 개 이상 테이블 조인
# 세 개 이상 테이블 조인
# customer테이블, address 테이블, city 테이블 사용
# 고객이 사는 도시를 반환하는 쿼리 작성
# city테이블 구조 확인
desc city;
# customer 테이블과 address 테이블 inner join
# address_id를 사용하여 연결
# address 테이블과 city 테이블 inner join
# city_id를 사용하여 연결
# 테이블의 순서는 상관 없음: 데이터 베이스 내부에서 결정
select c.first_name, c.last_name, ct.city
from customer as c inner join address as a on c.address_id=a.address_id  # customer과 address 조인
			inner join city as ct on a.city_id=ct.city_id;  # address와 city 조인
# 서브 쿼리 사용
select c.first_name, c.last_name, addr.address, addr.city, addr.district
from customer as c
	inner join
	(select a.address_id, a.address, ct.city, a.district  # 서브 쿼리 별칭 addr
	from address as a
		inner join city as ct 
		on a.city_id=ct.city_id
	where a.district='California'
	) as addr
on c.address_id=addr.address_id;
# 서브 쿼리(addr) 결과를 customer 테이블과 inner join
# 쿼리 결과: California에 거주하는 모든 고객들의 이름, 성, 주소 및 도시를 검색

# 서브 쿼리 사용
# 서브 쿼리만 단독으로 실행
# address 테이블과 city 테이블을 내부 조인
# 필터링 조건:district의 이름이 'California'
select a.address_id, a.address, ct.city, a.district
from address as a inner join city as ct
	on a.city_id=ct.city_id
where a.district='California';

# 세 개 이상 테이블 조인
# 테이블 재사용
# 여러 테이블을 join할 경우, 같은 테이블을 두 번 이상 join 할 수 있음
# 두 명의 특정 배우가 출연한 영화 제목 검색
# 조인 테이블: film, film_actor, actor 테이블
select f.title
from film as f
	inner join film_actor as fa 
	on f.film_id=fa.film_id 
	inner join actor as a 
	on fa.actor_id=a.actor_id 
where ((a.first_name='CATE' and a.last_name='MCQUEEN')
or (a.first_name='CUBA' and a.last_name='BIRCH'));

# 세 개 이상 테이블 조인(보강)
# 두 배우가 같이 출연한 영화만 검색
# film 테이블에서 film_actor 테이블에 두 행(두 배우)가 있는 모든 행을 검색
# 같은 테이블을 여러 번 사용하기 때문에 테이블 별칭 사용
select f.title
from film as f
	inner join film_actor as fa1
	on f.film_id=fa1.film_id 
	inner join actor a1 # film, film_actor, actor 내부 조인 #1
	on fa1.actor_id=a1.actor_id 
	inner join film_actor as fa2
	on f.film_id=fa2.film_id 
	inner join actor a2 # fil, film_actor, actor 내부 조인 #2
	on fa2.actor_id=a2.actor_id
where (a1.first_name='CATE' and a1.last_name='MCQUEEN')
and (a2.first_name='CUBA' and a2.last_name='BIRCH');

# 셀프 조인
# 셀프 조인(self-join)
# 자기 자신에게 join
# customer_id 1(JOHN)과 2(Mary)는 서로 배우자
# customer_id 3(Lisa)과 5(Tim)는 서로 배우자
# 고객의 이름과 배우자의 ID는 알 수 있지만, 배우자의 성과 이름은 바로 알 수 없음
# self-join을 이용하여 customer 테이블에 배우자의 성과 이름을 붙여줄 수 있음

# customer 테이블 생성 및 데이터 추가
# sqlclass_db 사용
use sqlclass_db;

drop table customer;

create table customer 
	(customer_id smallint unsigned,
	first_name varchar(20),
	last_name varchar(20),
	birth_date date,
	spouse_id smallint unsigned,
	constraint primary key (customer_id));
	
# sqlclass_db 데이터베이스에 생성된 custoemr 테이블 확인
desc customer;

# 셀프 조인
# customer 테이블에 데이터 추가
insert into customer (customer_id, first_name, last_name, birth_date, spouse_id)
values
(1, 'John', 'Mayer', '1983-05-12', 2),
(2, 'Mary', 'Mayer', '1990-07-30', 1),
(3, 'Lisa', 'Ross', '1989-04-15', 5),
(4, 'Anna', 'Timothy', '1988-12-26', 6),
(5, 'Tim', 'Ross', '1957-08-15', 3),
(6, 'Steve', 'Donell', '1967-07-09', 4);

insert into customer (customer_id, first_name, last_name, birth_date)
values (7, 'Donna', 'Trapp', '1978-06-23');

select * from customer;

# self_join 예제
select 
	cust.customer_id,
	cust.first_name,
	cust.last_name,
	cust.birth_date,
	cust.spouse_id,
	spouse.first_name as spouse_firstname,  # 새롭게 보여줄 열을 추가
	spouse.last_name as spouse_lastname
from customer as cust
	join customer as spouse 
	on cust.spouse_id = spouse.customer_id;  # self-join: customer 테이블을 spouse로 가칭 사용
# Donna Trapp는 제외됨

use sakila;
# john이라는 이름의 배우가 출연한 모든 영화의 제목을 출력
select f.title
from film as f
	inner join film_actor as fa
	on f.film_id=fa.film_id
	inner join actor as a 
	on fa.actor_id=a.actor_id
where a.first_name='JOHN';