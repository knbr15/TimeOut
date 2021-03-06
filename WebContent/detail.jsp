<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="project.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//Hashtable pgList=(Hashtable)request.getAttribute("pgList");
	//pgList.get("count"); => ${pgList.count}와 동일
%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>detail page</title>

<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="assets/css/preload.css" rel="stylesheet">
<link href="assets/css/vendors.css" rel="stylesheet">
<link rel="stylesheet" href="detail/detail.css">
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
/* function initialize() {
  var mapProp = {
    center:new google.maps.LatLng(37.250943, 127.028344),
    zoom:5,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
google.maps.event.addDomListener(window, 'load', initialize); */
</script>

</head>

<body>
<main class="main-container">

<article class="listing-page">

	<header class="listing-header">
		<div class="container">
		<div class="listing-title-container">
				<h1 class="listing-title">The NoMad</h1>
		</div>
		<div class="listing-header-info">
			<div class="flag-group flag-category">
				<span class="flag-main-category">Restaurant</span>
				<span class="flag-sub-category">, French</span>
			</div>
			<div class="flag-group flag-location">
				<span class="align-hz">
					<span class="material-icons md-14">room</span>Flatiron
				</span>
			</div>
			<div class="flag-group flag-price">
				<div class="price-rating">
					<span class="fa fa-dollar text-red"></span>
					<span class="fa fa-dollar text-red"></span>
					<span class="fa fa-dollar text-red"></span>
					<span class="fa fa-dollar text-red"></span>
				</div>
			</div>
			<div class="flag-group flag-timeout-rating">
				<div class="star-rating">
					<span class="fa fa-star text-red"></span>
					<span class="fa fa-star text-red"></span>
					<span class="fa fa-star text-red"></span>
					<span class="fa fa-star text-red"></span>
					<span class="fa fa-star text-gray"></span>
				</div>
			</div>
			<div class="flag-group flag-user-rating">
				<div class="star-rating">
					<span class="fa fa-star text-blue"></span>
					<span class="fa fa-star text-blue"></span>
					<span class="fa fa-star text-blue"></span>
					<span class="fa fa-star text-blue"></span>
					<span class="fa fa-star text-gray"></span>
				</div>
				<a href="#usersSay" class="text-blue">(<span class="comment_count">8</span><span class="xs-hide"> user reviews</span>)</a>
				<!-- 클릭시 user review 탭이 열리면서 review 볼 수 있게 -->
			</div>
		</div>
		</div>
	</header>
	
	<section class="listing-content">
	<div class="container slide-show">
		<div id="carousel-example-generic" class="carousel slide">
			<ol class="carousel-indicators">
		  	<li data-taget="#carousel-example-generic" data-slide-to="0" class="active"></li>
		  	<li data-taget="#carousel-example-generic" data-slide-to="1"></li>
		  	<li data-taget="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
		  	<div class="item active">
		    	<img src="https://media.timeout.com/images/100447527/750/422/image.jpg" alt="(Photograph: Daniel Krieger)" />
		 		</div>
		 		<div class="item">
		   		<img src="https://media.timeout.com/images/100447521/750/422/image.jpg" alt="(Photograph: Daniel Krieger)" />
				</div>
		 		<div class="item">
		  		<img src="https://media.timeout.com/images/100447531/750/422/image.jpg" alt="(Photograph: Daniel Krieger)" />
		 		</div>
			</div>
			<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"><span class="icon-prev"></span></a>
			<a class="right carousel-control" href="#carousel-example-generic" data-slide="next"><span class="icon-next"></span></a>	
		</div>
	</div>
		
	<div class="container">
		<!-- vendors.css에서 nav-pills 의 padding 부분 변경함!!!!!!!!!!!! -->
		<ul class="nav nav-pills nav-justified ar-nav-pills max-width-500 center-block margin-bottom">
			<li class="active">
				<a href="#timeoutSays" data-toggle="tab"><div>TIMEOUT SAYS</div>
					<div class="flag-group flag-timeout-rating">
						<div class="star-rating">
							<span class="fa fa-star text-red"></span>
							<span class="fa fa-star text-red"></span>
							<span class="fa fa-star text-red"></span>
							<span class="fa fa-star text-red"></span>
							<span class="fa fa-star text-gray"></span>
						</div>
					</div>
				</a>
			</li>
    	<li>
    		<a href="#details" data-toggle="tab"><div>DETAILS</div></a>
			</li>
    	<li>
    		<a href="#usersSay" data-toggle="tab"><div>USERS SAYS (<span class="comment_count">8</span>)</div>
					<div class="flag-group flag-user-rating">
						<div class="star-rating">
							<span class="fa fa-star text-blue"></span>
							<span class="fa fa-star text-blue"></span>
							<span class="fa fa-star text-blue"></span>
							<span class="fa fa-star text-blue"></span>
							<span class="fa fa-star text-gray"></span>
						</div>
					</div>
				</a>
    	</li>
		</ul>			

		<div class="listing-panel tab-content margin-top">
				<!-- timeout 리뷰 -->
				<div id="timeoutSays" class="tab-pane active panel-content">
					<p>Chef Daniel Humm and William Guidara, the celebrated team behind Eleven Madison Park, turn the music up for their sophomore venture in the NoMad Hotel. Ditching EMP's tasting-menu-only format, Humm takes a more democratic approach with an à la carte menu of seasonal, French-inflected fare.  The venue comprises five distinct spaces, all designed by Parisian architect Jacques Garcia: a dark-oak-clad dining room with heavy fabrics and an open hearth; a sunlit atrium with a pyramidal glass roof; a cozy fireplace room; a library for afternoon tea and evening nightcaps; and a cocktail lounge featuring a stately mahogany bar.</p>
					<footer>
						<p>BY: MARI UYEHARA</p>
						<p>POSTED: <time datetime="2018-05-24">THURSDAY MAY 24 2018</time></p>
					</footer>
				</div>
				<!-- 상세 내용 -->
				<div id="details" class="tab-pane panel-content">
					<table class="table table-borderless">
						<tr>
							<th>Venue name:</th>
							<td>The NoMad</td>
						</tr>
						<tr>
							<th>Contact:</th>
							<td>
								<a class="box-button visit-btn" href="https://www.thenomadhotel.com/" target="_blank"><span class="fa fa-share-square-o"></span>Visit Website</a>
								<a class="box-button call-btn" href="javascript:void(0);"><span class="fa fa-phone"></span>Call Venue</a>
							</td>
						</tr>
						<tr>
							<th>Address:</th>
							<td>
								The NoMad Hotel <br>
								1170 Broadway <br>
								New York <br>
								10001 
							</td>
						</tr>
						<tr>
							<th>Opening hours:</th>
							<td>Mon–Thu 7am–10:30pm; Fri, Sat 7am–11pm; Sun 7am–10pm</td>
						</tr>
						<tr>
							<th>Transport:</th>
							<td>Subway: N, R to 28th St</td>
						</tr>
						<tr>
							<th>Price:</th>
							<td>Average main course: $36. AmEx, Disc, MC, V</td>
						</tr>
					</table>
					<!-- map -->
					<div id="googleMap" style="width:80%;height:auto;margin:0 auto;position:relative;top:20px;">*** google map AIP 삽입 ***</div>
				</div>
				<!-- 사용자 리뷰 -->
				<div id="usersSay" class="tab-pane panel-content">
					 <div class="review-button-wrapper">
         		<!--<button class="review-button"><span class="fa fa-pencil"></span>Write Review</button>-->
         		
         		<!-- ************** collapse toggle 기능 에러 ****************-->
          	<button class="review-button" data-toggle="collapse" data-target="#review-form"><span class="fa fa-pencil"></span>Write Review</button>
           </div>
           
           <div id="review">
           <!-- star-rating 추가 -->
           <div id="review-form" class="collapse"> 
  
 						 <!-- Rating Stars Box -->
  					 <div class='rating-stars text-center'>
   					 	<ul id='stars'>
      					<li class='star' title='1 out of 5' data-value='1'>
        					<i class='fa fa-star fa-fw'></i>
      					</li>
      					<li class='star' title='2 out of 5' data-value='2'>
        					<i class='fa fa-star fa-fw'></i>
      					</li>
      					<li class='star' title='3 out of 5' data-value='3'>
        					<i class='fa fa-star fa-fw'></i>
      					</li>
      					<li class='star' title='4 out of 5' data-value='4'>
       					  <i class='fa fa-star fa-fw'></i>
      					</li>
      					<li class='star' title='5 out of 5' data-value='5'>
        					<i class='fa fa-star fa-fw'></i>
      					</li>
    					</ul>
  					</div>
	
                <form role="form">
                    <div class="form-group">
                        <label for="inputName">Name</label>
                        <input type="email" class="form-control" id="inputName" placeholder="Your name">
                    </div>
                    <div class="form-group">
                        <label for="inputEmail">Email</label>
                        <input type="email" class="form-control" id="inputEmail" placeholder="example@example.com">
                    </div>
                    <div class="form-group">
                        <label for="inputMessage">Message</label>
                        <textarea class="form-control"  id="inputMessage" rows="6"></textarea>
                    </div>
                    <button type="submit" class="btn btn-ar submit-button">Submit</button>
                    <!-- submit 버튼 클릭시 리뷰 저장되어 아래 목록에 보이게 -->
                </form>
            </div> <!-- comment-form -->
            
						<div><!-- reply button 클릭시 리플 달 수 있게 -->
                <h2  class="section-title">Comments</h2>
                <ul class="list-unstyled">
                    <li class="comment">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <!-- <img src="assets/js/holder.js/100x100/sky/text:avatar" alt="" class="imageborder alignleft"> -->
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fruuntur timorem maiores. Efficiatur calere labefactant impendere praesidia ullius, necesse graecis refugiendi angusta, nescius augeri monstruosi ornatum provincias. Iucundum dolemus iucundius cruciantur affert inflammati circumcisaque certae, privatione epularum tollunt videre reliquaque maiestatis veserim inflammati vituperari memoriter.</p>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-lg-10 col-md-9 col-sm-8">
                                        <i class="fa fa-user"> </i> <a href="#">Patrick</a> <i class="fa fa-clock-o"></i> Sep 29, 2013
                                        <div class="flag-group comment-star-rating ">
																					<div class="star-rating">
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-gray"></span>
																					</div>
                                    		</div>
                                    
																		</div>
                                    <div class="col-lg-2 col-md-3 col-sm-4">
                                        <a href="#" class="pull-right">Reply</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="list-unstyled sub-comments">
                            <li class="comment">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <!-- <img src="assets/js/holder.js/100x100/sky/text:avatar" alt="" class="imageborder alignleft"> -->
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fruuntur timorem maiores. Efficiatur calere labefactant impendere praesidia ullius, necesse graecis refugiendi angusta, nescius augeri monstruosi ornatum provincias. Iucundum dolemus iucundius cruciantur affert inflammati circumcisaque certae, privatione epularum tollunt videre reliquaque maiestatis veserim inflammati vituperari memoriter.</p>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-lg-10 col-md-9 col-sm-8">
                                                <i class="fa fa-user"> </i> <a href="#">Patrick</a> <i class="fa fa-clock-o"></i> Sep 29, 2013
                                                <div class="flag-group comment-star-rating ">
																					<div class="star-rating">
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-gray"></span>
																					</div>
                                    		</div>
                                            </div>
                                            <div class="col-lg-2 col-md-3 col-sm-4">
                                                <a href="#" class="pull-right">Reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="comment">
                                <div class="panel panel-primary">
                                    <div class="panel-body">
                                        <!-- <img src="assets/js/holder.js/100x100/sky/text:avatar" alt="" class="imageborder alignleft"> -->
                                        <p><strong>Comment Highlights!</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fruuntur timorem maiores. Efficiatur calere labefactant impendere praesidia ullius, necesse graecis refugiendi angusta, nescius augeri monstruosi ornatum provincias. Iucundum dolemus iucundius cruciantur affert inflammati circumcisaque certae, privatione epularum tollunt videre reliquaque maiestatis veserim inflammati vituperari memoriter.</p>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-lg-10 col-md-9 col-sm-8">
                                                <i class="fa fa-user"> </i> <a href="#">Patrick</a> <i class="fa fa-clock-o"></i> Sep 29, 2013
                                                <div class="flag-group comment-star-rating ">
																					<div class="star-rating">
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-gray"></span>
																					</div>
                                    		</div>
                                            </div>
                                            <div class="col-lg-2 col-md-3 col-sm-4">
                                                <a href="#" class="pull-right">Reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="list-unstyled sub-comments">
                                    <li class="comment">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <!-- <img src="assets/js/holder.js/100x100/sky/text:avatar" alt="" class="imageborder alignleft"> -->
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fruuntur timorem maiores. Efficiatur calere labefactant impendere praesidia ullius, necesse graecis refugiendi angusta, nescius augeri monstruosi ornatum provincias. Iucundum dolemus iucundius cruciantur affert inflammati circumcisaque certae, privatione epularum tollunt videre reliquaque maiestatis veserim inflammati vituperari memoriter.</p>
                                            </div>
                                            <div class="panel-footer">
                                                <div class="row">
                                                    <div class="col-lg-10 col-md-9 col-sm-8">
                                                        <i class="fa fa-user"> </i> <a href="#">Patrick</a> <i class="fa fa-clock-o"></i> Sep 29, 2013
                                                        <div class="flag-group comment-star-rating ">
																					<div class="star-rating">
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-gray"></span>
																					</div>
                                    		</div>
                                                    </div>
                                                    <div class="col-lg-2 col-md-3 col-sm-4">
                                                        <a href="#" class="pull-right">Reply</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li class="comment">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <!-- <img src="assets/js/holder.js/100x100/sky/text:avatar" alt="" class="imageborder alignleft"> -->
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fruuntur timorem maiores. Efficiatur calere labefactant impendere praesidia ullius, necesse graecis refugiendi angusta, nescius augeri monstruosi ornatum provincias. Iucundum dolemus iucundius cruciantur affert inflammati circumcisaque certae, privatione epularum tollunt videre reliquaque maiestatis veserim inflammati vituperari memoriter.</p>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-lg-10 col-md-9 col-sm-8">
                                                <i class="fa fa-user"> </i> <a href="#">Patrick</a> <i class="fa fa-clock-o"></i> Sep 29, 2013
                                                <div class="flag-group comment-star-rating ">
																					<div class="star-rating">
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-gray"></span>
																					</div>
                                    		</div>
                                            </div>
                                            <div class="col-lg-2 col-md-3 col-sm-4">
                                                <a href="#" class="pull-right">Reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="comment">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <!-- <img src="assets/js/holder.js/100x100/sky/text:avatar" alt="" class="imageborder alignleft"> -->
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fruuntur timorem maiores. Efficiatur calere labefactant impendere praesidia ullius, necesse graecis refugiendi angusta, nescius augeri monstruosi ornatum provincias. Iucundum dolemus iucundius cruciantur affert inflammati circumcisaque certae, privatione epularum tollunt videre reliquaque maiestatis veserim inflammati vituperari memoriter.</p>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-lg-10 col-md-9 col-sm-8">
                                        <i class="fa fa-user"> </i> <a href="#">Patrick</a> <i class="fa fa-clock-o"></i> Sep 29, 2013
                                        <div class="flag-group comment-star-rating ">
																					<div class="star-rating">
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-gray"></span>
																					</div>
                                    		</div>
                                    </div>
                                    <div class="col-lg-2 col-md-3 col-sm-4">
                                        <a href="#" class="pull-right">Reply</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="comment">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <!-- <img src="assets/js/holder.js/100x100/sky/text:avatar" alt="" class="imageborder alignleft"> -->
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fruuntur timorem maiores. Efficiatur calere labefactant impendere praesidia ullius, necesse graecis refugiendi angusta, nescius augeri monstruosi ornatum provincias. Iucundum dolemus iucundius cruciantur affert inflammati circumcisaque certae, privatione epularum tollunt videre reliquaque maiestatis veserim inflammati vituperari memoriter.</p>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-lg-10 col-md-9 col-sm-8">
                                        <i class="fa fa-user"> </i> <a href="#">Patrick</a> <i class="fa fa-clock-o"></i> Sep 29, 2013
                                        <div class="flag-group comment-star-rating ">
																					<div class="star-rating">
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-gray"></span>
																					</div>
                                    		</div>
                                    </div>
                                    <div class="col-lg-2 col-md-3 col-sm-4">
                                        <a href="#" class="pull-right">Reply</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="list-unstyled sub-comments">
                            <li class="comment">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <!-- <img src="assets/js/holder.js/100x100/sky/text:avatar" alt="" class="imageborder alignleft"> -->
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fruuntur timorem maiores. Efficiatur calere labefactant impendere praesidia ullius, necesse graecis refugiendi angusta, nescius augeri monstruosi ornatum provincias. Iucundum dolemus iucundius cruciantur affert inflammati circumcisaque certae, privatione epularum tollunt videre reliquaque maiestatis veserim inflammati vituperari memoriter.</p>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-lg-10 col-md-9 col-sm-8">
                                                <i class="fa fa-user"> </i> <a href="#">Patrick</a> <i class="fa fa-clock-o"></i> Sep 29, 2013
                                                <div class="flag-group comment-star-rating ">
																					<div class="star-rating">
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-blue"></span>
																						<span class="fa fa-star text-gray"></span>
																					</div>
                                    		</div>
                                            </div>
                                            <div class="col-lg-2 col-md-3 col-sm-4">
                                                <a href="#" class="pull-right">Reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div> <!-- comments -->
					</div><!-- #review -->
         </div> <!-- 사용자 리뷰 -->
			</div>
	</div>
	
</section>	
</article>
</main>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src=".boot/js/bootstrap.min.js"></script>
<script type="text/javascript" src=".assets/js/vendors.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="detail/detail.js"></script>
<script>
	// 부트스트랩 이미지 carousel 적용
	$('.carousel').carousel();
	
</script>

</body>
</html>