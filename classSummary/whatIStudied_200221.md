# What I studied today.
Date : 2020-02-21


# spring
## 첨부파일 한글이름 깨짐 방지
```java
// 첨부파일명 한글 깨짐 방지
String filename = null;
try {
    filename = new String(boardFileVO.getFname().getBytes("euc-kr"),"ISO-8859-1");
}catch (UnsupportedEncodingException e) {
    e.printStackTrace();
}

## spring Transactional 과  javax Transactional 중 뭘 사용해야할까?
- [spring Transactional? javax Transactional?](http://wonwoo.ml/index.php/post/776)
headers.setContentDispositionFormData("attachment", filename);
```

# JSP
## contextRoot 공통 변수에 넣어 사용하기
- `<c:set var="contextRoot" value='${pageContext.request.contextPath}'/>`를 추가함


			
	
<br><br><hr>

[돌아가기](../README.md)  
[2020-02-20](whatIStudied_200220.md)  
[2020-02-24](whatIStudied_200224.md)  














