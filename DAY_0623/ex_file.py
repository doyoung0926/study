#---------------------------------------------
#파일 읽고 쓰기=>파일 입출력(I/O)
#---------------------------------------------
filename='mydata.txt'

#파일 쓰기-------------------------------------
#(1)파일 읽기
#mode 'w' => 파일 없으면 생성 후 쓰기
#         => 파일 있으면 내용 지우고 쓰기
# file=open(filename,mode='w',encoding='utf-8')

#mode 'a' => append 약자
#         => 파일 없으면 생성 후 쓰기
#         => 파일 있으면 덧붙이기 즉 append
file=open(filename,mode='a',encoding='utf-8')

#(2)파일에 데이터 쓰기
file.write('Good\n')
file.write('Happy\n')
file.write('12315664654\n')

#(3)파일 닫기
file.close()

#파일 읽기--------------------------------------
#mode='r' => read 약자, 기본값
#(1)파일 열기
file=open(filename,mode='r')

#(2)파일 읽기
data=file.read()        #파일 전체 데이터 가져오기
print(f'read data => {data}')
print(f'read data type => {type(data)}')

file.seek(0)        #파일 포인트 제일 앞으로
data2=file.read()
print(f'read data2 => {data2}, len=> {len(data2)}')

#파일 포인트 제일 앞으로
file.seek(0)
#파일에서 1줄 읽기
data3=file.readline()
print(f'read data3 => {data3}')

data3=file.readline()
print(f'read data3 => {data3}')

data3=file.readline()
print(f'read data3 => {data3}')

#1줄씩 읽어서 리스트에 담아서 가져오기
data4=file.readlines()
print(f'read data4 => {data4}')

file.read


#(3)파일 닫기
file.close()