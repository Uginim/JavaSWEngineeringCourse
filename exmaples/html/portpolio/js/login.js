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
            idTag.addEventListener("change",function(e){
                document.getElementById("idMsg").innerHTML="";                
            },false);
            pwTag.addEventListener("change",function(e){
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
                idMsg.innerHTML="아이디를 입력하세요!";
                // idMsg.style.color="red";
                // idMsg.style.fontSize="0.8rem";
                // idMsg.style.fontWeight="bold";
                idMsg.classList.add("errmsg");
                idTag.focus();
            }
            var pwTag = document.getElementById('pw');
            var pwValue = pwTag.value;
            if(pwValue.trim().length==0){
                pwMsg.innerHTML="패스워드를 입력하세요!";
                // idMsg.style.color="red";
                // idMsg.style.fontSize="0.8rem";
                // idMsg.style.fontWeight="bold";
                pwMsg.classList.add("errmsg");
                pwTag.focus();
            }
            
            // 2) 회원 존재유무 체크
            if(idValue.trim()== ID && pwValue.trim() == PW) {
                // 메인 페이지로 이동
                location.href = "http://www.naver.com";
            } else {
                pwMsg.innerHTML="가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.";
                pwMsg.classList.add("errmsg");
                pwTag.focus();
                
            }
        }