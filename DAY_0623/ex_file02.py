#----------------------------------------------------------
#PATH => 경로
#-절대경로:파일 및 폴더 존재하는 위치의 경로 예) C:\Users\anece\....
#-상대경로:현재 코드 파일 기준으로 경로를 지정
# . -> 현재 위치
# ..  -> 상위 한단계 위
#----------------------------------------------------------
filename='../Data/home.html'
filename=r'./html/home.html'
#----------------------------------------------------------
#home.html 파일을 라인 단위로 읽어서 화면에 출력하기
#----------------------------------------------------------
#파일 열기
file=open(filename,mode='r',encoding='utf-8')

#파일 읽기
# data=file.read()
# print(f'all data => {data}')
# data=file.readlines()
# print(data)
while True:
    data=file.readline()
    if not data: break
    data = data.strip()
    if len(data)>0: print(data)

#파일 닫기
file.close()

#with~as 구문  ,  close 생략 가능
with open(filename,mode='r',encoding='utf-8') as file:
    while True:
        data=file.readline()
        if not data: break
        data=data.strip()
        if len(data)>0: print(data)