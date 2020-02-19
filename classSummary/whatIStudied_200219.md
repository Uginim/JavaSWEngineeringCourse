# What I studied today.
Date : 2020-02-19

# Spring
## File업로드
### front-end에서 해야할 것
1. `<form>`태그에 `enctype="multipart/form-data"` 속성/값 추가
	- encoding을 form-data 방식으로 보내도록 설정해야함.
2. `<input>`태그에 type속성값을 'file'로 하기
	```html
	<span><label>첨부</label></span><span><input type="file" name="files" multiple/></span>
	```
#### 예시
```jsp
<form:form id="write-form" modelAttribute="board"
        action="${pageContext.request.contextPath}/board/write" method="post" enctype="multipart/form-data">
            
                <div class="row">
                    <span><label>분류</label></span><span>
                        <form:select path="boardCategoryVO.cid" id="category" cols="70">
                            <option value="0">== 선 택 ==</option>
                            <form:options path="boardCategoryVO.cid" items="${categoryList}" itemValue="cid" itemLabel="cname" />
                        </form:select>
                    </span>
                </div>
                <div class="row">
                    <span><label>제목</label></span><span><form:input path="btitle" type="text" cols="70"/></span>
                </div>
                <div class="row">
                    	<span><label>작성자</label></span><span>
                    	<input value="${member.nickname}(${member.id})" readonly cols="70"/>
                    	<form:input path="bid" type="hidden" value="${member.id}"/>
                    	<form:input path="bnickname" type="hidden" value="${member.nickname}"/>
                    	</span>
                    	
                </div>
                <div class="row">
                    <span><label>내용</label></span><span><form:textarea path="bcontent" id="" cols="70" rows="40"></form:textarea></span>
                </div>
                <div class="row">
                    <span><label>첨부</label></span><span><input type="file" name="files" multiple/></span>
                </div>
            
            <div>
		            <span>            	
		                <button type="submit">등록</button>
		                <button type="button">취소</button>
		                <button type="button">목록</button>
                </span>
            </div>
        </form:form>
```	
### Multipartfile객체를 VO로 바꾸기
- 예시
	```java
	// 첨부파일 넣기
	private void fileWrite(List<MultipartFile> files, long bnum) {
		for(MultipartFile multipartfile : files) {
			
			try {
				if(multipartfile.getOriginalFilename().length()==0)
					continue;
				logger.info("파일 첨부 : "+multipartfile.getOriginalFilename());
				
				BoardFileVO boardFileVO =  new BoardFileVO();
				// 게시글 번호
				boardFileVO.setBnum(bnum);
				// 첨부파일 명
				boardFileVO.setFname(multipartfile.getOriginalFilename());
				// 첨부파일 크기
				boardFileVO.setFsize(multipartfile.getSize());
				// 첨부파일 타입
				boardFileVO.setFtype(multipartfile.getContentType());
				// 첨부파일 데이터
				boardFileVO.setFdata(multipartfile.getBytes());
				logger.info("input file:"+multipartfile.toString());
				// 첨부파일 저장
				boardDAO.fileWrite(boardFileVO);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	```
## 오류
- 첨부파일이 없이 전송해도 파일이 있는 것처럼 객체가 생성됨...
	- 해결방법
		- 파일 길이 체크해서 빈껍데기인지 확인함
		- [참조](https://aperoid.tistory.com/50)
- `@Valid`어노테이션을 해도 계속 처리하는 이유
	- @Valid는 말그데로 Validation만 체크하고 컨트롤러는 수행됨
		- [출처](https://devmg.tistory.com/55)
	- 해결방법
		1. `BindingResult` 객체를 파라미터로 받을 것 
		2. `hasErrors()`가 `true`이면 원래 처리를 하지않기 
		3. return 경로를 form이 있던 경로로 할 것
		4. 이후 `<form:errors>`태그에 에러메시지가 뜸

## db에 저장된 이미지 파일 서비스하기
- 방법
	1. 이미지를 특정할 수 있는 주소를 매핑
	2. HttpHeaders객체 생성
	3. HttpHeaders객체에 값 넣기
		1. ContentType 
		2. ContentLength 
		3. ContentDispositionFormData 값
			- "attachment"
			- 파일이름
	4. ResponseEntity 객체에 담아서 전송
- 첨부파일 다운로드 예시
	```java
	@GetMapping("/file/{fid}")
	public ResponseEntity<byte[]> getFile(@PathVariable String fid) {
		BoardFileVO boardFileVO = boardSVC.fileView(fid);
		logger.info("getFile " + boardFileVO.toString());
		
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = boardFileVO.getFtype().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(boardFileVO.getFsize());
		headers.setContentDispositionFormData("attachment", boardFileVO.getFname());
		return new ResponseEntity<byte[]>(boardFileVO.getFdata(),headers, HttpStatus.OK);
	}
	```
## mabatis transaction
- spring의 DataSourceTransactionManager를 사용하면 java코드에서 트랜잭션 사용가능하다
- [참조](https://mybatis.org/spring/ko/transactions.html)
### context설정
```xml
	<!-- 트랜잭션 설정 -->
	<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource"/>
	</bean>
```
### 활용
- Transaction 단위로 사용할 method에 `@Transactional` 어노테이션을 붙인다.
```java
	// 게시글 작성
	@Transactional
	@Override
	public int write(BoardVO boardVO) {
		long bnum = 0;
		// 1) 게시글 작성
		int cnt = boardDAO.write(boardVO);
		
		// 2) bnum 가져오기
		bnum = boardVO.getBnum(); // mapper에 selectKey태그로 '새로 생성된 key'값을 가져옴 
		
		// 3) 첨부파일 있는 경우
		if(boardVO.getFiles() != null && boardVO.getFiles().size() > 0) {			
			fileWrite(boardVO.getFiles(),bnum);
		}
		return cnt;
	}
```

# 팀프로젝트 진행상황
1. 금주 피드백 반영안됨
	- 기능분할도 완
	- 프로세스 X
	- 테스트 시나리오 대충 완
2. 담주할것
	- 테이블 레이아웃
	- 개발일정
	- 팀구성
3. 데이터
	- 과목
	- 챕터
		- 챕터내용
	- 마무리문제
		- 문제해설
	- 코딩문제
	- 코딩문제정오답내역(제출/결과)
		- 제출코드
		- 결과 
	
<br><br><hr>

[돌아가기](../README.md)  
[2020-02-14](whatIStudied_200214.md)  
[2020-02-18](whatIStudied_200218.md)  














