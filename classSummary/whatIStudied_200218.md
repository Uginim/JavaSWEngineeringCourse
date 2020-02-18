# What I studied today.
Date : 2020-02-18

# Spring
## mybatis
### selectKey
- 새로 삽입한 레코드의 키(SEQUENCE)값을 가져올 필요가 있을 때 사용
- 예시
    ```SQL
    <insert id="write" parameterType="BoardVO" >
		
		INSERT INTO board ( 
			bnum,
			bcategory,
			btitle,
			bid,
			bnickname,
			bcontent,
			bgroup
		)
		values(
			BOARD_BNUM_SEQ.nextval,
			#{bcategory},
			#{btitle},
			#{bid},
			#{bnickname},
			#{bcontent},
			board_bnum_seq.currval
		)
		<selectKey keyProperty="bnum" resultType="long" order="AFTER">
			SELECT board_bnum_seq.currval FROM dual;
		</selectKey>
	</insert>
    ```
    - 이후 input으로 사용한 VO객체에 생성된 sequence값이 저장됨
## File업로드
1. dependency 추가
    ```xml
        <dependency>
            <groupId>commons-fileupload</groupId>
            <artifactId>commons-fileupload</artifactId>
            <version>1.4</version>
        </dependency>
    ```
2. context에 CommonsMultipartResolver 설정
    ```xml
    <!-- 	파일 업로드 -->
	<beans:bean id ="multipartResolver"
		class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
	<!-- 		파일당 업로드 제한 용량설정 10MB 1024*1024*10 1kb = 1024Byte -->
		<beans:property name="maxUploadSize" value="10485760"/>
		<beans:property name="defaultEncoding" value="utf-8"/>
		</beans:bean>
    ```
3. vo에서 `MultipartFile` 사용
   - Spring Framework에서 제공됨
   - 주로 파일업로드에 사용

## JPA
-  자바 어플리케이션에서 관계형 데이터베이스를 사용하는 방식을 정의한 인터페이스 - [출처](https://suhwan.dev/2019/02/24/jpa-vs-hibernate-vs-spring-data-jpa/)
- Hibernate는 JPA의 구현체이다.
    - Hibernate가 표준화 되면서 jpa가 만들어 짐

# 공지사항
- 2/20(목) 오전 : 
    - 취업특강 2시간
    - 실습 2시간
- 3/6 (금):
    - 휴강
    - 수료일자 4/7일 -> 4/8일로 바뀜
- 4/9~ 7일(10일)정도 파이썬 교육예정
    - 
<br><br><hr>

[돌아가기](../README.md)  
[2020-02-14](whatIStudied_200214.md)  
[2020-02-18](whatIStudied_200218.md)  














