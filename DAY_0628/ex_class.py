# -----------------------------------------------------------------------
# 벽돌깨기 프로그램 만들기
# -----------------------------------------------------------------------
# 게임하는 사람의 정보를 저장하는 변수들 ---------------------------------------
# nickName=''
# level=0
# score=0
# lanking=0
#
# nickName2=''
# level2=0
# score2=0
# lanking2=0
#
# nickName3=''
# level3=0
# score3=0
# lanking3=0
#
# nickName4=''
# level4=0
# score4=0
# lanking4=0
player1=None
player2=None

class player:
    def __init__(self, nickname, level=0, score=0, lanking=0):
        self.nickname=nickname
        self.level=level
        self.score=score
        self.lanking=lanking

    # 클래스의 인스턴스 변수들의 값을 업데이트 또는 읽기 하는 메서드
    # set메서드 - get메서드
    def setNickname(self, nickName):
        self.nickname=nickName

    def setLevel(self, level):
        self.level=level

    def setScore(self, score):
        self.score=score

    def setLanking(self, lanking):
        self.lanking=lanking

    def setUpdate(self, level, score, lanking):
        self.level = level
        self.score=score
        self.lanking=lanking

    def getNickName(self):
        return self.nickname

    def getLevel(self):
        return self.level

    def getScore(self):
        return self.score

    def getLanking(self):
        return self.lanking


# 게임하는 사람의 정보 입력 받기 ----------------------------------------------
# 함수명 : setPlayer
# 파라미터 : 없음
# 반 환 값 : 없음
# -----------------------------------------------------------------------
def setPlayer():
    global player1, player2  # 전역 변수 값 바꾼다?
    nickName=input("닉네임 :")
    if player1 == None:
        player1 = player(nickName)
    else:
        player2 = player(nickName)
    # level=0
    # score=0
    # lanking=0
# -----------------------------------------------------------------------
# 메뉴 출력하기
# 함수명 : displayMenu
# 파라미터 : 없음
# 반 환 값 : 없음
# -----------------------------------------------------------------------
def displayMenu():
    print('1.회원가입')
    print('2.게임 시작')
    print('3.랭킹 보기')
    print('4.종료')



def playGame():
    level=3
    score=1021
    lanking=2
# 프로그램 코드 ----------------------------------------------------------
while True:

    displayMenu()

    select = input("메뉴 선택: ")

    if select =='4':
        # 파일에 기록하고 종료
        break
    elif select =='1':
        setPlayer()
    elif select =='2':
        playGame()



import tkinter