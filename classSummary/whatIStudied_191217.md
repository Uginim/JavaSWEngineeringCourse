# What I studied today.
Date : 2019-12-17

# 웹표준
## flex box layout
### align-items 
- 교차축에 대한 아이템의 배치를 결정
- 한 줄안에서 아이템이 어느 위치에 배치될지를 결정함
-     
### `align-contents` vs `align-items`
- `align-contents` 
    - 두줄 이상일 때 줄들 간 배치
- `align-items` 
    - 한줄안에서 아이템에 대한 배치
### align-self
- **플렉스 아이템**에 적용
- 각 아이템 별로 배치방법을 선택함(교차축에 대한 배치)
### `align-items` vs `align-self`    
- `align-items`
    - **컨테이너**에 주는 속성
- `align-self`
    - **아이템**에 주는 속성
### flex
- 플렉스 아이템의 너비를 늘이거나 줄이는 값
## 로그인 화면 만들기
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로 그 인</title>
    <style>
        /* div{outline:red solid 1px;} */
        /* .container{
            outline: 1px solid blue;
        } */
        * {box-sizing: border-box;}
        .container{            
            /* width:100%; */
            display:flex;
            justify-content: center;
            margin-top:100px;
        }
        .login-wrapper{
            width:400px
        }
        .login-content > div{
            margin:10px 0;
        }
        .login-content input{
            width:100%;
        }
        .login-content input[type="submit"] {
            width : 100%;
            background-color: #03c75A;
            color: white;
            font-weight: 900;;
        }
        .login-title{
            text-align: center;
        }
        #id, #pw, #loginBtn{
            padding:5px;
            border-radius: 5px;
        }

    </style>
    <script>
        window.addEventListener("load",init,false);
        function init() {
            var idTag = document.getElementById("id");
            var pwTag = document.getElementById("pw");
            var loginBtn = window.document.getElementById("loginBtn");
            // console.log(loginBtn);
            loginBtn.addEventListener("click",function(e){
                // console.log(e.target);
                e.preventDefault();
                checkLogin();
            },false);
            idTag.addEventListener("focus",function(e){
                document.getElementById("idMsg").innerHTML="";                
            },false);
            pwTag.addEventListener("focus",function(e){
                document.getElementById("pwMsg").innerHTML="";                
            },false);
        }
        function checkLogin(){
            // console.log(document.getElementById('id').value);
            var idTag = document.getElementById('id');
            var idValue = idTag.value;
            var pwMsg = document.getElementById("pwMsg");
            var idMsg = document.getElementById("idMsg");
            // console.log(typeof idValue); // string            

            const ID = 'admin@admin.co.kr';
            const PW = 'admin1234';
            // 로그인 유효성 체크
            // 1) 아이디, 비밀번호 빈 문자열 체크
            if(idValue.trim().length==0){
                // alert('아이디를 입력하세요~');
                idMsg.innerHTML="아이디를 입력하세요!";
                idMsg.style.color="red";
                idMsg.style.fontSize="0.8rem";
                idTag.focus();
            }
            var pwTag = document.getElementById('pw');
            var pwValue = pwTag.value;
            if(pwValue.trim().length==0){
                // alert('패스워드를 입력하세요~');
                pwMsg.innerHTML="패스워드를 입력하세요!";
                pwMsg.style.color="red";
                pwMsg.style.fontSize="0.8rem";
                pwTag.focus();
            }

            // 2) 회원 존재유무 체크
            if(idValue.trim()== ID && pwValue.trim() == PW) {
                // 메인 페이지로 이동
                location.href = "http://www.naver.com";
            } else {
                pwMsg.innerHTML="가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.";
                pwMsg.style.color="red";
                pwMsg.style.fontSize = '0.7rem';
                pwTag.focus();
                
            }
        }
    </script>
</head>
<body>
    <div class="container">        
        <div class="login-wrapper">
            <form>
                <div class="login-title"> <h3>로 그 인</h3> </div>
                <div class="login-content">
                    <div><input name="" id="id" type="text" placeholder="아이디"></div>
                    <div><span id="idMsg"></span></div>
                    <div><input name="" id="pw" type="password" placeholder="비밀번호"></div>
                    <div><span id="pwMsg"></span></div>
                    <div><input name="" id="loginBtn" type="submit" value="로 그 인"></div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
```
<br><br>

[돌아가기](../README.md)  
[2019-12-13](whatIStudied_191216.md)  
[2019-12-17](whatIStudied_191218.md) 

