# 데이터베이스와 sql
# 2장. 데이터베이스 생성과 데이터 추가
# 목차
# mysql 명령줄 도구 사용 방법
# MySQL 자료형
# 테이블 생성
# 테이블 수정
# MySQL 명령줄 사용 방법
# MySQL 8.0 Command Line Client 또는 DBeaver 실행
# Enter password: 패스워드 입력
# 사용 가능한 데이터 베이스 확인
show databases;

# 샤키라 데이터 베이스 선택
use sakila;
database changed

# DBeaver에서 새 SQL 편집기 메뉴 선택 후 직접 입력
# 명령행 한 줄 실행: 명령어를 블럭 설정 후 Ctrl + Enter키 입력

# 현재 날짜와 시간 정보 출력 쿼리
select now();
# DBeaver에서 실행한 화면

# MySQL 자료형
# 문자 데이터
# 고정 길이 또는 가변 길이 문자열 저장
# char(20): 고정 길이 문자열 (최대 255 바이트)
# varchar(20): 가변 길이 문자열 (최대 65,535 바이트)

# 캐릭터 셋
# 사용 언어에 따라 크기가 다름
show character set;  # utf8mb4가 MySQL 8 버전의 기본 캐릭터셋

# 텍스트 데이터
# varchar의 제한을 초과하는 데이터를 저장하는 자료형
# 자료형 / 최대 바이트 크기
# tinytext / 255(1바이트)
# text / 65535(2바이트)
# mediumtext / 16777215 (24바이트)
# longtext / 4294967295 (32바이트)
# 최대 크기를 초과하는 경우, 데이터가 잘려서 저장
# text 자료형과 varchar 자료형의 크기가 동일함

# 숫자 데이터
# 정수 자료형
# 자로형 / 부호가 있는 정수 저장값의 범위 / 부호가 없는 정수 저장값의 범위
# tinyint / -128 ~ 127 / 0 ~ 255
# smallint / -32768 ~ 32767 / 0 ~ 65535
# mediumint / -8388608 ~ 8388607 / 0 ~ 1677215
# int / -2147483648 ~ 2147483647 / 0 ~ 4294967295
# bigint / -2^63 ~ 2^63 -1 / 0 ~ 2^64 -1
# 부동 소수점
# 자료형 / 숫자 범위
# float(p,s) / -3.402823466x10^38 ~ 3.402823466x10^38
# double(p,s) / -1.7976931348623157x10^308 ~ 1.7976931348623157x10^308
# 시간 데이터
# 자료형 / 기본 형식 / 허용값
# data / YYYY-MM-DD / 1000-01-01 ~ 9999-12-31
# datetime / YYYY-MM-DD HH:MI:SS / 1000-01-01 00:00:00.000000 ~ 9999-12-31 23:59:59.999999
# timestamp / YYYY-MM-DD HH:MI:SS / 1970-01-01 00:00:0000000 ~ 2038-01-18 22:14:07.999999
# year / YYYY / 1901 ~ 2155
# time / HHH:MI:SS / -838:59:59.000000 ~ 838:59:59.000000
# 날짜 형식의 구성 요소
# 자료형 / 기본 형식 / 허용값
# YYYY / 연도 / 1000~ 9999
# MM / 월 / 01(1월) ~ 12(12월)
# DD / 일 / 01 ~ 31
# HH / 시간 / 00 ~ 23
# MI / 분 / 00 ~ 59
# SS / 초 / 00 ~ 59

# datetime과 timestamp비교
# datetime과 timestamp 비교 테이블
#   / datetime / timestamp
# 데이터 저장 타입 / 문자형 / 숫자형
# 저장 공간 / 8bytes / 4bytes
# 자동 입력 여부 / X / O
# 타임존 영향 / X / O (UTC로 변환)
# timestamp는 데이터를 입력하거나 수정하면 자동으로 시간 정보가 입력

# 테이블 생성
# DBeaver로 MySQL접속
# 연습용 database 생성: testdb
create database testdb;

# 새롭게 생성한 testdb 선택
use testdb;

# 2.4 테이블 생성
# person 테이블 생성
create table person 
	(person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	eye_color enum('BR','BL','GR'),
	birth_date DATE,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
	constraint pk_person primary key (person_in)     # 기본 키 제약 조건
);

# constraint [제약 조건 이름] primary key (필드이름)
# 기본 키(primary key)로 person_id 열을 선정
# NOT NULL과 UNIQUE 제약 조건의 특징을 가짐
# 제약 조건(constraint)
# 데이터의 무결성을 지키기 위해, 데이터를 입력 받을 때 실행되는 검사 규칙

# person 테이블 확인
desc person;

# Null 항목
# 특정 열의 데이터 생략 여부
# NO: person_id 필드는 primary key이므로 반드시 값이 입력되어야 함
# Null값의 의미: 해당 사항 없음, 알 수 없음, 비어있음

# favorite_food 테이블 생성
create table favorite_food 
	(person_id smallint unsigned,
	food varchar(20),
	constraint pk_favorite_food primary key (person_id, food),
	constraint fk_fav_food_person_id foreign key (person_id)
	references person(person_id)
);

drop table favorite_food;

# primary key(person_id, food)
# 2개의 primary key 설정
# constraint fk_fav_food_person_id foreign key (person_id)
# 외래 키(foreign key) 제약 조건
# favorite_food 테이블에서 person_id의 값에 person 테이블에 있는 값만 포함되도록 제한
# references 테이블이름 (필드이름)
# 현재 테이블에서 참조되는 다른 테이블 이름 및 필드 이름 명시

# favorite_food 테이블 확인
desc favorite_food;

# DBeaver에서 엔티티 관계도 확인
# 두 테이블의 참조 현황

# 2.5 테이블 수정 (ALTER)
# 테이블 수정: ALTER
# 숫자 키 데이터 생성
# MySQL: 자동 증가(auto-increment) 기능 제공
# foreign key로 설정된 부분은 다른 테이블에서 변경시 에러 발생.
# 제약 조건 비활성화 -> 테이블 수정 -> 제약 조건 활성화
# SQL 명령어로 수정
 set foreign_key_checks=0; # 제약 조건 비활성화
 alter table person modify person_id smallint unsigned auto_increment;
 set foreign_key_checks=1; # 제약 조건 활성화
 
 # DBeaver의 Properties에서 변경
 # person_id에 Null값을 주면, 자동으로 1부터 증가됨
 
 # 숫자 키 데이터 생성
 # 표에서 가장 큰 값을 확인하고 값을 추가
 # 데이터베이스 서버가 값을 제공
 
 # person 테이블의 person_id 재정의
 # person_id favorite_food에 외래키로 선정, 제약 조건 먼저 해제
 # alter table 테이블명 modify 컬럼명 데이터 타입 추가할내용;
 set foreign_key_checks=0;
 alter table person modify person_id smallint unsigned auto_increment;
 set foreign_key_checks=1;
 
desc person;

# 2.5 데이터 추가 (INSERT)
# 데이터 추가: insert 문
# insert into 테이블이름 (열 이름1, 열 이름2, ...) values (값1, 값2, ...);
insert into person
(person_id, fname, lname, eye_color, birth_date)
values (null, 'William','Turner','BR','1972-05-27');

# 데이터 확인: select 문
# select * from 테이블이름;
# 해당 테이블에서 모든 데이터(행, 컬럼) 데이터 출력
select * from person;

# 데이터 확인: select 문
# 테이블의 특정 열의 데이터만 출력
# select 열 이름1, 열 이름2, ... from 테이블이름;
# select 열 이름1, 열 이름2, ... from 테이블이름 where 열이름=값;

# person_id, fname, lname, birth_date로 출력
select person_id, fname, lname, birth_date from person;

# lname의 값이 'Turner'인 데이터 중에서 person_id, fname, lname, birth_date 열만 출력
select person_id, fname, lname, birth_date
from person where lname = 'Turner';

# favorite_food 테이블에 데이터 추가
# 한 행씩 추가
insert into favorite_food (person_id, food)
values (1, 'pizza');

insert into favorite_food (person_id, food)
values(1, 'cookies');

insert into favorite_food (person_id, food)
values (1, 'nachos');

# 한번에 여러 행 추가
# values(값,1), (값,2), ...;
# insert into favorite_food (person_id, food)
# values (1, 'pizza'), (1, 'cookie'), (1, 'nachos');


select * from favorite_food;

# favorite_food 테이블 데이터 확인
# order by 컬럼이름: 컬럼의 값을 알파벳 순서로 정렬
select food from favorite_food ff 
where person_id = 1 order by food;

# person 테이블에 다른 데이터 추가
insert into person
(person_id, fname, lname, eye_color, birth_date,
street, city, state, country, postal_code)
values (null, 'Susan', 'Smith', 'BL', '1975-11-02',
'23 Maple St.', 'Arlington', 'VA', 'USA', '20220');

# person 테이블 데이터 확인
select person_id, fname, lname, birth_date from person;
# person_id 필드에 자동으로 2가 저장됨

# 2.5 데이터 수정(UPDATE)
# update 테이블이름 set 필드이름1=값1, 필드이름2=값2, ...
# where 필드이름=데이터값;
# William Turner의 정보 추가
# William Turner의 자료 입력 과정에서 주소 정보는 입력하지 않았음
# update 문을 이용하여 주소 정보를 추가
update person 
set street='1225 Tremon St.',
	city='Boston',
	state='MA',
	country='USA',
	postal_code='02138'
where person_id=8;

select * from person;

# 데이터 삭제(DELETE)
# 데이터 삭제: delete 문
# delete from 테이블이름 wher 필드이름=데이터값;
# where 절을 생략하면 테이블의 모든 데이터 삭제
# 테이블은 삭제되지 않음
delete from person where person_id=2;

select * from person;

# 테이블 삭제: drop table 문
# drop table 테이블이름;

# 2.7 샤키라 데이터베이스
# 샤키라 데이터베이스
# MySQL에서 샘플로 제공하는 데이터베이스
# DVD 대여점 체인을 설계


use sakila;
# sakila 데이터 베이스에 포함된 테이블 확인
show tables;

# customer 테이블 구성 확인
desc customer;