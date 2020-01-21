# What I studied today.
Date : 2020-01-16

# JSP2.3 & Servlet 3.1

## JSON
> SON (JavaScript Object Notation)은 경량의 DATA-교환 형식이다. 이 형식은 사람이 읽고 쓰기에 용이하며, 기계가 분석하고 생성함에도 용이하다. JavaScript Programming Language, Standard ECMA-262 3rd Edition - December 1999의 일부에 토대를 두고 있다. JSON은 완벽하게 언어로 부터 독립적이지만 C-family 언어 - C, C++, C#, Java, JavaScript, Perl, Python 그외 다수 - 의 프로그래머들에게 친숙한 관습을 사용하는 텍스트 형식이다. 이러한 속성들이 JSON을 이상적인 DATA-교환 언어로 만들고 있다.
- [영문](https://www.json.org/json-en.html)
- [한글](https://www.json.org/json-ko.html)
### JSON문법
1. 객체 `{ }` 표기
2. 배열 `[ ]` 표기
3. 속성 key,value쌍으로 `:` (콜론)으로 구분
4. 속성이 복수인 경우 `,`(콤마)로 구분
5. 속성 값으로 배열 또는 json객체가 올 수 있다.
### JSON관련 라이브러리들
- JSON
    - https://mvnrepository.com/artifact/org.json/json
- GSON
    - https://mvnrepository.com/artifact/com.google.code.gson/gson
### JSON 문법 검사
- JSON Format Validator 
    - https://jsonformatter.curiousconcept.com/
## AJAX
- [XMLHttpRequest.send()](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/send)
- [FormData](https://developer.mozilla.org/ko/docs/Web/API/FormData)
- [w3school](https://www.w3schools.com/js/js_ajax_intro.asp)
### 사용 예시
- 계정 찾기 구현
- ```JAVASCRIPT
    // AJAX 사용
    // 1) XMLHttpRequest객체 생성
    var xhr = new XMLHttpRequest();
    
    // 2) 서버응답처리
    // Holds the Status of the XMLHttpRequest.
    // 0: 초기화되지 않은 상태(open()가 호출되지 않은 상태) request not initialized
    // 1: open()가 실행된 상태 server connection extablished
    // 2: 서버가 클라이언트의 요청을 받았음. send()가 실행된 상태 request received
    // 3: 서버가 클라이언트의 요청 처리중. 응답헤더는 수신했으나 바디가 수신 중인 상태 processing request
    // 4: 서버가 클라이언트의 요청을 완료했고 서버도 응답이 완료된 상태 request finished and response
    xhr.addEventListener("readystatechange",ajaxCall,false);
    function ajaxCall() {
        if(this.readyState == 4 && this.status == 200){
            document.getElementById("telMsg").innerHTML ="";
            document.getElementById("birthMsg").innerHTML ="";						
            document.getElementById("id").value = "";
            console.log(this.responseText);
            var jsonObj = JSON.parse(this.responseText);
            if(jsonObj.error == null){
                document.getElementById("id").value = jsonObj.id;	
            }else {						
                console.log(jsonObj);
                document.getElementById("birthMsg").innerHTML ="계정이 엄서영"; 
            }
        }
    }
    
    // 3) 서비스 요청
    var sendData = {};
    sendData.tel = document.getElementById("tel").value;
    sendData.birth = document.getElementById("birth").value;
    //	var tel = document.getElementById("tel").value;
    //	var birth = document.getElementById("birth").value;
    
    // 자바스크립트 obj => json포맷 문자열 반환
    var result = JSON.stringify(sendData);
    
    // POST 방식
    //	xhr.open("POST",'<c:url value="/member/findID.do"/>',true);	
    xhr.open("POST",'/myweb/member/findID.do',true);	
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
    //	xhr.send("tel="+tel+"&birth="+birth);
    xhr.send("result="+result);
    //	var formData = new FormData();
    //	formData.append("tel",sendData.tel);
    //	formData.append("birth",sendData.birth);
    //	xhr.send(formData);
    
    // GET 방식
    //	xhr.open("POST",'<c:url value="/member/findID.do"/>'+"?tel="+tel+"&birth="+birth,true);
    //	xhr.send
    ```


# 자주 마주하는 문제들
## 왜 url의 맨 앞에 '`/`'가 없으면 url이 이상해지는 것일까?
- 상세 현상
    - jstl core라이브러리의 url 태그를 사용할 시 맨 앞에 `/`(슬러시)를 빼면 url이 이상해진다.
- 이유 :
    - url의 맨 앞에 `/`를 빼면 상대경로로 인식함.
        - 현재 경로에서 자원을 찾게된다.
    > URL이 /로 시작하지 않기 때문에, 브라우저는 현재 자원을 포함하는 서브 디렉토리에 있는 문서를 찾으려 할 것.
        - [출처 -What is a URL? ](https://developer.mozilla.org/ko/docs/Learn/Common_questions/What_is_a_URL)
        - [URL](https://developer.mozilla.org/ko/docs/Web/API/URL)


<br><br><hr>
[돌아가기](../README.md)  
[2020-01-15](whatIStudied_200115.md)  
[2020-01-17](whatIStudied_200117.md)  


