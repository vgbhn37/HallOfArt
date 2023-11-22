![htest](https://github.com/vgbhn37/HallOfArt/assets/121776914/ab86bc95-29b2-4cc4-a26e-e49924278ad4)
## 🚀 프로젝트 개요
- *모든 팀원이 능동적으로 개발에 참여했으며, 주 포지션은 아래와 같습니다.*

|   Name   | 이승호 | 임지훈 | 황병준 | 황정민 
| :------: | --- | --- | --- | --- |
| Position | 공지사항, 오시는길(지도 API), 1:1문의하기 | 공연예약, 결제 API | 공연대관, 등록, 관리자페이지 | 유저관리, 로그인 API, 메일API, 문자API |

- 프로젝트 기간 : 2023.09.22 ~ 2023.10.18

<br> 

## 🎮 기술 스택

|   ✨ Front-End   | 💻 Back-End | 🛠 외부 API 및<br> Collaborative Software
| --- | --- | --- |
| <img src="https://img.shields.io/badge/html5-1572B6?style=flat&logo=html5&logoColor=white"/> : 5.0<br><img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white"/> : 3.0<br><img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat&logo=javascript&logoColor=white"/> : 1.16.1<br><img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white"/> : 3.5.1<br><img src="https://img.shields.io/badge/FontAwesome-528DD7?style=flat&logo=Font Awesome&logoColor=white"/> : 6.4.2<br><img src="https://img.shields.io/badge/Summernote-42c0ee?style=flat&logo=&logoColor=white"/> : 0.8.18 | <img src="https://img.shields.io/badge/OpenJDK-437291?style=flat&logo=OpenJDK&logoColor=white"/> : 11.0.21 Amazon Correto<br><img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=flat&logo=Spring Boot&logoColor=white"/> : 2.7.17<br><img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat&logo=apachetomcat&logoColor=black"/> : 9.0<br><img src="https://img.shields.io/badge/lombok-d00223?style=flat&logo=&logoColor=black"/> : 1.18.30<br><img src="https://img.shields.io/badge/Mybatis-0a0a0a?style=flat&logo=&logoColor=white"/> : 3.0<br><img src="https://img.shields.io/badge/JSP-007396?style=flat&logo=JSP&logoColor=white"/> : 2.3<br><img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/> : 8.0.21<br><img src="https://img.shields.io/badge/Jsoup-437291?style=flat&logo=OpenJDK&logoColor=white"/> : 1.15.3<br><img src="https://img.shields.io/badge/Gradle-02303A?style=flat&logo=Gradle&logoColor=white"/> : 8.3 | <img src="https://img.shields.io/badge/Kakao-FFCD00?style=flat&logo=kakao&logoColor=white"/> : OAuth 2.0<br><img src="https://img.shields.io/badge/GoogleSMTP-4285F4?style=flat&logo=&logoColor=white"/> : TLS 1.2<br><img src="https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white"/> : 2.42.1<br><img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"/> : 3.10.3<br><img src="https://img.shields.io/badge/GitHub_Desktop-802790?style=flat&logo=GitHub&logoColor=white"/> : 3.3.5<br><img src="https://img.shields.io/badge/IntelliJ_IDEA-000000?style=flat&logo=IntelliJ IDEA&logoColor=white"/> : Ultimate 2023.2.4<br><img src="https://img.shields.io/badge/SpringToolSuite4-1b7f38?style=flat&logo=Spring&logoColor=white"/> : 4.20.1<br><img src="https://img.shields.io/badge/Discord-5865F2?style=flat&logo=Discord&logoColor=white"/> : Stable 245033<br><img src="https://img.shields.io/badge/MySQL_Workbench-4479A1?style=flat&logo=MySQL&logoColor=white"/> : 8.0 CE |

<br>

## ⚙ 의존성
```java
    implementation 'org.springframework.boot:spring-boot-starter-validation'
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.1'
    implementation 'org.jsoup:jsoup:1.15.3'
    implementation 'org.springframework.boot:spring-boot-starter-mail'
    implementation 'javax.mail:javax.mail-api:1.6.2'
    implementation group: 'com.sun.mail', name: 'javax.mail', version: '1.6.2'
    implementation 'net.coobird:thumbnailator:0.4.19'
    implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
    implementation 'javax.servlet:jstl'
    implementation 'org.springframework.security:spring-security-crypto:5.7.1'
    implementation group: 'com.googlecode.json-simple', name: 'json-simple', version: '1.1.1'
    implementation 'org.springframework.boot:spring-boot-starter-aop'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:2.3.1'
    developmentOnly 'org.springframework.boot:spring-boot-devtools'
    runtimeOnly 'com.mysql:mysql-connector-j'
    compileOnly 'org.projectlombok:lombok'
    annotationProcessor 'org.projectlombok:lombok'
    providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'
```

<br>
<br>

## 1️⃣ 프로젝트 구조 

|   Class   | Resources | Webapp |
| --- | --- | --- |
| ![image](https://github.com/economicfreedom/vrink/assets/35636560/4a87ea4e-d4a0-422c-b65c-29c427738448) | ![image](https://github.com/economicfreedom/vrink/assets/35636560/947d30de-559e-45d3-bf50-36bedfae358f) | ![image](https://github.com/economicfreedom/vrink/assets/35636560/a1d994ab-8125-4001-85b8-4d6329e77c69) |


  
<br>

## 2️⃣ 프로젝트 개요

* 시대변화에 발맞춰 비즈니스 모델을 충분히 활용할 수 있는 VR 에셋 거래 중계 사이트로 주제 선정
* 현행 시스템 벤치마킹 (아트머그, 크몽,아이템 매니아)

<br>

## 3️⃣ 기능 구분

#### Member

* 소셜 로그인 API, 결제 및 환불 API, VRM 조회 기능
* OpenAI 평가 API, 구글 이메일 SMTP 프로토콜, 버튜버 인기 순위 기능
* 상품 조회 기능, 게시판 기능, 신고 기능, 문의 기능

#### Customer

* 상품 구매 기능, 작가 팔로우 기능, 개인 의뢰 기능

#### Editor

* 작가 페이지 등록 기능, 상품 등록/판매 기능, 포인트 환전 기능

#### Manager
* 대시보드 조회, 통계 조회, 회원관리, 판매자 신청 승인, 공지/게시판 관리, 
* 정산 조회 및 처리, 결제 조회 및 환불처리, 고객문의 답변, 신고 처리, 배너 등록 및 조회

<br>

## 4️⃣ ERD & 테이블 명세서
테이블 명세서 : https://docs.google.com/spreadsheets/d/1Lrxd3bV0l5KgfyZpKmTONYraU3WzuedwmmR7ZOANyI8/edit#gid=0

<br>
<br>

![table](https://github.com/economicfreedom/vrink/assets/35636560/40e65e8f-9260-4f9c-9671-52387a49ed8a)

<br>
<br>


## 5️⃣ SiteMap

<br>

![image](https://github.com/economicfreedom/vrink/assets/35636560/18b08086-1471-4f11-9582-585e8b54ee1e)

<br>
<br>

![image](https://github.com/economicfreedom/vrink/assets/35636560/5748c13f-c222-4020-99d7-e76b85d9d6df)


<br>

## 6️⃣ 주요 기능

#### 메인 페이지 - 배너 및 작가, 게시판 조회 및 크롤링
- 메인 배너 슬라이드 조회
- 사이드 배너 조회
- 인기 작가 조회
- 공지사항 조회
- 스케줄러로 버튜버 순위 자동 크롤링 후 db 저장
- 인기 버튜버 순위 일/주/월별 조회
- 자유/의뢰 게시판 조회

#### 작가 목록
- 태그 클릭으로 작가 분류
- 검색
- 마우스오버시 리뷰점수, 별점표시

#### 작가 소개
- Three Js 뷰어로 작가 샘플 vrm 모델 미리보기
- vrm 확대보기
- 마우스 움직임에 따라 눈 포인팅
- 태그로 분류
- 작가 팔로우
- 작가 신고
- OpenAi 형태소 분석 기반 댓글 분석 감정
- 별점 평가
- 작품별 가격 설정
- 작가에게 의뢰하기
- 포트원API(결제)

#### 자유게시판
- 페이징
- 검색
- 댓글

#### 의뢰게시판
- 페이징
- 검색
- 댓글
- 제안 수락

#### 공지사항
- 페이징
- 검색

#### 고객센터
- 문의하기
- 신고하기
- 기타 사유 작성

## 화면 구현 ( 사용자 )
<table>
<tr>
  <td align="center">메인 페이지</td>
  <td align="center">공연 목록</td>
</tr>
<tr>
  <td><img src="https://github.com/vgbhn37/HallOfArt/assets/136680186/ee1c877a-b338-4739-bf87-890f10c7b0dc"></td>
  <td><img src="https://github.com/vgbhn37/HallOfArt/assets/136680186/aef41825-aff2-4a07-b6d0-26267ec46542"></td>
</tr>
<tr>
  <td colspan="2" align="center">대관 신청</td>
</tr>
<tr>
  <td><img src="https://github.com/vgbhn37/HallOfArt/assets/136680186/0052e8ae-28cb-472a-97ff-f39777ccf5d0"></td>
  <td><img src="https://github.com/vgbhn37/HallOfArt/assets/136680186/d6024062-4b5a-40e8-9c84-8e8fd659cff0"></td>
</tr>
</table>


## 화면 구현 ( 관리자 )
<table>
<tr>
  <td align="center">대관 승인</td>
  <td align="center">예매 현황 조회</td>
</tr>
<tr>
  <td><img src="https://github.com/vgbhn37/HallOfArt/assets/136680186/f38d516a-7ffa-4ecb-bf67-5266a5ce4465"></td>
  <td><img src="https://github.com/vgbhn37/HallOfArt/assets/136680186/2050d361-f461-4cdf-8c9e-d3defc0c2a0e"></td>
</tr>
</table>


