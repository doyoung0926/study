#--------------------------------------------------------
#모듈(Module): 하나의 파이썬(.py) 파일
#             특정 목적에 관련된 변수, 함수, 클래스 존재
#             필요한 파일에서 사용 가능함
#사용법=>import 모듈명
#--------------------------------------------------------
#모듈 포함 하기--------------------------------------------
#import math as m  #이제부터는 math를 m으로 하겠다. ,math 하면 못찾음
# from math import *
# import math
import ex_func

def factorial(num):
    print(f'My Factorial-{num}')

#모듈 안에 기능 사용하기-------------------------------------
print(factorial(10))
print(ex_func.YEAR, ex_func.printYear())



# ADDR_LIST 없앨 수 있으면 없애고
# 초기화 가능하면 하기
#파일명 저장리스트 존재 여부 선택 쓰고 싶으면 쓰고 아니면 지워도 되고
#처음에 폴더 없으니까 addressBook 만들고
#프로그랭 종료해도 다시 데이터 돌아오도록하기
