# What I studied today.
Date : 2020-02-26


# Mybatis
## Mybatis 동적 SQL 계속
### DynamicSQL
- 검색조건에 따라 검색해야 하는 SQL문이 달라지기 때문에 이를 처리하기 위해서 동적 SQL이 사용됨
- 자바코드상에서 제어문 또는 판단문으로 처리해야하는 부분을 XML로 처리를 가능케해 준다.
### Mybatis의 표현식
- if
- choose(when,otherwise)
- trim(where,set)
- foreach
### 동적 SQL작성 시 유의 사항
- Mybatis 구문을 이용하여 SQL문이 실행 시에 변경되기 때문에 모든 케이스에 대해 테스트가 이루어져야 함
- 동적 SQL문이 없는 상태에서 정상적인 실행을 확인 후, 동적 SQL을 추가해서 개발
### Mybatis 동적 SQL :: if
- 문법 
    - ```xml 
        <if test="조건식"> 반영할 부분의 질의 </if>
        ```
- Mybatis에서 가장 많이 사용되는 요소
    - ```xml
        <select id="findActiveBlogWithTitleLike' reseultTYpe="Blog">
            SELECT * FROM BLOG WHERE state ="ACTIVE"
            <if test="title != null">
                AND title LIKE #{title}
            </if>
            <if test="author != null and author.name != null">
                AND author_name LIKE #{author.name}
            </if>
        </select>
        ```
- 위 구문에서 파라미터 중 title에 값이 존재할 경우 AND title LIKE ${title} 구문을 본 쿼리에 포함 시킨다.
    - ```xml
        <select id="findActiveBlogLike" resultType="Blog>
            SELECT * FROM BLOG WHERE state = 'ACTIVE'
            <if test="title != null">
                AND title LIKE #{title}
            </if>
            <if test="author != null and author.name != null">
                AND author_name like #{author.name}
            </if>
        </select>
        ```
- 파라미터 타입안에 다른 타입(클래스)가 포함되어 캡슐화를 이룰 경우 .(dot)연산자로 접근할 수 있다.
### Mybatis 동적 SQL :: choose(when, otherwise)
- 문법
    - ```xml
        <choose>
            <when test="조건식"> 반영할 부분질의 </when>
            <otherwise> 반영할 부분질의 </otherwise>
        </choose>
        ```
- 예시
    - ```xml
        <select id="findActiveBlogLike" resultType="Blog">
            SELECT * FROM BLOG WHERE state = 'ACTIVE'
            <choose>
                <when test="title != null">
                    AND title like #{title}
                </when>
                <when test="author !=null and author.name !=null">
                    AND author_name like #{author.name}
                </when>
                <otherwise>
                    AND featured = 1
                </otherwise>
            </choose>
        </select>

### Mybatis 동적 SQL :: trim(where, set)

#### Dynamic SQL 잘못 사용 예시
```xml
<select id="findActiveBlogLike" resultType="Blog">
    SELECT *
    FROM BLOG
    <where>
        <if test="state != null">
            state = #{state}
        </if>
        <if test="title != null">
            AND title like #{title}
        </if>
        <if test="author != null and author.name != null">
            AND author_name like #{author.name}
        </if>
    </where>
</select>
```
#### trim(where)을 사용해야할 때
- 모두 참이 아닌 경우도 where가 추가되어 발생되는 오류 방지
- 하나라도 참인 조건에서는 where 키워드가 없는 경우는 자동으로 추가
- state값이 null이고 이후 값이 null이 아닌 경우 AND가 추가되어 구문 오류 발생
```xml
<select id="findActiveBlogLike" resultType="Blog">
    SELECT *
    FROM BLOG
    <where>
        <if test="state != null">
            state = #{state}
        </if>
        <if test="title != null">
            AND title like #{title}
        </if>
        <if test="author != null and author.name != null">
            AND author_name like #{author.name}
        </if>
    </where>
</select>
```
#### 문법(SET)
```xml
<trim prefix="SET" suffixOverrides=",">
...
</trim>
```
- `<set></set>`는 내부에 컨텐츠가 존재할 때 set 키워드를 포함시킴
- set키워드 다음에 `,`(comma)가 바로 포함될 경우, `,`를 제외시킴
- 예시
    ```xml
    <update id="updateAuthorNecessary">
        UPDATE author
        <trim prefix="SET" suffixOverride=",">
            <if test="state != null">
                state = #{state}
            </if>
            <if test="title != null">
                title = #{title}
            </if>
            <if test="author != null and author.name != null">
                author_name = #{author.name}
            </if>
        </trim>
    </update>
    ```
#### 문법(WHERE)
```xml
<trim prefix="WHERE" prefixOverrides="AND|OR">
    ...
</trim>
```
- `<where></where>`는 내부에 컨텐츠가 존재할 때 where 키워드를 포함시킴
- where키워드 다음에 AND, OR가 바로 포함될 경우 AND, OR를 제외시킴
```xml
<select id="findActiveBlogLike" resultType="Blog">
    SELECT *
    FROM BLOG
    <trim prefix="WHERE" prefixOverrides="AND">
        <if test="state !=null">
            state = #{state}
        </if>
        <if test="title != null">
            title like #{title}
        </if>
        <if test="author != null and author.name != null">
            author_name like #{author.name}
        </if>
    </trim>
</select>
```


- 위 예제에서 만약 모든 파라미터 값이 없다면 아래 코드가 수행되어 에러발생!
```SQL
SELECT * 
FROM BLOG 
WHERE
```
- 두번째 조건만 만족하더라도 에러발생
```
SELECT * 
FROM BLOG
WHERE 
AND title like 'someTitle'
```
### Mybatis 동적 SQL :: forEach
#### 문법
```
<foreach item="속성" index="index" collection="컬렉션"
    open="시작문자", separator="구분자" colose="끝문자" >
</foreach>

- Dynamic 쿼리에서 공통적으로 필요한 기능은 Collection의 반복으로 처리함
- In 키워드를 사용할 때 종조 활용됨
    - 예시
        ```
        <select id="selectPostIn" resultType="domain.blog.Post">
            SELECT * FROM POST P WHERE ID in
            <foreeach item="item" index="index" collection="list"
                open="(" separator="," close=")">
                #{item}
            </foreach>
        </select>
        ```
#### collection 속성은 list일 경우 list,array가 사용된다.
- 파라미터 List 일 경우 list
- 파라미터가 Array(배열)일 경우 array

# Spring 
## 게시판 만들기
### 추가해야할 기능
- 게시글 보고 목록으로 돌아갈 때, 읽었던 목록페이지로 돌아가기

<br><br><hr>

[돌아가기](../README.md)  
[2020-02-25](whatIStudied_200225.md)  
[2020-02-27](whatIStudied_200227.md)  














