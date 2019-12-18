# What I studied today.
Date : 2019-12-18

# 웹표준
## [ClassList](https://developer.mozilla.org/ko/docs/Web/API/Element/classList)
- `Element.classList`
    - 클래스 속성값 읽어오기
    - `Element.classList`는 엘리먼트의 클래스 속성의 컬렉션인 활성 `DOMTokenList`를 반환하는 읽기 전용 프로퍼티이다.
- `Element.classList.add("클래스이름")`
    - 지정한 클래스 값을 추가한다. 만약 추가하려는 클래스가 엘리먼트의 class 속성에 이미 존재한다면 무시한다.
- `Element.classList.remove("클래스이름")`
    - 지정한 클래스 값을 제거한다.
- `Element.classList.toggle("클래스이름")`
    - 하나의 인수만 있을 때: 클래스 값을 토글링한다. 즉, 클래스가 존재한다면 제거하고 `false`를 반환하며, 존재하지 않으면 클래스를 추가하고 `true`를 반환한다.
            두번째 인수가 있을 때: 두번째 인수가 `true`로 평가되면 지정한 클래스 값을 추가하고 `false`로 평가되면 제거한다.
- `Element.classList.contains("클래스이름")`
    - 지정한 클래스 값이 엘리먼트의 class 속성에 존재하는지 확인한다.
## VScode 팁
- 같은 단어 한번에 선택하기 
    - 단어에 커서를 놓은 후 
    - `ctrl` + `F2`
## MDN
- [링크](https://developer.mozilla.org/ko/)
- 뜻 
    - Mozilla Developer Network
        > MDN Web Docs (previously known as MDN — the Mozilla Developer Network) is an evolving learning platform for Web technologies and the software that powers the Web, including:  

        - [출처](https://developer.mozilla.org/en-US/docs/MDN/About)  
## 정규표현식
- [정규표현식](https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8B%9D)
- 예시 
    - 이메일 체크
        - ```javascript
            var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            regExpEmail.test(emailStr); // 패턴이 일치하면 true 리턴	
            ```
    - 폰 번호 체크 
        - ```javascript
            var regExpPhoneNumber = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
            regExpPhoneNumber.test(phoneNumberStr); // 패턴이 일치하면 true 리턴
            ```
    - 비밀번호 체크 
        - ```javascript
            var regExpPassword = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
            regExpPassword.test(passwordStr); // 패턴이 일치하면 true 리턴
            ```
    - 출처 
        - [수유산장](https://suyou.tistory.com/150)
## regular expression 101    
- 온라인 정규식 테스터/디버거
- [링크](https://regex101.com/)
## FontAwesome
- 이미지 사이트
- 태그로써 이미지를 넣을 수 있음
- https://fontawesome.com/
- https://cdnjs.com/libraries/font-awesome
- https://www.codingfactory.net/10140


## css 문서
- 셀렉터 순서도 계층순서대로 작성할 것  

# 궁금한 점
- 태그에 id속성을 사용해서 id를 부여했을 때, 해당 id값을 전역변수로 사용가능한 이유는 뭘까?
    - 이유
        - IE때 있던 레거시 기능(게코엔진)
    - 출처
        - [Do DOM tree elements with ids become global variables? - stackoverflow](https://stackoverflow.com/questions/3434278/do-dom-tree-elements-with-ids-become-global-variables)
        - [7.3.3 Named access on the Window object - HTML Living Standard — Last Updated 16 December 2019](https://html.spec.whatwg.org/multipage/window-object.html#named-access-on-the-window-object)
<br><br>

[돌아가기](../README.md)  
[2019-12-17](whatIStudied_191217.md)  
[2019-12-19](whatIStudied_191219.md) 

