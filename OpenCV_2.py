# Python OpenCV 강좌 : 제 2강 - 카메라 출력

### 카메라 출력
'''
OpenCV를 이용하면 카메라 출력을 쉽게 사용할 수 있습니다.

카메라 출력은 카메라가 스트리밍 형태로 동작할 수 있을 때 사용합니다.

즉, 저장된 이미지나 동영상 파일이 아니라 데이터를 실시간으로 받아오고 분석해야 하는 경우 카메라를 이용해 데이터를 처리합니다.

카메라를 사용해 데이터를 받아오기 때문에 연결된 카메라의 장치 번호를 통해 받아오며, 사용중인 플랫폼에서 카메라에 대한 접근 권한이 허용되어야 함.
'''

# 메인 코드

import cv2

capture = cv2.VideoCapture(0)
capture.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
capture.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

while cv2.waitKey(33) < 0:
    ret, frame = capture.read()
    cv2.imshow('VideoFrame', frame)

capture.release()
cv2.destroyAllWindows()

# 세부 코드

# capture = cv2.VideoCapture(0)

'''
비디오 출력 클래스(cv2.VideoCapture)를 통해 내장 카메라 또는 외장 카메라에서 정보를 받아올 수 있습니다.
cv2.VideoCapture(index)로 카메라의 장치 번호(ID)와 연결함. index는 카메라의 장치 번호를 의미함.
노트북의 경우, 일반적으로 내장 카메라가 존재하므로 노트북 카메라의 장치 번호는 0이 됨.
카메라를 추가적으로 연결하여 외장 카메라를 사용하는 경우, 장치 번호가 1~n까지 순차적으로 할당됨
'''

# capture.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
# capture.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

'''
카메라 속성 설정 메서드(capture.set)로 카메라의 속성을 설정합니다.
capture.ser(propid, value)로 카메라의 속성(propid)과 값(value)을 설정할 수 있다.
propid은 변경하려면 카메라 설정을 의미함.
value은 변경하려면 카메라 설정의 속성값을 의미함.
예제에서는 카메라의 너비를 640, 높이를 480으로 변경함
'''

# while cv2.waitKey(33) < 0:
#     ret, frame = capture.read()
#     cv2.imshow('VideoFrame', frame)

'''
반복문(While)을 활용하여 카메라에서 프레임을 지속적으로 받아옵니다.
키 입력 대기 함수(cv2.waitkey)는 지정된 시간 동안 키 입력이 있을 때까지 프로그램을 지연시킴
cv2.waitKey(delay)로 키 입력을 기다립니다. delay는 지연 시간을 의미함
밀리초 단위의 시간 동안 키 입력을 기다리며 그 시간동안 키 입력이 없을 경우 다음 구문을 실행함
키 입력 대기 함수는 입력된 키의 아스키 코드 값을 반환함
즉, 어떤 키라도 입력되기 전까지 33ms마다 반복문을 실행함
Tip: delay가 0일 경우, 지속적으로 키 입력을 검사하여 프레임이 넘어가지 않다
Tip: while cv2.waitKey(33) != ord('q'): 으로 사용할 경우, q가 입력될 때 while 문을 종료함

프레임 읽기 메서드(capture.read)를 이용하여 카메라의 상태 및 프레임을 받아옴
ret은 카메라의 상태가 저장되며 정상 작동할 경우 True를 반환함. 작동하지 않을 경우 False를 반환함
frame에 현재 시점의 프레임이 저장됨

이미지 표시 함수(cv2.imshow)를 이용하여 특정 윈도우 창에 이미지를 띄움
cv2.imshow(winname, mat)으로 윈도우 참의 제목(winname)과 이미지(mat)를 할당함
winname은 문자열로 표시하며, 할당한 문자열이 변수와 비슷한 역할을 함
mat은 이미지를 의미하며, 윈도우 창에 할당할 이미지를 의미함
VideoFrame 이름을 갖는 윈도우 창에 프레임이 표시 됨
'''

# capture.release()
# cv2.destroyAllWindows()
'''
메모리 해제 메서드(capture.relase)로 카메라 장치에서 받아온 메모리를 해제함
모든 윈도우 창 제거 함수(cv2.destroyAllWindows)를 이용하여 모든 윈도우 창을 닫습니다.
만약, 특정 윈도우 창만 닫는다면, cv2.destroyWindow(winname)으로 특정 윈도우 창만 닫을 수 있다.
'''