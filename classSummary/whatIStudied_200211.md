# What I studied today.
Date : 2020-02-10

# Spring
## Model
- view 단에 얹어질 데이터를 가짐
## Spring Interceptors
### 인터셉터 특징
- Servlet Filter와는 다름
- 인터셉터는 **컨트롤러 요청에만 적용**됨
- Bean Container 로딩 후 적용되지 때문에 빈을 사용할 수 있음
- AOP는 service, dao에, 인터셉터는 컨트롤러에 주로 사용됨
- org.springframework.web.servlet.HandlerInterceptor 인터페이스를 구현
    - 이후 특정 URL에 매핑시켜야함
    - servlet-context.xml에 추가하는 방법
- 인터셉터 단계
    - preHandle: 컨트롤러(핸들러) 실행전
    - postHandle: 컨트롤러(핸들러) 실행후, 뷰 실행전
    - afterCompletion: 뷰를 실행한 후
### 사례 : 로그인 처리
- 요청경로마다 별도의 접근제어
- 접근내용을 기록
- 
  


<br><br><hr>

[돌아가기](../README.md)  
[2020-02-07](whatIStudied_200207.md)  
[2020-02-11](whatIStudied_200211.md)  














