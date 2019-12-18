window.addEventListener("load",init,false);
function init(){    
    var joinBtn = document.getElementById('joinBtn');  
    console.log(joinBtn); 
    joinBtn.addEventListener("click",function(e){
        e.preventDefault();
        checkValid();
    },false);
}
function checkValid(){
    // alert('호출됨');
    // 사용자 입력값 읽어오기
    var idEle = document.getElementById('id');    
    var pwEle = document.getElementById('pw');
    var pwChkEle = document.getElementById('pwChk');
    var telEle = document.getElementById('tel');
    var regionEle = document.getElementById('region');
    var genderEle = document.getElementsByName('gender');

    var idErrmsg = document.getElementById('id-errmsg');
    var pwErrmsg = document.getElementById('pw-errmsg');
    var pwChkErrmsg = document.getElementById('pwChk-errmsg');
    var telErrmsg = document.getElementById('tel-errmsg');
    var regionErrmsg = document.getElementById('region-errmsg');
    var genderErrmsg = document.getElementById('gender-errmsg');
    var flag =true;
    console.log(idEle.value,
        pwEle.value,
        pwChkEle.value,
        telEle.value,
        regionEle.value,
        regionEle.options[regionEle.selectedIndex].text,
        genderEle,
                    );
    // 1) 이메일 주소 체크
    if(!isEmail(idEle.value)){        
        idErrmsg.innerHTML = "이메일 정보가 잘못되었습니다.";
        flag = flag && false;
    } else {
        idErrmsg.innerHTML = "";        
    }
    // 2) 비밀번호 체크
    if(!isPassword(pwEle.value)){        
        pwErrmsg.innerHTML = "비밀번호가 잘못되었습니다.(8~10)자리";
        flag = flag && false;
    } else {
        pwErrmsg.innerHTML = "";        
    }
    // 3) 비밀번호 재확인
    if(!isPassword(pwChkEle.value)){        
        pwChkErrmsg.innerHTML = "비밀번호가 잘못되었습니다.(8~10)자리";
        flag = flag && false;
    } else {
        pwChkErrmsg.innerHTML = "";        
    }
    // 3-2) 비밀번호 일치 체크 
    if(pwChkEle.value !== pwEle.value){
        pwChkErrmsg.innerHTML = "비밀번호가 일치하지 않습니다..";
        flag = flag && false;
    }else {
        pwChkErrmsg.innerHTML = "";
    }
    
    // 4) 전화번호
    if(!isPhoneNumber(telEle.value)){        
        telErrmsg.innerHTML = "전화번호가 잘못되었습니다.";
        flag = flag && false;
    } else {
        telErrmsg.innerHTML = "";
    }

    // 5) 지역
    if(regionEle.selectedIndex===0){
        regionErrmsg.innerHTML = "지역을 선택해주세요!";
        flag = flag && false;
    }else {
        regionErrmsg.innerHTML = "";
    }
    // 6) 성별
    var status = false;
    for(var gender of genderEle){
        if(gender.checked){
            status = true;
            break;
        }
    }
    if(!status){
        flag = flag && false;
        genderErrmsg.innerHTML="성별을 선택해주세요!";
    }else{
        genderErrmsg.innerHTML="";
    }

    // 7) 유효성 통과하면 메인화면으로
    if(flag) location.href="main.html";
}

/* 
유효성 체크 정규식
출처 : 자바스크립트 정규식 - 이메일, 전화번호, 비밀번호(영문,숫자만) - 수유산장
        [링크](https://suyou.tistory.com/150)
    */
// 이메일 체크 정규식
function isEmail(asValue) {
    var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
}

// 핸드폰 번호 체크 정규식
function isPhoneNumber(asValue) {
    var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
    return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

// 비밀번호 체크 정규식
function isPassword(asValue) {
    var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
    return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}