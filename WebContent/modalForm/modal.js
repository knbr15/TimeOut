
  // 모든 모달창 숨기기

  
  // header의 create account 버튼 클릭시 모달창 오픈
 function openSignupModal(){
	 document.getElementById('snsSignup').style.display='block';
 }

  // create an account 모달창에서 join with email 클릭시
 function linkToSignupModal(){
	 document.getElementById('signup').style.display='block';
	  document.getElementById('snsSignup').style.display='none';
 }
  
  // create an account 모달창에서 log in 클릭시
  function linkToLoginModal1(){
	  document.getElementById('login').style.display='block';
	  document.getElementById('snsSignup').style.display='none';
  }
  
  //almost there 모달창에서 log in 클릭시
  function linkToLoginModal2(){
	  document.getElementById('login').style.display='block';
	  document.getElementById('signup').style.display='none';
  }
  
  $(function(){
	  // almost there에서 되돌아가기 버튼
	  $('#before').on('click',function(){
		  $('#snsSignup').show();
		  $('#signup').hide();
	  })
	  
	  // 동의 체크 안 했을때 에러메세지
	  $('.error-text').hide();
	  $('.consent input:checkbox').change(function(){
		  var ischecked = $(this).is(':checked');
		  if(!ischecked){
			  $('.error-text').show();
		  }
		  if(ischecked){
			  $('.error-text').hide();
		  }
	  })
  })
  
  // header의 sign in 버튼 클릭시 모달창 오픈
 function openLoginModal(){
	 document.getElementById('login').style.display='block';
 }
  
  // sign in 모달창에서 join here 클릭시
 function linkToSnsSignupModal(){
	 document.getElementById('snsSignup').style.display='block';
	 document.getElementById('login').style.display='none';
 }
   
  // sign in 모달창에서 forgot? 클릭시

  
/* modal 에서 창 바깥 클릭시 */
 // Get the modal
 	var loginModal = document.getElementById('login');
	var snsSignupModal = document.getElementById('snsSignup');
	var signupModal = document.getElementById('signup');
 // When the user clicks anywhere outside of the modal, close it
 window.onclick = function(event) {
   if (event.target == loginModal) {
       loginModal.style.display = "none";
   } else if (event.target == snsSignupModal) {
       snsSignupModal.style.display = "none";
   } else if (event.target == signupModal) {
       signupModal.style.display = "none";
   }
 }	
	
 
