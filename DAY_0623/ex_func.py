#--------------------------------------------------------------------
#함수(function):자주 사용되는 기능을 묶어서 이름을 붙여 놓은 것
# -코드 재사용 위한 것
# 형태
# def 함수명(재료,......,재료n):
#     코드
#     코드
#     return 결과
#--------------------------------------------------------------------
#--------------------------------------------------------------------
#기능:숫자 2개 더한 후 결과 돌려주는 기능
#함수명:addTwo
#재료(매개변수):num1 num2
#결과(반환값):더한 값
#HISTORY:2022-04-03 So create
#       :2022-04-21 Park create
#--------------------------------------------------------------------
def addTwo(num1=0,num2=0):  #값을 안 넣으면 (0,0)으로 됨 디폴트함수
    '''
    숫자 2개 더한 후 결과 반환
    :param num1: int
    :param num2: int
    :return: int
    '''
    value=num1+num2
    return value
#--------------------------------------------------------------------
#가변인자 함수=>매개변수 0개~N개
#--------------------------------------------------------------------
def addNum(*nums):
    # print(f'nums type:{type(nums)}')
    total=0
    for num in nums:
        total+=num
    return total
#--------------------------------------------------------------------
#기능:평균 구하는 함수
# 함수명:getAvg
# 파라미터:과목명-점수 유동적=>**subjects
#반환값(리턴값):평균---float
#--------------------------------------------------------------------
def getAvg(**subjects):
    # print(f'subjects type:{type(subjects)}')
    values=subjects.values()
    total=0
    for value in values: total=total+value
    print(f'total=>{total},message=>{message}')
    return total/len(values) if len(values)>0 else '0으로 나눌 수 없음'

message='Good'

#함수 사용하기=>함수 호출

print(getAvg())





# print(getAvg(국어=12,영어=98,수학=88))    #따옴표 안됨, 등호로 사용
# print(getAvg(영어=98,수학=88))  #숫자 key 안됨
# print(getAvg())
#
# print(addTwo(10,9))
# print(addTwo(), end='*')
# #--------------------------------------------------------------------
# #함수(function)의 데이트 타입=>class function
# #--------------------------------------------------------------------
# print(type(addTwo),id(addTwo))
#
# list=[addTwo,getAvg]
# print(list[0](1,2))
# print(list[1](국어=12,영어=98,수학=88))





result=addTwo(10,20)
#addTwo(10)
print(addNum(10))
print(addNum(1,1,1,1,1,1,1))
print(addNum())


#화면에 출력하기=>print(데이터)
print(result)

#--------------------------------------------------------------------
# 기능:문자 2개 더하는 기능의 함수
# 함수명:addStr
# 재료:data1 data2
# 반환:더한 결과
#--------------------------------------------------------------------
def addStr(data1,data2):
    return data1+data2

# def addStr(data1,data2):
#     result=data1+data2
#     return result
#--------------------------------------------------------------------
# 기능:문자 2개 더하는 기능의 함수
# 함수명:addStr
# 재료:data1 data2
# 반환:없음
#--------------------------------------------------------------------
# def addStr(data1,data2):
#     print(data1+data2)

print(addStr('Good','Happy'))

# data=addStr('Good','Happy')
# data.upper()
#--------------------------------------------------------------------
# 기능:원하는 단의 구구단을 출력하는 기능의 함수
# 함수명:displayGuGu
# 재료:num
# 반환:없음
#--------------------------------------------------------------------
def displayGuGu(num):
    #2*1=2
    for i in range(1,10):
        print(f"{num}*{i}={num*i}")

#--------------------------------------------------------------------
# 기능:원하는 단의 구구단을 출력하는 기능의 함수
# 함수명:displayGuGu
# 재료:num
# 반환:구구단 결과
#--------------------------------------------------------------------
