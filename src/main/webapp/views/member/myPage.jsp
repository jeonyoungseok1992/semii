<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#myPage-section1{
    margin-top: 40px;
    font-size: 28px;
    margin-left: 100px;
    font-weight: 700;
    
}

#myPage-section2{
    margin-left: 100px;
    margin-top: 70px;
    display: flex;
}

#myPage-section2 > div > img{
    border-radius: 70%;
    overflow: hidden;
}

#myPage-section2 > div{
    display: flex;
    flex-direction: column;
}

#change-profile{
    height: 48px;
    width: 180px;
    background-color: #ff6f0f;
    border: none;
    color: white;
}

#delete-member{
    height: 48px;
    width: 180px;
    border: 1px solid #ff6f0f;
    background-color: white;
    color: #ff6f0f;

}

#myPage-section2-1{
    display: flex;
    flex-direction: column;
    align-items: center;
}

#myPage-section2-1 img{
    width: 200px;
    height: 200px;
}

#myPage-section2-2{
    padding-left: 100px;
}

#myPage-section3{
    margin-left: 100px;
    
}


#enroll-form input{
    border: 1px solid gainsboro;
    height: 40px;
    margin: 15px 0px;
    width: 350px;
    padding-left: 15px;
}
button:disabled {
	background: #999;
	cursor: auto;
}

#enroll-form table{
    display: flex;
    flex-direction: column;
    justify-self:center;
    align-items: center;
}

.table-title {
    text-align: left; /* Adjust the text alignment (e.g., right) */
  

}
.table-content{
    margin-bottom: 20px;
    height: 40px;
}

.table-button{
    margin-left: 5px;
    height: 40px;
    width: 80px;
    background-color:  #ff6f0f;
    border: none;
    color: white;

}

* {
    list-style: none;
}




.menu-nav{
    font-size: 18px;
    background: white;
    margin-top: 50px;
 }
 .menu-nav li {
   display: inline-block;/*여백 없이 좌측으로 붙은 li*/
   padding: 0 40px 0 0;
 }
 .menu-nav a{
    color: black;/*폰트컬러*/
    font-weight: 500;/*폰트굵기*/
    text-decoration: none;/*a href 밑줄 등 글자 꾸밈 없음*/
    line-height: 40px;
    font-weight: 700;
 }
 .menu-nav a:hover{
 	color: #ff6f0f;
 }
 .menu-nav a:after {/*after 가상요소*/
    display:block;/*a요소를 블록 요소라고 선언*/
    width:100%;/*카테고리 메뉴 밑줄의 크기를 동일하게 주기 위해 width 설정*/
 /*혹시 동일하지 않길 바란다면 width 삭제*/
    content: '';
    border-bottom: solid 2px #ff6f0f;
    transform: scaleX(0);/*크기를 0으로 줌으로써 평상시엔 밑줄 없음*/
    transition: transform 250ms ease-in-out; /*변형 방식*/
 }
 .menu-nav a:hover:after {
    transform: scaleX(1);/*a 속성에 hover시 기존 크기로*/
 }


#myPage-section3{
	
    margin-left: 100px;
}

.myPage-section4{
	width: 900px;
    height: 100%;
    border-top: 1px solid rgb(211, 208, 208);
    padding: 30px 0;
    margin-left: 100px;
}

.myPage-section4 img{
	width:200px;
    height: 200px;
}

.myPage-section4-1{
    display: flex;
    margin: 40px;
    float: left;
    flex-direction: column;
  
}

.myPage-section4-2{
    margin-left: 40px;
    
    

}

.myPage-section4-contnet1{
    font-size: 30px;
}

.myPage-section4-contnet2{
    font-size: 20px;
    color: rgba(173, 167, 167, 0.801); 
    font-weight: 500;
}

.myPage-section4-contnet3{
    font-size: 20px;
}

.myPage-section4-contnet1, .myPage-section4-contnet2, .myPage-section4-contnet3{
    margin: 5px;
}
/*modal*/
.modal-title.updatest{
   font-size: 24px;
    font-weight: 700;
    line-height: 35px;
}
.btn.updatest{
   height: 60px;
    padding: 0 40px;
    font-weight: 700;
    border-radius: 0;
    margin-top: 16px;
    background-color: #ff6f0f;
    border: none;
    font-size: 16px;
}
.btn-secondary.updatest:hover{
   opacity: .8;
    background-color: #ff6f0f;
    border-color: #ff6f0f;
}
table.update  tbody tr td input{
   width: 100%;
    border: 1px solid gainsboro;
    height: 40px;
    margin: 15px 0px;
    padding-left: 15px; 
 
}

#plus-button{
    margin-left: 500px;




}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="../common/header.jsp"%>

    <%
    	String userName = loginUser.getUserName();
    	int userNo = loginUser.getUserNo();
        String userId = loginUser.getUserId();
        String userPwd = loginUser.getUserPwd();
        String Address = loginUser.getAddress();
        String profileUrl = loginUser.getProfileUrl();
     %>
     

     <section style="width: 1200px; margin: 0 auto;">
        <div id="myPage-section1">마이페이지</div>

        <div id="myPage-section2">
            <div id="myPage-section2-1">
                 <img src="${loginUser.profileUrl}"  id="title-img" width="250" height="170" onclick="chooseFile()">
                <br>


				<form action="updateImg.me" method="post"enctype="multipart/form-data">
					<input style="display : none" id="file" type="file" name="file" onchange="loadImg(this)" > <br>
					<input type="hidden" name="userNo" id="userNo" value="${loginUser.userNo}">
					<input type="hidden" name="filePath" value="resources/member_upfile/">
					<button type="submit" id="change-profile">프로필 사진 변경</button>
				</form>








			
                <br>
                <button id="delete-member" data-bs-toggle="modal" data-bs-target="#exampleModal">회원 탈퇴</button>
            </div>
            <div id="myPage-section2-2">
                 <form action="<%=contextPath %>/update.me" id="enroll-form" method="post">
                    <table id="mypage-table">
                        <td class="table-title">아이디</td>
                        <tr class="table-content">    
                            <td><input type="text" name="userId" maxlength="12" value="<%=userId %>" readonly></td>
                            <td><button class="table-button" type="button" data-bs-toggle="modal" data-bs-target="#updateIdModal">변경</button></td>
                        </tr>
                        <td class="table-title">비밀번호</td>
                        <tr>
                            <td><input type="password" name="userPwd" maxlength="15" value="<%=userPwd %>" readonly></td>
                            <td><button class="table-button" type="button" data-bs-toggle="modal" data-bs-target="#updatePwdModal">변경</button></td>
                        </tr>
                        <td class="table-title">이름</td>
                        <tr>
                            <td><input type="text" name="userName" maxlength="6" value="<%=userName %>" readonly></td>
                            <td><button class="table-button" type="submit" disabled>변경</button></td>
                        </tr>
                        <td class="table-title">주소</td>
                        <tr>
                            <td><input type="text" name="address" value="<%=Address%>"></td>
                            <td><button class="table-button" type="button" data-bs-toggle="modal" data-bs-target="#updateAdModal">변경</button></td>
                        </tr>

                    </table>
                </form>
        
            </div>
        </div>
         <!-- 아이디 변경용 Modal -->
       <div class="modal fade" id="updateIdModal">
           <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
           
                   <!-- Modal Header -->
                   <div class="modal-header" style="border-bottom: none; padding: 24px;">
                   <h4 class="modal-title updatest">아이디 변경</h4>
                   <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                   </div>
                   <!-- Modal body -->
                   <div class="modal-body" align="center" style="padding: 24px;">
                       <form action="<%=contextPath %>/updateId.me" method="post">
                           <table class="update">
                              <tr>
                                 <td style="width: 100px; font-weight: 600; font-size: 14px;">현재 아이디</td>
                                 <td><input type="text" name="userId" value=<%=userId %> readonly></td>
                              </tr>
                               <tr>
                                   <td style="width: 100px; font-weight: 600;  font-size: 14px;">변경할 아이디</td>
                                   <td><input type="text" name="updateId" required></td>
                               </tr>
                           </table>
                           <br>
                           <button id="edit-id-btn" type="submit" class="btn btn-sm btn-secondary updatest" >아이디변경</button>
                       </form>
                   </div>
               </div>
           </div>
       </div>
       
       <!-- 비밀번호 변경용 Modal -->
       <div class="modal fade" id="updatePwdModal">
           <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
           
                   <!-- Modal Header -->
                   <div class="modal-header" style="border-bottom: none; padding: 24px;">
                   <h4 class="modal-title updatest">비밀번호 변경</h4>
                   <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                   </div>
           
                   <!-- Modal body -->
                   <div class="modal-body" align="center" style="padding: 24px;">
                       <form action="<%=contextPath %>/updatePwd.me" method="post">
                          <input type="hidden" name="userId" value=<%=userId %> >
                           <table class="update">
                               <tr>
                                   <td style="width: 100px; font-weight: 600;  font-size: 14px;">현재 비밀번호</td>
                                   <td><input type="password" name="userPwd" required></td>
                               </tr>
                               <tr>
                                   <td style="width: 100px; font-weight: 600;  font-size: 14px;">변경할 비밀번호</td>
                                   <td><input type="password" name="updatePwd" required></td>
                               </tr>
                               <tr>
                                   <td style="width: 140px; font-weight: 600;  font-size: 14px;">변경할 비밀번호 확인</td>
                                   <td><input type="password" name="checkPwd" required></td>
                               </tr>
                           </table>
                           <br>
                           <button id="edit-pwd-btn" type="submit" class="btn btn-sm btn-secondary updatest" >비밀번호변경</button>
                       </form>
   
                       <script>
                           document.getElementById('edit-pwd-btn').onclick = function(){
                               if ($("input[name=updatePwd]").val() !== $("input[name=checkPwd]").val()) {
                                   alert("비밀번호를 확인해주세요.")
                                   return false;
                               }
                           }
                       </script>
                   </div>
               </div>
           </div>
       </div>
       
      <!-- 주소 변경용 Modal -->
       <div class="modal fade" id="updateAdModal">
           <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
           
                   <!-- Modal Header -->
                   <div class="modal-header" style="border-bottom: none; padding: 24px;">
                   <h4 class="modal-title updatest">주소 변경</h4>
                   <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                   </div>
                   <!-- Modal body -->
                   <div class="modal-body" align="center" style="padding: 24px;">
                       <form action="<%=contextPath %>/updateAddress.me" method="post">
                       <input type="hidden" name="userId" value=<%=userId %> >
                           <table class="update">
                              <tr>
                                 <td style="width: 100px; font-weight: 600;  font-size: 14px;">현재 주소</td>
                                 <td><input type="text" name="address" value="<%=Address%>" readonly></td>
                              </tr>
                               <tr>
                                   <td style="width: 100px; font-weight: 600;  font-size: 14px;">변경할 주소</td>
                                   <td><input type="text" name="updateAddress" required></td>
                               </tr>
                           </table>
                           <br>
                           <button id="edit-adress-btn" type="submit" class="btn btn-sm btn-secondary updatest" >주소변경</button>
                       </form>
                   </div>
               </div>
           </div>
       </div>

        <div class="menu-nav" id="myPage-section3"  align="left">
            <ul>                
                <li><a onclick="mylistinit()">내 글 보기</a></li>
                <li><a onclick="sellinit()">판매내역 보기</a></li>
                <li><a onclick="buyinit()">구매내역 보기</a></li>
             </ul>
          </div>

		<div class="myPage-section4">
    
		 </div>

		  <button id="plus-button" class="btn btn-secondary" align="right" onclick="moreList()">더보기</button>
		<script>
    	window.onload = function(){

    		mylistinit();

    	}
		
           function mylistinit(){
        	   $.ajax({
                   url : "mylist.bo",
                   data : {
                       writer : ${loginUser.userNo}
                   },
                   success : function(res){             
                   	
                       let str ="";
                       for(let board of	res){
                  	  
                    	   str += "<div class='myPage-section4-1' onclick=\"location.href='Detail.bo?bno="+board.boardNo+"'\">"
						+
                           "<img src='" + board.titleImg + "'>"+
                      
                       "<div class='myPage-section4-2'>"+
                           "<div  class='myPage-section4-contnet1'>"+board.boardTitle+"</div>"+
                           "<div  class='myPage-section4-contnet2'>"+board.address+"</div>"+
                           "<div  class='myPage-section4-contnet3'>"+board.amount+'원'+"</div>"+      
                       "</div>"+
                       "</div>"
                      
                  
                    
                           document.querySelector(".myPage-section4").innerHTML = str;
                       }
                   	
                   },
                   error : function(){
                       console.log("댓글목록 조회중 ajax통신 실패")
                   }
               })
           }
           
           
           function moreList(){
        	   console.log("옴");
        	   $.ajax({
                   url : "myAllList.bo",
                   data : {
                       writer : ${loginUser.userNo}
                   },
                   success : function(res){             
                	   console.log(res);
                       let str ="";
                       for(let board of	res){
                  	  
                       	str +="<div class='myPage-section4-1' onclick=\"location.href='Detail.bo'\">"
						+
                           "<img src=" + board.titleImg+">"+
                      
                       "<div class='myPage-section4-2'>"+
                           "<h1  class='myPage-section4-contnet1'>"+board.boardTitle+"</h1>"+
                           "<div  class='myPage-section4-contnet2'>"+board.address+"</div>"+
                           "<div  class='myPage-section4-contnet3'>"+board.amount+'원'+"</div>"+      
                       "</div>"+
                       "</div>"
                      
                  
                    
                           document.querySelector(".myPage-section4").innerHTML = str;
                       }
                   	
                   },
                   error : function(){
                       console.log("댓글목록 조회중 ajax통신 실패")
                   }
               })
           }
 
                
    </script>


     
        
        
<!--         <div  class="myPage-section4">
            <div>
                <img src="./resources/images/img/ioio.JPG" alt="">
            </div>
            <div class="myPage-section4-1">
                <h2  class="myPage-section4-contnet">에러 안나게 해주는 마법은</h2>
                <div  class="myPage-section4-contnet" style="color: rgba(173, 167, 167, 0.801); font-size: 15px; font-weight: 500;">서울특별시 역삼동</div>
                <h2  class="myPage-section4-contnet">140,000원</h2>      
            </div>
        </div>
        <div  class="myPage-section4">
            <div>
                <img src="./resources/images/img/ioio.JPG" alt="">
            </div>
            <div class="myPage-section4-1">
                <h2  class="myPage-section4-contnet">에러 안나게 해주는 마법은</h2>
                <div  class="myPage-section4-contnet" style="color: rgba(173, 167, 167, 0.801); font-size: 15px; font-weight: 500;">서울특별시 역삼동</div>
                <h2  class="myPage-section4-contnet">140,000원</h2>      
            </div>
        </div> -->
        
    </section>
    
    <script>
        (() => {
      const underLine = document.getElementById("menu_under_line"); //밑줄 그리는 요소
      const menus = document.querySelectorAll(".menu_ul .menu_li");
    
      //   각 리스트의 요소를 순회하며 접근
      menus.forEach((liEl) => {
        liEl.addEventListener("click", () => {
          resizeFunc(liEl);
        });
      });
    
    // 브라우저 크기가 달라져도 그 크기에 대응하도록 사이즈 재설정하는 함수
      const resizeFunc = (liEl) => {
        let left = liEl.offsetLeft;
        let top = liEl.offsetTop + liEl.offsetHeight;
        let width = liEl.offsetWidth;
    
        window.addEventListener("resize", () => {
          left = liEl.offsetLeft;
          top = liEl.offsetTop + liEl.offsetHeight;
          width = liEl.offsetWidth;
    
          underLineRenderingFunc(left, top, width); //재측정된 길이가 전달됨
        });
        underLineRenderingFunc(left, top, width); //제일 처음 측정된 길이가 전달됨
        // 위 두 개를 호출해야 브라우저 화면이 변경되어도 요소의 위치를 추적하여 변경된 위치로 밑줄이 재설정된다.
      };
    
      //   실제 밑줄을 그려주는 함수
      const underLineRenderingFunc = (left, top, width) => {
        underLine.style.visibility = "visible";
        underLine.style.width = `${width}px`;
        underLine.style.translate = `${left}px ${top + 2}px`;
      };
    })();
    </script>
    
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="margin-top: 150px;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body"  >
        <div id="pwd-input" style="display: flex; justify-content: space-around; align-items: center; flex-direction: column;">
            <div> <%=loginUser.getUserName()%>님, 회원탈퇴시 모든 정보가 삭제되오니,</div>
            <div>신중하게 탈퇴 신청을 해주시기 바랍니다.</div>
            <form action="<%=contextPath %>/delete.me" id="pwdCheck" method="post" style="margin-top: 5px;">
              <div class="form-floating" style="width: 350px;" >
            <input type="hidden" name="userId" value="<%=loginUser.getUserId() %>">
			  <input type="password" name="userPwd" class="form-control" id="floatingPassword" placeholder="password">
			  <label for="floatingPassword">비밀번호</label>
			</div>
			<div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">회원탈퇴</button>
	      	</div>
            </form>
        </div>
      </div>

    </div>
  </div>
</div>




       <script>
       
       
           function loadImg(inputFile){


               if(inputFile.files.length == 1){
                   const reader = new FileReader();
                   
                   reader.readAsDataURL(inputFile.files[0]);  

                   reader.onload = function(ev){
                 	 document.getElementById('title-img').src = ev.target.result; 
                      console.log(ev.target.result);
                   }   
 				} else {   
					document.getElementById('title-img').src = null;
               }
           }
       
       
           function chooseFile(){
               document.getElementById("file").click();
           }
           
           
           function goDetail(){
        	   
        	   
        	   
           }
           

       </script>






			


</body>



</html>