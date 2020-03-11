# What I studied today.
Date : 2020-03-11  


# Spring
## 게시판 만들기
### 댓글 화면
#### 부트스트랩을 써서 만들어 본 댓글 화면
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<form class="my-1"action="">
		
	<div class="row">
		<div class="col">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">댓글</span>
				</div>
				<textarea class="form-control" name="comment" id="" cols="80" rows="5"></textarea>		
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button">등록</button>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="container-fluid	">
	<ul>
	
	</ul>	
	<div class="row comment-area mb-5">		
		<div class="col-1 ">
			<div class="row h-100">
				<img class="rounded img-fluid" src="<c:url value="/resources/img/temp_.svg"/>" alt="..." />				
			</div>
		</div>
		<div class="col w-100">
			<div class="row ">
				<div class="col-2 writer text-left"><span class="h5 content">uginim</span><span>님</span></div>
				<div class="col-2 time text-left"><label for="">2020-03-11 00:00</label><span class="content"></span></div>
				<div class="col-3 ml-auto pl-auto text-right">				
				<div class="btn-group" >
					<button class="btn btn-light btn-sm reply ">답글</button>
					<button class="btn btn-light btn-sm modify ">수정</button>
					<button class="btn btn-light btn-sm cancel d-none">취소</button>
					<button class="btn btn-light btn-sm delete">삭제</button>
				</div>
				</div>
			</div>
<!-- 			<div class="row"> -->
				<dl class="row">
					<dt class="col-sm-1 comment-content">댓글</dt>
					<dd class="col-sm-9">Lorem ipsum dolor sit amet, consectetur adipisicing elit. In laboriosam a esse dolores eos animi facilis fugiat modi dolorem eaque ratione voluptatem laudantium aspernatur repellat veritatis repellendus ea doloribus amet.</dd>
				</dl>				
<!-- 			</div> -->
			<div class="row">											
					<div class="col-3 ml-auto text-right">
						<div class="btn-group" >
							<button class="btn btn-secondary btn-sm like" >좋아요&nbsp;<span class="badge btn-light">1</span></button>
							<button class="btn btn-secondary btn-sm dislike" >싫어요&nbsp;<span class="badge btn-light">1</span></button>
						</div>
					</div>			
			</div>
		</div>
	</div>	
		<div class="row child-comment">
			<div class="col-1"></div>
			<div class="col">
					<div class="row comment-area">		
						<div class="col-1 ">
							<div class="row h-100">
								<img class="rounded img-fluid" src="<c:url value="/resources/img/temp_.svg"/>" alt="..." />				
							</div>
						</div>
						<div class="col w-100">
							<div class="row ">
								<div class="col-2 writer"><span class="h5 content">uginim</span><span>님</span></div>
								<div class="col-2 time"><label for="">2020-03-11 00:00</label><span class="content"></span></div>
								<div class="col-3 ml-auto pl-auto text-right">				
								<div class="btn-group" >
									<button class="btn btn-light btn-sm reply ">답글</button>
									<button class="btn btn-light btn-sm modify ">수정</button>
									<button class="btn btn-light btn-sm cancel d-none">취소</button>
									<button class="btn btn-light btn-sm delete">삭제</button>
								</div>
								</div>
							</div>
				<!-- 			<div class="row"> -->
								<dl class="row">
									<dt class="col-sm-1 comment-content">@uginim</dt>
									<dd class="col-sm-9">Lorem ipsum dolor sit amet, consectetur adipisicing elit. In laboriosam a esse dolores eos animi facilis fugiat modi dolorem eaque ratione voluptatem laudantium aspernatur repellat veritatis repellendus ea doloribus amet.</dd>
								</dl>				
				<!-- 			</div> -->
							<div class="row">											
									<div class="col-3 ml-auto text-right">
										<div class="btn-group" >
											<button class="btn btn-secondary btn-sm like" >좋아요&nbsp;<span class="badge btn-light">1</span></button>
											<button class="btn btn-secondary btn-sm dislike" >싫어요&nbsp;<span class="badge btn-light">1</span></button>
										</div>
									</div>			
							</div>
						</div>
					</div>
			</div>
		</div>

</div>

<div class="d-flex justify-content-center">
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">이전</a></li>    
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	        <li class="page-item"><a class="page-link" href="#">다음</a></li>
	    
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
```
#### AJAX 복습
- XMLHttpRequest 객체
    - 
- 다른 언어/플랫폼에 자바스크립트 객체를 전송할 때는 문자열로 바꾸어 전송하는것이 좋음


[돌아가기](../README.md)  
[2020-02-28](whatIStudied_200228.md)  
[2020-03-06](whatIStudied_200306.md)  














