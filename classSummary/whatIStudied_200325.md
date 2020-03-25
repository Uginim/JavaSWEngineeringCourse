# What I studied today.
Date : 2020-03-25


# 팀프로젝트 진행
# 스프링
## 스프링 프레임워크 특징
### 컨테이너 역할
- 자바 객체의 라이프사이클을 스프링 컨테이너가 직접 관리하며, 
 스프링 컨테이너로 부터 필요한 객체를 얻어올 수 있습니다.
### POJO(Plain Old Java Object) 기반의 프레임 워크
- Spring 컨테이너에 저장되는 Java객체는 특정한 인터페이스를 구현하건, 특정 클래스를 상속받지 않아도 된다.
### DI(Dependency Injection)을 지원
- Spring은 설정 파일이나 어노테이션을 통해서 객체 안의 의존관계를 설정할 수 있도록 하고 있다. 이는 클래스들 사이에 약한 결합을 가능케 한다.
### AOP(Aspect Oriented Programming)를 지원
- 트랜잭션, 로깅, 보안 등 여러 모듈에서 공통적으로 지원하는 기능을 핵심모듈에서 분리하여 사용 트랜잭션 처리를 위한 일관된 방법지원
- JDBC, JTA 등 어떤 트랜잭션을 사용하던 설정을 통해 정보를 관리하므로 트랜잭션 구현에 상관없이 동일한 코드 사용가능
    - JTA
        - 자바 트랜잭션 API
### 영속성과 관련된 다양한 API 지원
- Spring은 MyBatis, Hibernate 등 데이터베이스 처리를 위한 
- ORM(Object Relational Mapping) 프레임워크들과의 연동 지원
### Model2 방식의 MVC Framework를 지원
# AOP
## 핵심기능과 부가기능?
- 업무(Biz) 로직을 포함하는 기능을 핵심 기능(Core concerns)
- 핵심을 도와주는 부가적인 기능(로깅, 보안 등) 부가기능(Cross-cutting Concerns)
- 객체지향의 기본 원칙을 적용하여도 핵심기능에서 부기가능을 분리해서 모듈화하는 것은 매우 어렵다.
- 개발 시 핵심기능과 부가기능을 분리하고 런타임시에
## AOP 용어
### 애스팩트(Aspect)
- 애스팩트는 부가기능을 정의한 코드인 어드바이스(Advice)와 어드바이스를 어디에 적용할 지를 경정하는 포인트컷(PointCut)을 합친 개념이다
  ``` 
  Advice(부가기능코드) + Pointcut(삽입위치)
  ```
### 타겟(Target)
- **핵심기능**을 담고 있는 모듈로, 타겟은 부가기능을 부여할 대상
### 어드바이스(Advice)
- 어드바이스는 타겟에 제공할 부가기능을 담고 있는 모듈
### 조인포인트(Join Point) - **물리적인 위치**
- 어드바이스가 적용될 수 있는 위치 즉, 타겟 객체가 구현한 인터페이스의 모든 메서드는 조인 포인트
### 포인트컷(Pointcut) - 조인포인트를 지정하는 **문법**
- 어드바이스를 적용할 타겟의 메서드를 선별하는 정규표현식
- 포인트컷 표현식은 execution으로 시작하고, 메서드의 Signature를 비교하는 방법을 주로 이용
### 애스팩트(Aspect)
- 애스펙트 AOP의 기본 모듈
- 애스팩트 = 어드바이스 + 포인트컷,  애스팩트는 싱글톤 형태의 객체로 존재
### 어드바이저(Advisor) (=애스팩트아 동일언어, AspectJ의 서브셋 개념)
- 어드바이저 = 어드바이스 + 포인트컷, 어드바이저는 Spring AOP에서만 사용되는 특별한 용어

## AOP 적용하기
### dependency 적용하기
- 다음 3개를 추가한다
    - AspectJ
    - Spring AOP
    - aspectjweaver
- 예시  
    ```xml
            <!-- AOP 의존성 -->
            <!-- AspectJ -->
            <dependency>
                <groupId>org.aspectj</groupId>
                <artifactId>aspectjrt</artifactId>
                <version>${org.aspectj-version}</version>
            </dependency>            
            <!-- AspectJ 끝-->
            <!-- AspectJ Weaver-->
            <dependency>
                <groupId>org.aspectj</groupId>
                <artifactId>aspectjweaver</artifactId>
                <version>${org.aspectj-version}</version>
            </dependency>         
            <!-- AspectJ Weaver끝-->
            <!-- spring AOP -->
            <dependency>
                <groupId>org.springframework</groupId>
                <artifactId>spring-aop</artifactId>
    <!-- 		    <version>5.2.3.RELEASE</version> -->
                    <!-- properties에 정의한 property사용 -->
                    <version>${org.springframework-version}</version>
            </dependency>
            <!-- spring AOP 끝 -->
            <!-- AOP 의존성 끝 -->
    ```
- 이후  maven dependencies에서 확인가능함
    - `shift` + `f2` 키로 문서 확인가능
### 패키지 및 클래스 생성
- `@Component`
    - 빈으로 등록함
    - `@Controller`, `@Service`, `@Repository`등의 상위 클래스
- 어노테이션으로 실행시점 및 포인트컷을 지정함
    - 예시
        `@Around("execution(* com.kh.portfolio.board.svc.BoardSVCImpl.*(..)")`
    - 이후 메소드라인의 라인넘버 옆에 빨간 표시가 생김

- 소스코드 예시
    ```java    
    import org.aspectj.lang.ProceedingJoinPoint;
    import org.aspectj.lang.Signature;
    import org.aspectj.lang.annotation.Around;
    import org.aspectj.lang.annotation.Aspect;
    import org.slf4j.Logger;
    import org.slf4j.LoggerFactory;
    import org.springframework.stereotype.Component;

    @Component  // 컨테이너에 빈으로 등록하고자 하는 클래스에 사용
    @Aspect		// 부가기능을 정의한 클래스에 사용
    public class MeasuringAspect {
        private static final Logger logger = LoggerFactory.getLogger(MeasuringAspect.class);
        
        @Around("execution(* com.kh.portfolio.board.svc.BoardSVCImpl.*(..))")
        public Object measuringMethodRoundingTime(ProceedingJoinPoint jointPoint) {
            Object result = null;
            Signature signature = jointPoint.getSignature();
            String methodName = signature.getName();
            long startTime = System.nanoTime();
            logger.info("[Log: Around]Before: " + methodName  + " time check start");
            try {
                // 핵심 기능 수행
                jointPoint.proceed();			
            } catch(Throwable e) {
                logger.info("[Log: Around]Exception occured: "+methodName);
                e.printStackTrace();
            }
            
            long endTime = System.nanoTime();
            logger.info("[Log: Around]After: " + methodName  + " time check start");		
            logger.info("[Log: Around]: " + methodName  + " Processing time is "+(startTime-endTime) + "ns");		
            
            return result;
            
        }
    }   
    ```
### 컨테이너에 등록해야함
- root-context편집
    - `namespace` `aop` 추가
- 삽입된 구문예시
    ```xml
    <!-- @Aspect어노테이션이 적용된 클래스를 자동으로 런타임에  타겟(핵심기능)에 위빙(삽입과정)하는 설정 -->
	<aop:aspectj-autoproxy />	
    ```
[스프링 3대 기능](https://dailyworker.github.io/spring-triangle/)

[돌아가기](../README.md)  
[2020-03-24](whatIStudied_200324.md)  
[2020-03-26](whatIStudied_200326.md)  














