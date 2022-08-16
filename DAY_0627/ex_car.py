#-------------------------------------------------------------
# 현대 자동차를 표현하는 데이터 타입 즉 class 생성
# 클래스명 : car
# 속성/특징 : 제조사, 차번호, 차종류, 색상
#           -> 클래스 변수 :
#           -> 인스턴스 변수 :
# 역할/기능 : 이동한다, 정지한다, 차정보 출력한다.
#           -> 이동한다 => ooo 자동차가 xx에서 xx로 간다.
#           -> 정지한다 => ooo 자동차가 xxx에 정지한다.
#           -> 차정보출력한다. => 제조사, 차종류, 차번호
#-------------------------------------------------------------
class car:
    # 클래스 변수
    brand = '현대'
    # 인스턴스 객체 생성 및 초기화 함수
    def __init__(self, carNum, carType, carColor):
        self.carNum=carNum
        self.carType=carType
        self.carColor=carColor

    # car 클래스 기능 및 역할 메서든
    def move(self, start, end):
        print(f'{self.carNum}자동차가 {start}에서 {end}로 이동한다.')

    def stop(self, target):
        print(f'{self.carNum}자동차가 {target}에 정지한다.')

    def displayInfo(self):
        print(f'번호: {self.carNum}')
        print(f'종류: {self.carType}')
        print(f'색상: {self.carColor}')
        print(f'제조사: {car.brand}')

# 자동차 데이터 저장 => 자동차 인스턴스 생성 => 클래스() -- __init__()
myCar=car(1234,'suv','hotpink')
myCar.move('경북대학교','경주')
myCar.displayInfo()

# -------------------------------------------------------------------
#
# class car:
#     zezo ='현대'
#     def __init__(self, carNum, carStyle, carColor):
#         self.carNum=carNum
#         self.carStyle=carStyle
#         self.carColor=carColor
#
#     def move(self, go, home):
#         print(f'{self.carNum} 자동차가 {go}에서 {home}로 간다.')
#
#     def stop(self, location):
#         print(f'{self.carNum} 자동차가 {location}에 정지한다.')
#
#     def carInfo(self):
#         print(f'제조사 : {car.zezo}')
#         print(f'차종류 : {self.carStyle}')
#         print(f'차번호 : {self.carNum}')
#
#
# car1=car(1234, 'a','a')
# car1.carInfo()
# car1.move('부산','대구')
#
#
#

#
#
#
# ---------------------------------------------------------
# # 숫자 10개 저장하기
# nums=[]
# for n in range(10):
#     nums.append(str(input("enter number:")))


# ---------------------------------------------------------
# 정수 10 => car 데이터 10개 저장
# nums=[]
# for n in range(10): nums.append(n*10)
#
# cars=[]
# for n in range(10):
#     num, type, color = input('차번호, 차종류, 차색상: ').split(',')
#     cars.append(car(num, type, color))
# 
# for car in cars:
#     print(f'{car.carNum}')
#     car.displayInfo()