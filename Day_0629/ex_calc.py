# -------------------------------------------------------------------------
# 계산기 프로그램
# 필수 조건 : 계산기 클래스
# 속성/필드/변수 : 제조사, 색상, 데이터
# 역할/기능     : 더하기(), 빼기(), 곱하기(), 나누기(), 메뉴출력()
# -------------------------------------------------------------------------
class Calculator:

    # 인스턴스 생성자
    def __init__(self, maker, color, *data):            # 가변인자는 튜플로 받음 0개~N개
        self.maker=maker
        self.color=color
        self.data=data

    # getter/setter메서드 (선택)
    def getData(self): return self.data
    def setData(self, *data): self.data = data

    # 내가 원하는 계산기 기능 -------------------------------------------------
    def plus(self):
        print(f'plus => {self.data}')


    def minus(self):
        print(f'plus => {self.data}')

    # 계산 데이터 입력받는 메서드


    # 사용자 인터페이스(CUI) 기능 메서드
    def showUI(self):
        print("***** 계산기 *****")
        print("1. 덧셈")
        print("2. 뺄셈")
        print("3. 종료")
        print("*****************")
# 기능 관련 함수 ----------------------------------------------

def getNumbers():
    nums=[]
    while True:
        num=input('계산 할 숫자 입력(종료 Q/q) : ')
        if num in ['q','Q']: break
        nums.append(int(num))
    return nums

# -------------------------------------------------------------------------
# 계산기 프로그램 구동하는 함수 ------------------------------
def playApp():
    calcApp=Calculator('Sharp','Pink')

    print('---------------START--------------')
    while True:
        calcApp.showUI()
        select= input("메뉴 선택")
        if select == '5' : break
        elif select == '1':
            calcApp.setData(getNumbers())
            print(f'덧셈 결과 : {calcApp.plus()}')
        elif select == '2':
            calcApp.setData(getNumbers())
            print(f'뺄셈 결과 : {calcApp.plus()}')
            calcApp.plus()
        elif select == '1':
            calcApp.setData(getNumbers())
            print(f'덧셈 결과 : {calcApp.plus()}')

        elif select == '1':
            calcApp.setData(getNumbers())
            print(f'덧셈 결과 : {calcApp.plus()}')