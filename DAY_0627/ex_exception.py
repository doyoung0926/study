# ------------------------------------------------------------------------
# EXCEPTION Handing : 예외처리
# 프로그램 실행 시 발생하는 오류(Error)에 대한 처리
# 오류가 발생해도 프로그램 중단하지 않고 실행될 수 있도록 하는 것
# ------------------------------------------------------------------------
try:
    num1, num2 = 10, 0
    print(f'{num1}/{num2} = {num1/num2}')

except Exception as ex:
    print("에러발생 ", ex)
    # pass                  # 오류 발생했을 때 무시하기
finally:                        # 필요하면 적고 아니면 안 적어도 됨?
    # 오류 발생 여부 상관없음
    # 무조건 실행
    print('finally~~~~~')

print("END")

try:
    file=open('agaga.jpg',mode='r')
    print(file.read())
    file.close()
except Exception as e:
    print(f'ERROR 발생 : {e}')


import os

if os.path.exists('agaga.jpg'):
    file = open('agaga.jpg', mode='r')
    print(file.read())
    file.close()
else:
    print('없는 파일입니다.')