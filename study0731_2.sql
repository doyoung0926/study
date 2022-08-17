# 데이터베이스와 SQL
# 1장. 배경	

# 목차
# 데이터베이스 소개
# SQL
# MySQL

# 데이터 베이스 소개
# 데이터베이스
# 여러 사용자나 응용 프로그램이 공유하고 동시에 접근 가능한 '데이터의 집합'
# '데이터의 저장 공간' 자체를 의미하기도 함

# DBMS(DateBase Management System)
# 데이터베이스를 관리·운영하는 소프트웨어
# 사용자나 응용 프로그램은 DBMS가 관리하는 데이터에 동시에 접속하여 데이터를 공유함

# 데이터베이스 소개
# 데이터 베이스 개념도
# DBMS(MySQL)
# 데이터 베이스 - 데이터 집합, 데이터 집합
# 사용자, 사용자, 응용 프로그램, 응용 프로그램 => 동시 접속 및 데이터 공유

# 데이터베이스의 정의와 특징
# 데이터베이스의 특징
# 데이터의 무결성: 데이터베이스 안의 데이터는 어떤 경로를 통해 들어왔든 오류가 있어서는 안됨
# 데이터의 독립성: 데이터베이스와 응용프로그램은 서로 의존적인 관계가 아니라 독립적인 관계임
# 보안: 데이터 베이스 안의 데이터는 데이터를 소유한 사람이나 데이터에 접근이 허가된 사람만 접근할 수 있음
# 데이터 중복 최소화: 데이터베이스에서는 동일한 데이터가 여러 군데 중복 저장되는 것을 방지함
# 응용 프로그램 제작 및 수정 용이: 데이터베이스를 이용하면 통일된 방식으로 응용 프로그램을 작성할 수 있고 유지·보수 또한 쉬움
# 데이터의 안전성 향상: 데이터가 손상되는 문제가 발생하더라도 원래의 상태로 복원 또는 복구할 수 있음

# 관계형 데이터베이스 시스템
# 계층형 DBMS
# 처음으로 나온 DBMS 개념 - 1960년대에 시작
# 각 계층은 트리(Tree) 형태, 1:N 관계
# 문제점
# 처음 구축한 이후 그 구조를 변경하기가 상당히 까다로움
# 주어진 상태에서의 검색은 상당히 빠름
# 접근 유연성 부족해서 임의의 검색에는 어려움
# 네트워크 DBMS
# 1:1, 1:N, N:M(다대다) 관계가 지원되어 효과적이고 빠른 데이터 추출이 가능
# 매우 복잡한 내부 포인터 사용
# 프로그래머가 모든 구조를 이해하고 있어야 프로그램을 작성할 수 있음

# 관계형 모델
# 관계형 DBMS
# 모든 데이터는 테이블에 저장
# 테이블 간의 관계는 기본키(PK)와 외래키(FK)를 사용하여 맺음(부모-자식 관계)
# 장점
# 다른 DBMS에 비해 업무 변화에 따라 바로 순응
# 유지·보수 측면에서 편리
# 대용량 데이터를 체계적으로 관리할 수 있음
# 데이터의 무결성(intergrity)이 잘 보장됨
# 정확한 데이터가 유지됨을 보장
# 단점
# 시스템 자원을 많이 차지
# 시스텡이 전반적으로 느려지는 단점이 있음 (하드웨어 발전으로 해결)

# 관계형 모델
# 계좌 데이터의 관계형 View

# 주요 용어
# 테이블의 구조와 관련 용어
# DBMS(MySQL)
# 데이터 베이스
# 데이터 베이스
# 기본키(Primary Key.PK)
# 테이블
# 열이름
# 열(column)
# 행(row)

# 주요 용어와 정의
# 용어          /       정의
# 엔티티(entity) / 데이터베이스에서 사용자들이 관심을 갖는 모든 요소(고객,부품,위치정보 등)
# 열(column, field) / 테이블에 저장된 개별적인 데이터 조각 (필드)
# 열이름 / 각 열을 구분하기 위한 이름, 각 테이블 내에서는 중복되지 않고 고유해야 됨
# 데이터 형식 / 열의 데이터 형식, 테이블을 생성할 때 열 이름과 함께 지정
# 행(row, record) / 실질적인 데이터(레코드라고도 부름)
# 테이블(table) / 데이터를 입력하기 위해 표 형태로 만든 것, 행의 집합
# 결과셋(result set) / SQL 쿼리의 결과물
# 기본 키(Primary key) / 각 행을 구분하는 고유 식별자, 기본 키는 중복되거나 비어 있으면 안됨
# 외래 키(Foreign key) / 다른 테이블에서 행을 구분하는 식별자, 두 테이블을 연결하는 key

# SQL의 개요
# SQL(Structed Query Language, Sequel)
# 데이터베이스를 조작하는 언어
# 구조화된 질의 언어
# SQL의 특징
# DBMS 제작 회사와 독립적임
# 다른 시스템으로의 이식성이 좋음
# 표준이 계속 발전함
# 대화식 언어임
# 클라이언트/서버 구조 지원함
# 표준 SQL과 각 회사의 SQL
# 많은 회사가 되도록 표준 SQL을 준수하려고 노력
# 각 회사의 DBMS마다 특징이 있기 때문에 현식적으로 완전히 통일되기는 어려움
# 각 회사으이 제품은 모두 표준 SQL을 공통으로 사용하면서 자기 제품의 특성에 맞춘 호환되지 않는 SQL 문 사용

# SQL 스키마(SQL Schema)
# 데이터베이스의 구조와 제약조건에 관해 전반적인 명세를 기술한 것
# 속성, 개체, 관계에 대한 정의
# 한 줄 주석
/*
 * corporation 테이블 생성
 * cord_id, name 컬럼 추가
 */
create table corporation
(corp_id smallint,
name varchar(30),
constraint pk_corporaion primary key(corp_id)
);

desc corporation;


# 데이터베이스와 SQL
# 2장. 데이터베이스 생성과 데이터 추가

# 목차
# mysql 명령줄 도구 사용 방법
# MySQL 자료형
# 테이블 생성
# 테이블 수정

# mysql 명령줄 도구 사용 방법
# MySQL 명령줄 사용 방법
# MySQL 8.0 Command Line Client 또는 DBeaver 실행
# Enter password: 패스워드 입력
# 사용 가능한 데이터베이스 확인
show databases;

# mysql 명령줄 도구 사용 방법
# 샤키라 데이터 베이스 선택
use sakila;

# DBeaver에서 새 SQL 편집기 메뉴 선택 후 직접 입력
# 명령행 한 줄 실행: 명령어를 블럭 설정 후 Ctrl + Enter키 입력

# 현재 날짜와 시간 정보 출력 쿼리
select now();

# MySQL 자료형
# 문자 데이터
# 고정 길이 또는 가변 길이 문자열 저장
# char(20): 고정 길이 문자열 (최대 255 바이트)
# varchar(20): 가변 길이 문자열 (최대 65,535 바이트)
# 캐릭터셋
# 사용 언어에 따라 크기가 다름
show character set;  # utf8mb4가 MySQL 8 버전의 기본 캐릭터셋

# 텍스트 데이터
# varchar의 제한을 초과하는 데이터를 저장하는 자료형
# 자료형         /  최대 바이트 크기
# tinytext / 255(1바이트)
# text / 65,535(2바이트)
# mediumtext / 16,777,215 (24바이트)
# longtext / 4,294,967,295(32바이트)
# tinytext  text  mediumtext  longtext
# 최대 크기를 초과하는 경우, 데이터가 잘려서 저장
# text 자료형과 varchar 자료형의 크기가 동일함

# 숫자 데이터 
# 정수 자료형
# 자료형     /  부호 있는 정수 저장값의 범위       / 부호가 없는 정수 저장값의 범위
# tiny int / -128 ~ 127  / 0 ~ 255
# smallint / -32768 ~ 32767  /  0 ~ 65535
# mediumint / -8388608 ~ 8388607  / 0 ~ 16777215
# int  / -2147483648 ~ 2147483647  / 0 ~ 4294967295
# bigint  / -2^63 ~ 2^63 - 1  / 0 ~ 2^64  - 1 
# 부동 소수점
# 자료형   /  숫자 범위
# float(p,s)  / -3402823466x10^38~3.402823466x10^38
# ex) float(4,2): 총 4자리 중 소수점 아래 2자리
# double(p,s)  / -1.7976931348623157x10^308 ~ 1.7976931348623157x10^308

# MySQL 자료형
# 시간 데이터 
# 자료형    /    기본 형식    /     허용값
# date / YYYY-MM-DD   / 1000-01-01 ~ 9999-12-31
# datetime / YYYY-MM-DD HH:MI:SS / 1000-01-01 00:00:00.000000 ~ 9999-12-31 23:59:59.999999
# timestamp / YYYY-MM-DD HH:MI:SS / 1970-01-01 00:00:000000 ~ 2038-01-18 22:14:07.999999
# year / YYYY / 1901 ~ 2155
# time / HHH:MI:SS / -838:59:59.000000 ~ 838:59:59.000000
# 날짜 형식의 구성 요소
# 자료형    /    기본 형식    /   허용값
# YYYY / 연도 / 1000~9999
# MM / 월 / 01(1월) ~ 12(12월)
# DD / 일 / 01~31
# HH / 시간 / 00~23
# MI / 분 / 00~59
# SS / 초 / 00~59

# datetime과 timestamp 비교
# datetime과 timestamp 비교 테이블
#                / datetime   /  timestamp
# 데이터 저장 타입 / 문자형 / 숫자형
# 저장 공간 / 8 bytes / 4 bytes
# 자동 입력 여부 / x / o
# 타임존 영향 / x / o (UTX로 변환)

# timestamp는 데이터를 입력하거나 수정하면 자동으로 시간 정보가 입력

# 테이블 생성
# DBeaver로 MySQL접속
# 연습용 databas 생성: testdb
create database testdb;
# 새롭게 생성한 testdb 선택
use testdb;

# person 테이블 구성
# 열 / 자료형 / 허용값/ 비고
# person_id/smallint(unsigned)
# first_name/varchar(20)
# last_name/varchar(20)
# eye_color/char(2)/BR,BL,GR
# birth_date/date
# street/varchar(30)
# city/varchar(20)
# state/varchar(20)
# country/varchar(20)
# postal_code/varchar(20)

# favorite_food 테이블 구성
# 열/자료형/비고
# person_id/smallint(unsigned)/foreign key
# food/varchar(20)

# 테이블 생성
# person 테이블 생성
create table person 
	(person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	eye_color enum('BR','BL','GR'),
	birth_date date,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
	constraint pk_person primary key (person_in)   # 기본 키 제약 조건
);
# constraint [제약 조건 이름] primary key (필드이름)
# 기본 키(primary key)로 person_id 열을 선정
# not null과 unique 제약 조건의 특징을 가짐
# 제약 조건(constraint)
# 데이터의 무결성을 지키기 위해, 데이터를 입력 받을 때 실행되는 검사 규칙

# person 테이블 확인
desc person;

# null 항목
# 특정 열의 데이터 생략 여부
# no:person_id 필드는 primary key이므로 반드시 값이 입력되어야 함
# null값의 의미: 해당 사항 없음, 알 수 없음, 비어 있음

# favorite_food 테이블 생성
create table favorite_food 
	(person_id smallint unsigned,
	food varchar(20),
	constraint pk_favorite_food primary key (person_id, food),
	constraint fk_fav_food_person_id foreign key (person_id)
	references person(person_id)
);
# primary key(person_id, food)
# 2개의 primary key 설정
# constraint fk_fav_food_person_id foregin key (person_id)
# 외래 키(foreign key) 제약 조건
# favorite_food 테이블에서 person_id의 값에 person 테이블에 있는 값만 포함되도록 제한
# references 테이블이름 (필드이름)
# 현재 테이블에서 참조되는 다른 테이블 이름 및 필드 이름 명시

# favorite_food 테이블 확인
desc favorite_food;
# DBeaver에서 엔티티 관계도 확인
# 두 테이블의 참조 현황

# 테이블 수정 (alter)
# 테이블 수정: alter
# 숫자 키 데이터 생성
# MySQL: 자동 증가(auto-increment) 기능 제공
# foreign key로 설정된 부분은 다른 테이블에서 변경시 에러 발생
# 제약 조건 비활성화 > 테이블 수정 > 제약 조건 활성화
# SQL 명령어로 수정
set foreign_key_checks=0;  # 제약 조건 비활성화
alter table person modify person_id smallint unsigned auto_increment;
set foreign_key_checks=1; # 제약 조건 활성화
# DBeaver의 Properties에서 변경
# person_id에 null값을 주면, 자동으로 1부터 증가됨

# 숫자 키 데이터 생성
# 표에서 가장 큰 값을 확인하고 값을 추가
# 데이터베이스 서버가 값을 제공

# person 테이블의 person_id 재정의
# person_id는 favorite_food에 외래키로 선정, 제약 조건 먼저 해제
# alter table 테이블명 modify 컬럼명 데이터타입 추가할내용;
set foreign_key_checks=0;
alter table person modify person_id smallint unsigned auto_increment;
set foreign_key_checks=1;

# 데이터 추가(insert)
# 데이터 추가: insert 문
# insert into 테이블이름 (열이름1, 열이름2, ...) values (값1, 값2, ...);
insert into person 
(person_id, fname, lname, eye_color, birth_date)
values (null, 'William','Turner','BR','1972-05-27');

# 데이터 확인:select 문
# select * from 테이블이름;
# 해당 테이블에서 모든 데이터(행, 컬럼) 데이터 출력
select * from person;

# 데이터 확인: select문
# 테이블의 특정 열의 데이터만 출력
# select 열이름1,열이름2,... from 테이블이름;
# select 열이름1,열이름2,... from 테이블이름 where 열이름=값;

# person_id,fname,lname,birth_date로 출력
select person_id,fname,lname,birth_date from person;

# lname의 값이 'Turner'인 데이터 중에서 person_id,fname,lname,birth_date 열만 출력
select person_id,fname,lname,birth_date
from person
where lname='Turner';

# 데이터 추가(insert)
# favorite_food 테이블에 데이터 추가
# 한 행씩 추가
insert into favorite_food (person_id, food)
values (1, 'pizza');

insert into favorite_food (person_id, food)
values (1, 'cookies');

insert into favorite_food (person_id, food)
values (1, 'nachos');

# 한 번에 여러 행 추가
# values(값1), (값2),...
insert into favorite_food (person_id, food)
values (1, 'pizza'), (1, 'cookie'), (1, 'nachos');

# favorite_food 테이블 데이터 확인
# order by 컬럼이름: 컬럼의 값을 알파벳 순서로 정렬
select food from favorite_food
where person_id=1
order by food;

# person 테이블에 다른 데이터 추가
insert into person 
(person_id, fname, lname, eye_color, birth_date, street, city, state, country, postal_code)
values (null, 'Susan','Smith','BL','1975-11-02','23 Maple St.','Arlington','VA','USA','20220');

# person 테이블 데이터 확인
select person_id, fname, lname, birth_date from person;
# person_id 필드에서 자동으로 2가 저장됨

# 데이터 수정(update)
# 데이터 수정: update 문
# update 테이블이름 set 필드이름1=값1, 필드이름2=값2,...
# where 필드이름=데이터값;
# Willian Turner의 정보 추가
# William Turner 의 자료 입력 과정에서 주소 정보는 입력하지 않았음
# UpDATE 문을 이용하여 주소 정보를 추가
update person 
set lname='doyoung'
where person_id=10;

select * from person;

# 데이터 삭제(delete) 
# 데이터 삭제: delete 문
# delete from 테이블이름 where 필드이름=데이터값;
# where 절을 생략하면 테이블의 모든 데이터 삭제
# 테이블은 삭제 되지 않음
delete from person where person_id=11;

# 테이블 삭제: DROP TABLE 문
# DROP TABLE 테이블 이름;
drop table person;
drop table favorite_food;

# 샤키라 데이터베이스
# 샤키라 데이터베이스
# MySQL에서 샘플로 제공하는 데이터베이스
# DVD 대여점 체인을 설계
# sakila 테이블 이름 및 정의
# 테이블명 / 정의
# film / 출시되어 대여할 수 있는 영화
# actor / 영화에 출연하는 배우
# customer / 영화를 보는 고객
# catefory / 영화 장르
# payment / 고객이 지불한 영화 대여료
# language / 영화배우들이 말하는 언어
# film_actor / 영화속 배우
# inventory / 대여 가능한 영화 여부

# sakila 데이터베이스에 포함된 테이블 확인
use sakila;

show tables;

# customer 테이블 구성 확인
desc customer;


# 데이터베이스와 SQL
# 3장. 쿼리 입문

# 목차
# 쿼리절
# select 절
# from 절
# where 절
# group by 절과 having 절
# order by 절

# 쿼리(query) 절
# select 문
# select문은 여러 개의 구성 요소 및 절(clause)로 구성
# clause(절) 이름         /      사용 목적
# select / 쿼리 결과에 포함한 열을 결정
# from / 데이터를 검색할 테이블과 테이블을 조인하는 방법을 식별
# where / 불필요한 데이터를 걸러냄 (조건식)
# group by / 공통 열 값을 기준으로 행을 그룹화함
# having / 불필요한 그룹을 걸러냄
# order by / 하나 이상의 열을 기준으로 최종 결과의 행을 정렬

# select 절
# select 절
# 최종 결과셋에 포함할 항목(열)을 결정
select * from language;
# * (asterist): 모든 열을 지정
# language 테이블의 모든 열과 모든 행의 결과를 보여줌

# 일부 열(columns)만 검색
select language_id, name, last_update from language;
select name from language;

# select절에 추가할 수 있는 항복
# 숫자 또는 문자열
# 표현식
# 내장 함수 호출 및 사용자 정의 함수 호출
select language_id,
	'COMMON' language_usage,     # 가상 컬럼
	language_id*3.14 lang_pi_value,    # 열의 별칭
	upper(name) language_name
from language;


# 열의 별칭(alias)
# 열의 레이블을 지정할 수 있음
# 출력을 이해하기 쉽게 함
# as 키워드 사용: 가독성 향상
select language_id,   # as 키워 사용
	'COMMON' as language_usage,
	language_id*3.14 as lang_pi_value,
	upper(name) as language_name
from language;

select * from film_actor;

# 중복 제거
select actor_id
from film_actor
order by actor_id;
# 동일한 배우가 여러 영화에 출현: 중복된 actor_id 발생
# all 키워드: 기본값, 명시적으로 지정할 필요가 없음
# distinct 키워드 사용: 중복 제거
select distinct actor_id
from film_actor
order by actor_id;    # distinct 결과 - 데이터 정렬이 먼저 이루어짐(시간 소요)

# from 절
# from 절 역할
# 쿼리에 사용되는 테이블을 명시
# 테이블을 연결하는 수단

# 테이블 유형: from 절에 포함
# 영구 테이블(permanent table)
# crete table 문으로 생성

# 파생 테이블(derived table)
# 하위 쿼리(subquery)에서 반환하고 메모리에 보관된 행들

# 임시 테이블(temporary table)
# 메모리에 저장된 휘발성 데이터

# 가상 테이블(virtual table)
# create view문으로 생성

# 파생 테이블
# subquery(서브 쿼리)
# from 절에 위치함 select문(서브 쿼리)은 실행 결과로 테이블을 생성: 파생 테이블
# 즉, 다른 테이블과의 상호작용을 할 수 있는 파생 테이블을 생성
# select ... from (subquery) [as] tbl_name ...
select concat(cust.last_name, ', ', cust.first_name) as full_name
from (select first_name, last_name, email
	from customer
	where first_name='JESSIE'    # 서브 쿼리 (subquery)
)as cust;   # 서브 쿼리의 별칭(cust)
# concat(문자열1, 문자열2, ...): 둘 이상의 문자열을 순서대로 합쳐서 반환

# 임시 테이블
# 휘발성의 테이블: 데이터베이스 세션이 닫힐 때 사라짐
create temporary table actors_j    # 임시 테이블 (actors_j) 생성
	(actor_id smallint(5),        # smallint(5) - 화면출력시 5자리 맞춤
	first_name varchar(45),
	last_name varchar(45)
);

insert into actors_j
select actor_id, first_name, last_name
from actor where last_name like 'J%';    
# actor 테이블에서 'J'로 시작하는 데이터를 찾아서 actors_j 임시 테이블에 저장

select * from actors_j;	

# 가상 테이블(View)
# SQL 쿼리의 결과 셋을 기반으로 만들어진 가상 테이블
# 실제 데이터가 저장되는 것이 아닌, view를 통해 데이터를 관리
# 복잡한 쿼리문을 매번 사용하지 않고 가상 테이블로 만들어서 쉽게 접근함
# create view [뷰이름] as 
# select [컬럼명1] ... 
# from [테이블명]

create view cust_vw as
select customer_id, first_name, last_name, active
from customer;
# 생성된 가상 테이블(view)는 DBeaver의 Views에서 확인 가능

# 가상 테이블(view)
select first_name, last_name
from cust_vw
where active=0;  # 이미 만들어진 가상 테이블에서 쿼리를 수행함

# 가상 테이블 삭제
# drop view 뷰이름;
drop view cust_vw;

# where 절
# 테이블 연결
# join(inner join)
# 두 개 이상의 테이블을 묶어서 하나의 결과 집합을 만들어 내는 것
-- select <열 목록>
-- from <기준 테이블> [inner] join <참조할 테이블>
-- 	on <조인 조건>
-- [where 검색 조건]
select customer.first_name, customer.last_name, time(rental.rental_date) as rental_time
from customer inner join rental  # 연결할 테이블
	on customer.customer_id = rental.customer_id   # 연결(join) 조건
where date(rental.rental_date)='2005-06-14';
# 결합 조건(on)
# customer 테이블의 customer_id와 rental 테이블의 customer_id의 값이 일치하는 경우에만 데이터를 가져옴

# where 절
# 테이블 연결
# customer 테이블과 rental 테이블 확인
# 두 테이블은 customer_id로 연결되어 있음
# datetime 데이터
# date() 함수
# datetime 데이터에서 date 정보(YYYY_MM_DD)만 추출
select date('2021-07-29 09:02:03');
# time() 함수
# time 정보(HH:MI:SS) 정보만 추출
select time('2021-07-29 09:02:03');

# 테이블 연결(inner join) 결과
select customer.first_name, customer.last_name, time(rental.rental_date) as rental_date
from customer inner join rental
	on customer.customer_id=rental.customer_id
where date(rental.rental_date)='2005-06-14';

# 테이블 별칭 정의
# 여러 테이블을 join할 경우, 테이블 및 열 참조 방법
# 테이블 이름 및 열 이름 사용
# 각 테이블의 별칭을 할당하고 쿼리 전체에서 해당 별칭을 사용
 # as 키워드 사용
select c.first_name, c.last_name, time(r.rental_date) rental_date
from customer inner join rental
	on c.customer_id=r.customer_id 
where date(r.rental_date)='2005-06-14';
# as 키워드 추가
select c.first_name, c.last_name, time(r.rental_date) as rental_time
from customer as c inner join rental as r 
	on c.customer_id=r.customer_id 
where date(r.rental_date)='2005-06-14';

# where 절
# 필터 조건: 조건에 맞는 행의 데이터만 가져옴
# and, or, not 연산자 사용
select title
from film
where rating='G' and rental_duration >= 7;
# 필터 조건: film 테이블에서 rating이 G등급이고, rental_duration이 7이상

# where절 검색 조건
# and, or 사용
# G등급이면서 7일 이상 대여할 수 있거나, PG-13 등급이면서 3일 이내로 대여할 수 있는 영화 목록
select title, rating, rental_duration
from film
where (rating='G' and rental_duration >= 7)
or (rating='PG-13' and rental_duration < 4);

# Group by절과 having절
# group by
# 열(column)의 데이터를 그룹화
# select 컬럼 from 테이블 group by 그룹화할 컬럼;

# having
# 특정 열을 그룹화한 결과에 조건을 설정 (그룹화 이후에 수행되는 조건)
# where: 그룹화 하기 전 필터링 조건
select c.first_name, c.last_name, count(*)
from customer as c 
	inner join rental as r 
	on c.customer_id = r.customer_id 
group by c.first_name, c.last_name 
having count(*) >= 40;
# count(*): 그룹화 한 전체 행의 수

# Order by 절
# order by 절
# order by [컬럼명] [asc|desc]
# 지정된 컬럼(열)을 기준으로 결과를 정렬(다중 컬럼인 경우, 왼쪽부터 정렬)
# 오름차순(asc): 기본 정렬 값, 내림차순(desc)
select c.first_name, c.last_name, time(r.rental_date) as rental_time
from customer as c inner join rental as r 
	on c.customer_id=r.customer_id 
where date(rental_date)='2005-06-14'
order by c.last_name, c.first_name asc;
# 영화 대여 고객의 last_name을 기준으로 정렬
# 오름차순 정렬 (asc는 생략 가능)
# 고객 중 last_name이 동일한 경우,
# first_name으로 다시 정렬

# 내림차순 정렬:desc
select c.first_name, c.last_name, time(r.rental_date) as rental_time
from customer as c inner join rental as r 
	on c.customer_id=r.customer_id 
where date(rental_date)='2005-06-14'
order by time(r.rental_date) desc;   # 대여 시간(rental_time)을 기준으로 내림차순 정렬

# 순서를 통한 정렬
# order by 다음에 정렬 기준이 되는 컬럼의 순서(index)를 사용
select c.first_name,c.last_name,time(r.rental_date) as rental_time
from customer as c inner join rental as r 
	on c.customer_id=r.customer_id 
where date(r.rental_date)='2005-06-14'
order by 1 desc;
# fist_name 컬럼의 index(1)를 기준으로 내림차순 정렬

# 연습문제
# 실습 3-1
# actor 테이블에서 모든 배우의 actor_id, first_name,last_name을 검색하고 last_name,first_name을 기준으로 오름차순 정렬
select actor_id,first_name,last_name
from actor
order by last_name,first_name asc;
# last_name이 동일한 경우, first_name 순으로 정렬

# 실습 3-2
# 성이 'williams' 또는 'davis'인 모든 배우의 actor_id,first_name,last_name을 검색
select actor_id,first_name,last_name
from actor
where last_name='WILLIAMS' or last_name='DAVIS';

# 실습 3-3
# rental 테이블에서 2005년 7월 5일 영화를 대여한 고객 ID를 반환하는 쿼리를 작성하고, date()함수로 시간 요소를 무시
select distinct customer_id
from rental
where date(rental_date)='2005-07-05';

# 3.8 연습문제
# 다음 결과를 참고하여 다중 테이블의 쿼리를 채우세요.
select c.store_id, c.email,r.return_date
from customer as c inner join rental as r 
	on c.customer_id=r.customer_id 
where date(r.rental_date)='2005-06-14'
order by return_date desc;



# 데이터베이스와 SQL
# 4장. 필터링
# 목차
# 조건 평가
# 조건 작성
# 조건 유형
# Null

# 조건 평가
# where 절 
# and 또는 or 연산자로 하나 이상의 조건을 포함
# and: 모든 조건이 true 
where first_name='STEVE' and create_date > '2006-01-01'
# or: 조건 중 하나만 true이면, 해당 조건은 true 
where first_name='STEVE' or create_date > '2006-01-01'
# 괄호 사용
# 여러 개의 조건을 포함하는 경우, 괄호를 써서 의도를 명확히 표현
where (first_name='STEVE' or last_name='YOUNG')
and create_date > '2006-01-01'

# not 연산자
where not (first_name='STEVE' or last_name='YOUNG')
and create_date > '2006-01-01'
# 2006년 1월 1일 이후에 기록이 생성된 사람 중에 이름이 steve이거나 성이 young이 아닌 행만 검색

# not 연산자로 <> 사용
where first_name <> 'steve' and last_name <> 'young'
and create_date > '2006-01-01'

# 조건 작성
# 조건 작성
# 하나 이상의 연산자와 결합된 표현식으로 구성
# 표현식
# 숫자
# 테이블 또는 뷰의 열
# 문자열
# concat()과 같은 내장 함수
# 서브 쿼리
# ('boston','new york', 'chicago')와 같은 표현식 목록
# 조건 연산자
# 비교 연산자:=,!=,<,>,<>,like,in,between 
# 산술 연산자:+,-,*,/

# 조건 유형
# 동등 조건(equality condition):'열=표현/값'
select c.email
from customer as c inner join rental as r 
	on c.customer_id=r.customer_id   # 2개의 동등 조건
where date(r.rental_date)='2005-06-14';  # 2개의 동등 조건
# 2005년 6월 14일에 영화를 대여한 모든 고객의 이메일 주소 출력

# 부등 조건(inequality condition): 두 표현이 동일하지 않음
# <> 또는 != 사용
select c.email
from customer as c inner join rental as r 
	on c.customer_id=r.customer_id 
where date(r.rental_date) <> '2005-06-14';  # 부등 조건
# 2005년 6월 14일 이외의 날짜에 영화를 대여한 사람들의 이메일 주소

# 동등/부등 조건 사용 예
# 데이터를 수정할 때 사용
delete from rental 
where year(rental_date)=2004;

delete from rental 
where year(rental_date)<>2005 and year(rental_date)<>2006;

# 범위 조건
# 해당 식이 특정 범위 내에 있는지 확인
select customer_id, rental_date
from rental
where rental_date < '2005-05-25';
# 해당 날짜만 검색: date(rental_date)='2005-05-25'
select customer_id, rental_date
from rental 
where rental_date<='2005-06-16'
and rental_date>='2005-06-14';   # 범위 조건(2005년 6월 14일 00:00:00~2005년6월16일 00:00:00)
# rental_date 컬럼은 datetime 속성으로 날짜와 시간은 같이 포함
# 2005-06-16은 포함되지 않음(시간 정보 때문)

# 범위 조건
# 2005년 6월 14일부터 6월 16일까지의 데이터를 출력하기 위해
# date(rental_date)를 사용: 정확한 날짜만 추출
select customer_id, rental_date
from rental
where date(rental_date)>='2005-06-14'
and date(rental_date)<='2005-06-16';

# between 연산자
# between [범위의 하한값] and [범위의 상한값]
select customer_id, rental_date
from rental
where rental_date between '2005-06-14' and '2005-06-16';
# 숫자 범위 사용
# 하한값과 상한값이 범위에 포함됨
select customer_id, payment_date,amount
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
# 컬럼명 in (값1,값2,...)
# 지정한 컬럼의 값이 특정 값에 해당되는 조건을 만들 때 사용(or 대신 사용)
select title, rating
from film
where rating='G' or rating='PG';

select title, rating
from film 
where rating in ('G','PG');

# 서브 쿼리 사용
# 값의 집합을 생성 할 수 있음
select title, rating
from film 
where rating in (select rating from film where title like '%PET%');

# 서브 쿼리 내용
# 'PET'을 포함하는 영화 제목을 찾고, 그 영화 제목의 rating을 반환('P','PG')
# 'PET%': PET로 시작하는 단어
# '%PET': PET로 끝나는 단어
# '%PET%': PET를 포함하는 단어
select title, rating
from film 
where title like '%PET%';

# where 절 내용
where rating in ('G','PG');

# not in 사용
# 표현식 집합 내에 존재하지 않음
select title, rating
from film
where rating not in ('PG-13','R','NC-17')
# NOT IN('pg-13','r','nc-17')
# 영화 등급이 'pg-13','r','nc-17'이 아닌 모든 영화를 찾음

# 일치 조건
# 문자열 부분 가져오기
# left(문자열, n)
# 문자열의 가장 왼쪽부터 n개 가져옴
select left('abcdefg',3);
# mid(문자열,시작 위치, n)
# substr(문자,시작 위치,n)도 동일한 기능 수행
select mid('abcdefg',2,3);
select substr('abcdefg',2,3);
# rigth(문자열,n)
# 문자열의 가장 오른쪾부터 n개 가져옴
select right('abcdefg',2);
# 와일드 카드
# '_': 정확히 한 문자(underscore)
# '%': 개수에 상관없이 모든 문자 포함
# 일치 조건(matching condition)
# 와일드 카드 사용시 like 연산자를 사용
select last_name, first_name
from customer
where last_name like '_A_T%S';
# '_A_T%S'
# 두 번째 위치에 'A',네 번째 위치에 'T'를 포함하며 마지막은 'S'로 끝나는 문자열
select last_name, first_name
from customer
where last_name like 'Q%' or last_name like '%Y';
# last_name이 'Q'로 시작하거나 'Y'로 시작하는 고객 이름 검색

# 정규 표현식 사용
# '^[QY]': Q또는 Y로 시작하는 단어 검색
select last_name, first_name
from customer
where last_name regexp '^[QY]';

# Null
# null값의 다양한 경우
# 해당 사항 없음
# 아직 알려지지 않은 값
# 정의되지 않은 값
# null 확인 방법
# is null 사용(=null)
select rental_id, customer_id, return_date
from rental
where return_date is null;

# is not null
# 열에 값이 할당되어 있는 경우(null이 아닌 경우)
select rental_id, customer_id, return_date
from rental
where return_date is not null;

# null과 조건 조합
# 2005년 5월에서 8월 사이에 반납되지 않은 대여 정보 검색
# 반납이 되지 않은 경우, 반납 날짜의 값이 null
# 또는 반납 날짜가 2005년5월~2005년8월 사이가 아닌 경우
select rental_id, customer_id, return_date
from rental
where return_date is null 
or return_date not between '2005-05-01' and '2005-08-31';

# 실습
# 서브셋 조건 설정
# 실습 4-1 서브셋
select payment_id, customer_id, amount, date(payment_date) as payment_date
from payment 
where (payment_id between 101 and 120);

# 실습 4-1
# 아래의 필터 조건에 따라 반환되는 payment_id는 무엇입니까?
# customer_id가 5가 아니고
# amount가 8보다 크거나 payment_date가 2005년 8월 23일인 경우
select payment_id,customer_id,amount,date(payment_date) as payment_date
from payment
where (payment_id between 101 and 120)
and (customer_id != 5) and (amount>8 or date(payment_date)='2005-08-23');
# payment_id는 101, 107

# 실습4-2
# 다음 필터조건에 따라 반환되는 payment_id는 무엇입니까?
# customer_id는 5이고
# amount가 6보다 크거나 payment_date가 2005년6월19일이 아닌 payment_id
select payment_id, customer_id, amount, date(payment_date) payment_date
from payment 
where customer_id=5
and not (amount>6 or date(payment_date) = '2005-06-19');

# 실습 4-3
# payments 테이블에서 금액이 1.98,7.98 또는 9.98인 모든 행을 검색하는 쿼리
select amount
from payment
where amount in (1.98,7.98,9.98);