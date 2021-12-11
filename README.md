
![header](https://capsule-render.vercel.app/api?type=Waving&text=🌻BeeBee🌻&animation=fadeIn&fontSize=50&descAlignX=10&color=0:FF985A,100:FFB347)


<b style="text-align=center">Bee(꿀벌처럼) Bee(부지런히) 🌻🐝🌻</b>

# GUIDE
1. 회원가입
2. 로그인
3. 게시판

## 1. 회원가입
+ 약관 동의
  + 필수 약관 동의 시 다음 단계
+ 정보 입력
  + 아이디(이메일 인증, 메일로 온 인증번호와 동일 시 체크 , 아이디 중복 체크 , 이메일 "@" 포함)
  + 닉네임(2~20자 , 닉네임 중복 체크)
  + 비밀번호(대문자/소문자/숫자/특수문자 조합 10~16자)
  + 비밀번호 확인(비밀번호와 동일)
+ 회원가입 완료

## 2. 로그인
+ 로그인
  + 시큐리티 적용
  + 자동 로그인 CSRF 토큰 이용
  + 로그인 시 게시판(CRUD 가능)
+ 로그아웃 

## 3. 게시판
+ 게시판 목록
  + 페이징 처리(게시판 번호, 제목, 아이디, 작성일)
  + 게시판 CRUD
  + 모달창(게시판 작성/수정/삭제 시 모달창)
  + 검색 기능(제목,내용,작성자, 제목+내용 , 제목+작성자 , 제목+작성자+내용 검색 가능)
+ 댓글
  + 댓글 페이징 처리 및 CRUD
  + 댓글 추천 / 비추천 기능
  + 댓글 버튼을 이용해서 탭 메뉴
  + 댓글 수정 / 삭제 로그인 정보 같을 시
+ 첨부파일
  + 첨부 파일 CURD
  + 첨부 파일 섬네일, 일반 파일(다른 이미지)
  + 첨부 파일 미리 보기(팝업)
<br>

# GIT COMMIT MESSAGE
+ Feat: 새로운 기능을 추가할 경우 <br>
+ Fixed: 버그를 고친 경우 <br>
+ Docs: 문서 수정한 경우 <br>
+ Style: 코드 포맷 변경, 세미 콜론 누락, 코드 수정이 없는 경우 <br>
+ Refactor: 프로덕션 코드 리팩터링 <br>
+ Test: 테스트 추가, 테스트 리팩터링 (프로덕션 코드 변경 없음) <br>
+ Chore: 빌드 테스크 업데이트, 패키지 매니저 설정할 경우 (프로덕션 코드 변경 없음) <br>
+ Modify : 코드 수정(기능 수정 안함) <br>
+ Add : 기능을 추가한 경우 <br>
+ Config : 설정을 수정한 경우 <br>


#### 참고

코드로 배우는 스프링 웹 프로젝트

### 정리

https://w-giraffe.tistory.com/ <br>

#### 실행 화면

##### 메인 - 회원가입 - 게시판 - 로그인
https://user-images.githubusercontent.com/76811291/140773096-2c5072ff-3ecb-4a00-af25-3268c653d6fe.mp4

#### 게시판(첨부파일, 댓글 버그 )
https://user-images.githubusercontent.com/76811291/141991604-9a5aace7-deed-40ef-bf35-c18b5c80de79.mp4

#### 로그인 시큐리티 적용
https://user-images.githubusercontent.com/76811291/143020878-f9616b95-d479-4157-9ef7-47a2983c7c1c.mp4

#### 이메일 인증
![image](https://user-images.githubusercontent.com/76811291/143466051-347eb90f-4aac-44fb-aaee-d16640539099.png)

#### 모바일 반응형
https://user-images.githubusercontent.com/76811291/145679786-4dea34aa-f63f-4029-b7b8-d4bfb3b8b968.mp4
