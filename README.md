<div align="center">
	<img src="https://github.com/vgbhn37/HallOfArt/assets/121776914/ab86bc95-29b2-4cc4-a26e-e49924278ad4"  style="width:60%;">
</div>

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
	implementation 'org.springframework.boot:spring-boot-starter-web'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.1'
	implementation 'org.springframework.boot:spring-boot-starter-mail'
	
	implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
	implementation 'javax.servlet:jstl'
	implementation 'net.nurigo:sdk:4.3.0'
	
	
	compileOnly 'org.projectlombok:lombok'
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
	runtimeOnly 'com.h2database:h2'
	runtimeOnly 'com.mysql:mysql-connector-j'

	annotationProcessor 'org.projectlombok:lombok'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:2.3.1'
        implementation 'javax.mail:javax.mail-api:1.6.2'
	implementation group: 'com.google.zxing', name: 'javase', version: '3.5.0'
	implementation group: 'com.google.zxing', name: 'core', version: '3.5.0'
```

<br>
<br>

## 1️⃣ 프로젝트 구조 

|   Class   | Webapp |
| --- | --- |
| ![class](https://github.com/vgbhn37/HallOfArt/assets/121776914/8ecff777-95c9-4764-bf8f-8f64eb8eed46) | ![webapp](https://github.com/vgbhn37/HallOfArt/assets/121776914/df262030-cc9c-4390-a270-af20dc5d2ddc) |


  
<br>

## 2️⃣ 프로젝트 개요

* 공연, 대관 에약 / 결제 사이트 개발 
* 현행 시스템 벤치마킹(예술의 전당)

<br>

## 3️⃣ 기능 구분

#### 사용자
* 회원 : 회원가입, 로그인, 카카오 소셜 로그인, 아이디/임시비밀번호 발송, 회원정보 수정
* 결제 대기 리스트, 결제 페이지, 결제 내역 및 환불
* 공연 목록 조회, 공연 예매 신청, 대관 신청
* 공지사항 조회, 1:1 문의하기, 오시는 길
#### Manager
* 회원 목록 조회, 회원 정보 수정
* 대관 정보 입력, 공연 상태 관리, 대관 신청 조회, 에매 내역 조회, 결제 내역 조회
* 공지사항 작성, 1:1 문의 관리

<br>

## 4️⃣ ERD
![erd](https://github.com/vgbhn37/HallOfArt/assets/121776914/8e49cd29-14bc-41d8-91ff-ad74c36f63d8)

<br>
<br>


## 5️⃣ SiteMap

<br>

![sitemap1](https://github.com/vgbhn37/HallOfArt/assets/121776914/205f2600-c4ed-487f-9e8f-75b498c4268f)


<br>
<br>

![sitemap2](https://github.com/vgbhn37/HallOfArt/assets/121776914/62e3f86a-8f83-4bef-bce7-e90164ce9621)


<br>

## 6️⃣ 화면 구현

## 사용자
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


## 관리자
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


