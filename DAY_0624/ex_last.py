#전역변수---------------------------------
num=2022
def test(data):
    #data,num:지역변수
    # global num      #전역변수 num을 수정
    num='Good'
    print(f'data => {data}, num=> {num}')




print(f'* num => {num}')
test(1)
print(f'* num => {num}')