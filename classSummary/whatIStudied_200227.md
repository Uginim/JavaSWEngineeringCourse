# What I studied today.
Date : 2020-02-27

# 공지
- 3월 2일부터 1주일 휴강

# bootstrap
- [링크](https://getbootstrap.com/)
## bootstrap 설정하기
1. webjars.org로 maven dependancy 설정하기
    - pom.xml에 다음을 추가
    - ```xml
        <!-- Bootstrap -->
        <dependency>
            <groupId>org.webjars</groupId>
            <artifactId>popper.js</artifactId>
            <version>2.0.2</version>
        </dependency>
        <dependency>
            <groupId>org.webjars</groupId>
            <artifactId>jquery</artifactId>
            <version>3.4.1</version>
        </dependency>
        <dependency>
            <groupId>org.webjars</groupId>
            <artifactId>bootstrap</artifactId>
            <version>4.4.1-1</version>
        </dependency>
        <!-- Bootstrap-end -->
        ```
2. maven depandencies에서 파일경로 확인
3. 매핑하기
    ```xml
    <!-- 웹 컴포넌트 라이브러리 url 매핑 -->
        <resources location="classpath:/META-INF/resources/webjars/" mapping="/webjars/**"></resources>
    ```
- 이후 다음 경로에서 css 뜨는 지 확인
    - `/webjars/bootstrap/4.4.1-1/css/bootstrap.css`

# 기타
- 게시글 사진유무

<br><br><hr>

[돌아가기](../README.md)  
[2020-02-26](whatIStudied_200226.md)  
[2020-02-28](whatIStudied_200228.md)  














