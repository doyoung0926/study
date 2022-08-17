# 데이터베이스와 SQL
# 6장. 집합 연산자
# 집합 이론
# 집합 이론 실습
# 집합 연산자
# union 연산자
# intersection 연산자
# except 연산자
# 집합 연산 규칙
# 복합 쿼리의 결과 정렬
# 집합 연산의 순서
# 집합 이론
# 합집합, 교집합, 차집합, (A union B) except (A intersectiion B)

# 집합 이론 실습
# 집합 연산 규칙
# 두 데이터셋 모두 같은 수의 열(column)을 가져야 됨
# 두 데이터셋의 각 열의 자료형은 서로 동일해야 됨
select 1 as num, 'abc' as str
union 
select 9 as num, 'xyz' as str;

# 집합 연산자
# union 연산자
# union 연산자
# 결합된 집합을 정렬하고 중복을 제거
# union all 연산자
# 최종 데이터셋의 행의 수는 결합되는 집합의 행의 수의 총합과 같음
# 중복되는 모든 값을 보여줌

# 집합 연산자
# 집합 연산을 하기 전에 customer 테이블과 actor 테이블 구성 확인
# 두 테이블 모두 first_name, last_name 이 존재하고 데이터타입도 동일
use sakila;

desc customer;

desc actor;

# customer 테이블과 actor 테이블 union all 연산 수행
select 'cust' as type1, c.first_name, c.last_name
from customer as c
union all
select 'actr' as type1, a.first_name, a.last_name
from actor as a;

select count(first_name) from customer;

select count(first_name) from actor;

# 집합 연산자
# actor 테이블에 union_all 연산 수행
# 중복 항목 제거 안함
# 총 데이터수가 400개로 늘어남
select 'actr' as typ, a.first_name, a.last_name
from actor as a
union all
select 'actr' as typ, a.first_name, a.last_name 
from actor as a;

# customer 테이블과 actor 테이블에서
# 이름이 'J'로 시작하고 성은 'D'로 시작하는 사람들의 합집합: union all(중복)
select c.first_name, c.last_name
from customer as c
where c.first_name like 'J%' and c.last_name like 'D%'
union all 
select a.first_name, a.last_name
from actor as a

# 집합 연산자
# union
# 중복 데이터 제거
select c.first_name, c.last_name
from customer as c
where c.first_name like 'J%' and c.last_name like 'D%'
union 
select a.first_name, a.last_name
from actor as a
where a.first_name like 'J%' and a.last_name like 'D%';

# 집합 연산자 
# intersct 연산자
# MySQL 8.0 버전에서 지원 안함
# inner join 으로 동일한 결과를 얻을 수 있음
select c.first_name, c.last_name
from customer as c
	inner join actor as a
	on (c.first_name = a.first_name)
	and (c.last_name = a.last_name);

select c.first_name, c.last_name
from customer as c
	inner join actor as a 
	on (c.first_name = a.first_name)
	and (c.last_name = a.last_name)
where a.first_name like 'J%' and a.last_name like 'D%';

# 집합 연산 규칙
# 복합 쿼리이 결과 정렬
# order by 절을 쿼리 마지막에 추가
# 열 이름 정의는 복합 쿼리의 첫 번째 쿼리에 있는 열의 이름을 사용해야 됨
select a.first_name as fname, a.last_name as lname
from actor as a
where a.first_name like 'J%' and a.last_name like 'D%'
union all 
select c.first_name, c.last_name
from customer as c
where c.first_name like 'J%' and c.last_name like 'D%'
order by lname, fname;

-- select a.first_name as fname, a.last_name as lname
-- from actor as a
-- where a.first_name like 'J%' and a.last_name like 'D%'
-- union all 
-- select c.first_name, c.last_name
-- from customer as c
-- where c.first_name like 'J%' ansd c.last_name like 'D%'
-- order by last_name, first_name;

# 집합 연산 규칙
# 집합 연산의 순서
# 복합 쿼리는 위에서 아래의 순서대로 실행
# 예외:
# intersect 연산자가 다른 집합 연산자보다 우선 순위가 높음
select a.first_name, a.last_name
from actor as a
where a.first_name like 'J%' and a.last_name like 'D%'
union all 
select a.first_name, a.last_name 
from actor as a
where a.first_name like 'M%' and a.last_name like 'T%'
union
select c.first_name, c.last_name
from customer as c
where c.first_name like 'J%' and c.last_name like 'D%';

# 실습
# 성이 L로 시작하는 모든 배우와 고객의 이름과 성을 찾는 복합 쿼리 작성
select first_name, last_name
from actor 
where last_name like 'L%'
union
select first_name, last_name 
from customer 
where last_name like 'L%';

# last_name 열을 기준으로 실습의 결과를 오름차순 정렬하시오.
select first_name, last_name
from actor 
where last_name like 'L%'
union
select first_name, last_name
from customer 
where last_name like 'L%'
order by last_name;


# 데이터베이스와 SQL
# 데이터 생성, 조작과 변환
# 문자열 데이터 처리
# 문자열 생성
# 문자열 조작
# 숫자 데이터 처리
# 산술 함수
# 숫자 자릿수 관리
# signed 데이터 처리
# 시간 데이터 처리
# 시간대 처리
# 시간 데이터 생성
# 시간 데이터 조작
# 변환 함수
# 문자열 데이터 처리
# char
# 고정 길이 문자열 자료형
# 지정한 크기보다 문자열이 작으면 나머지 공간을 공백으로 채움
# MySQL 255글자

# varchar
# 가변 길이 문자열 자료형
# 크기만큼 데이터가 들어오지 않으면 그 크기에 맞춰 공간 할당
# 헤더에 길이 정보가 포함
# MySQL 최대 65536 글자 허용

# text
# 매우 큰 가변 길이 문자열 저장
# MySQL: 최대 4 기가바이트 크기 문서 저장
# clob: 오라클 데이터베이스

# 문자열 데이터 처리
# 테이블 생성
use testdb;

create table stirng_tbl (
	char_fld char(30),
	vchar_fld varchar(30),
	text_fld text
);

# 문자열 데이터를 테이블에 추가
# 문자열의 길이가 해당 열의 최대 크기를 초과하면 예외 발생
insert into string_tbl (char_fld, vchar_fld, text_fld)
values ('This in char data',
	'This is varchar data',
	'This is text data');
	
# 문자열 데이터 처리
# varchar 문자열 처리
# update문으로 vchar