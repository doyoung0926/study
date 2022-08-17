# 데이터베이스와 SQL
# 4장. 필터링
# 조건 평가
# 조건 작성
# 조건 유형
# null

# 조건 평가
# where 절
# and 또는 or 연산자로 하나 이상의 조건을 포함
# and: 모든 조건이 true
# or: 조건 중 하나만 true이면, 해당 조건은 true 
# 괄호 사용
# 여러 개의 조건을 포함하는 경우, 괄호를 써서 의도를 명확히 표현
 # not 연산자
# 2006년 1월 1일 이후에 기록이 생성된 사람 중에 이름이 steve 이거나 성이 young이 아닌 행만 검색
# not 연산자로 <> 사용
# 조건 작성
# 조건 작성
# 하나 이상의 연산자와 결합된 표현식으로 구성
# 표현식
# 숫자
# 테이블 또는 뷰의 열
# 문자열
# concat()과 같은 내장 함수
# 서브 쿼리
# ('boston','new york','chicago')와 같은 표현식 목록
# 조건 연산자
# 비교 연산자 = != < > <> like in between
# 산술 연산자 + - * /

# 조건 유형
# 동등 조건(equality condition): 열=표현/값
# 2005년 6월 14일에 영화를 대여한 모든 고객의 이메일 주소 출력

# 부등 조건(inequality condition): 두 표현이 동일하지 않음
# <> 또는 != 사용
# 2005년 6월 14일 이외의 날짜에 영화를 대여한 사람들의 이메일 주소

# 동등/부등 조건 사용 예
# 데이터를 수정할 때 사용
delete from rental 
where year(rental_date)=2004;


delete from rental 
where year(rental_date) <> 2005 and year(rental_date)<>2006;

# 범위 조건
# 해당 식이 특정 범위 내에 있는지 확인
select customer_id, rental_date
from rental
where rental_date < '2005-05-25';
# 해당 날짜만 검색: date(rental_date)='2005-05-25'

select customer_id, rental_date
from rental
where rental_date<='2005-06-16'
and rental_date >= '2005-06-14';

# 범위 조건
# 2005년 6월 14일부터 6월 16일까지의 데이터를 출력하기 위해
# date(rental_date)를 사용: 정확한 날짜만 추출
select customer_id , rental_date
from rental 
where date(rental_date)<='2005-06-16'
and date(rental_date)>='2005-06-14';

# between 연산자
# between [범위의 하한값] and [범위의 상한값]
select customer_id, rental_date
from rental
where rental_date between '2005-06-14' and '2005-06-16';

# 숫자 범위 사용
# 하한값과 상한값이 범위에 포함됨
select customer_id, payment_date, amount
from payment 
where amount between 10.0 and 11.9;

# 문자열 범위
# last_name이 'FA'와 'FRB'로 시작하는 데이터 리턴
select last_name, first_name
from customer 
where last_name between 'FA' and 'FRB';

# 멤버십 조건
# or 또는 in() 연산
# 유한한 값의 집합으로 제한
# in() 연산
# 컬럼명 in (값1, 값2,...)
# 지정한 컬럼의 값이 특정 값에 해당되는 조건을 만들 때 사용 (or 대신 사용)
select title, rating
from film
where rating='G' or rating='PG';

select title, rating
from film 
where rating in ('G','PG');

# 서브 쿼리 사용
# 값의 집합을 생성할 수 있음
select title, rating
from film 
where rating in (select rating from film where title like '%PET%');

# 서브 쿼리 내용
# PET를 포함하는 영화 제목을 찾고, 그 영화 제목의 rating을 반환 (P,PG)
# PET%: PET로 시작하는 단어
# %PET: PET로 끝나는 단어
# %PET%: PET를 포함하는 단어
select title, rating from film where title like '%PET%';

# where 절 내용
select title, rating
from film
where rating in ('G','PG');

# not in 사용
# 표현식 집합 내에 존재하지 않음
select title, rating
from film
where rating not in ('PG-13','R','NC-17');

# not in ('pg-13','R','NC-17')
# 영화 등급이 'pg-13','R','NC-17'이 아닌 모든 영화를찾음

# 문자열 부분 가져오기
# left(문자열,n)
# 문자열의 가장 왼쪽부터 n개 가져옴
select left('abcdefg',3);
# mid(문자열,시작위치,n)
# substr(문자,시작위치,n)도 동일한 기능 수행
select mid('abcdefg',2,3);
# right(문자열,n)
# 문자열의 가장 오른쪽부터 n개 가져옴
 select right('abcdefg',2);
 # 와일드 카드
# '_': 정확히 한 문자 (underscore)
# '%': 개수에 상관없이 모든 문자 포함

# 일치 조건
# 일치 조건(matching condition)
# 와일드 카드 사용시 like 연산자를 사용
select last_name, first_name
from customer
where last_name like '_A_T%S';
# '_A_T%S'
# 두번째 위치에 A,네번째 위치에 T를 포함하며 마지막은 S로 끝나느 문자열
select last_name, first_name
from customer 
where last_name like 'Q%' or last_name like 'Y%';
# last_name이 'Q'로 시작하거나 'Y'로 시작하는 고객 이름 검색
# 정규 표현식 사용
# ^[QY]:Q또는Y로 시작하는 단어 검색