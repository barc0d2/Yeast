         # MyTodoApp

**Yeast 세미 프로젝트**는 베이커리 회사 내의 입출고, 매출, 인력 관리 등 다양한 실무 업무를 효율화하기 위해 제작한 **ERP 시스템**입니다.
이 프로젝트는 MyBatis와 JSP를 기반으로 제작하였습니다. <br>
Spring Boot 기반으로 설계된 이 프로젝트는 팀원 간의 **협업, 요구분석, 시스템 설계, UI/UX 디자인, 기능 구현, 테스트**까지  
실제 프로젝트의 전 과정을 경험하며 완성하였습니다.


## 📌 프로젝트 개요
- **개발 기간**: 2025-03-18 ~ 2025-04-14
- **서비스 링크**: *(작성 예정)*


## 🛠 기술 스택

**Front-End**  
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black">

**Back-End**  
<img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=flat-square&logo=Spring-Boot&logoColor=white">
<img src="https://img.shields.io/badge/Java-17-007396?style=flat-square&logo=OpenJDK&logoColor=white">
<img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white">
<img src="https://img.shields.io/badge/Lombok-16A085?style=flat-square&logo=Lombok&logoColor=white">

- Spring Boot 3.4.3
- Java 17
- Oracle DB (ojdbc11)
- Lombok
- Spring Boot Devtools, Tomcat

**Communication**  
<img src="https://img.shields.io/badge/Notion-000000?style=flat-square&logo=notion&logoColor=white">
<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white">
<img src="https://img.shields.io/badge/Figma-181717?style=flat-square&logo=Figma&logoColor=white">
<img src="https://img.shields.io/badge/Discord-181717?style=flat-square&logo=Discord&logoColor=white">



## 📦 사용 라이브러리 및 API
- spring-boot-starter-web
- spring-boot-devtools
- oracle-ojdbc11
- lombok
- tomcat
- jasper
- jstl
- security
- AOP
- JDBC


## ⚙️ 설치 및 실행 방법

```bash
mvn spring-boot:run
```

🔑 주요 기능
회원가입 및 로그인

ERP 시스템
- 재고 관리
- 입출고 관리
- 직원 관리
- 판매 내역 확인
- 가맹점 관리
- 하루 매출 정산
- 회사에서 빵 메뉴 관리
- 임금명세서

🌱 부가 기능
마이페이지
비밀번호 변경
가맹점 상세페이지
가맹점 목록
메인 화면

👨‍👩‍👧‍👦 팀원 소개<br>
| 이름   | 담당 기능 | Contact              |
|--------|-----------|----------------------|
| 최예찬 | DB        | qbsb147@naver.com    |
| 전진영 | CM        | yaho73m@gmail.com    |
| 황인태 | READER    | int0802@naver.com    |

# 기본 설계

---
### Rest API
* HTTP 프로토콜 기반으로 자원을 표현한 상태를 전송하는 방식, React와의 의존성을 분리 시킴

### MVC 패턴
* DTO(Model) : 데이터를 요청을 받고 응답을 반환하는 순수 데이터 전송 방식
* Controller, Service, Repository(Controller) : 비즈니스 로직을 구현하는 부분, 영속성 데이터 혹은 API와 통신
* React(View) : DTO의 응답을 React Axios가 받아서 데이터가 동적 페이지를 구현하는 방식

### MyBatis
* 복잡한 쿼리 작성과 데이터 매핑을 보다 직관적으로 처리
* SQL 쿼리 결과를 자바 객체로 자동 매핑

### JDBC
* 애플리케이션에서 데이터베이스와 상호작용해주는 인터페이스

### Spring Security
* Spring 기반 보단 프레임워크
* 다양한 보안 기술을 구성

# 확장 설계

---
### ControllerAdvice
* 전역 설정을 할 수 있는 컨트롤러 보조 클래스
* Exception Handler를 사용해 예외처리를 전역 설정