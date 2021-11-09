<%@page import="kr.smhrd.model.RestaurantsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// Object Casting (객체 형변환! - 제일 중요함!)
	// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
		ArrayList<RestaurantsVO> list = (ArrayList<RestaurantsVO>)request.getAttribute("list");
		
	// 위에 문장은 Object list = request.getAttribute("list");로 쓸 수 있다.
		String cpath = request.getContextPath(); 	// cpath : /m02

	// 세션값을 읽어오는 방법!
	//UserVO user = (UserVO)session.getAttribute("succ");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShineDish</title>

    <!-- font -->
    <meta charset="utf-8">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mainstyle.css">

    <!-- search -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    <!-- category -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

    <!-- slider -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
        $(document).ready(function(){
          $('.slider_list').bxSlider();
        });
    </script>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

    <!-- button -->
    <link rel="stylesheet" href="css/buttonstyle.css">

`    <!-- slieder -->
    <link rel="stylesheet" href="css/slider.css">

    <!-- font -->
    <link rel="stylesheet" href="fonts/font.css">
    <link rel="stylesheet" href="css/HS새마을체.css">

    <link rel="stylesheet" href="./slider2.css">

</head>
<body>
    <div id="shinedish">

        <!-- Page header -->
        <div id="header">

            <div class="logo">
                <a href="#" id="header_logo"><img src="img/shinedish_logo.png" alt="로고"></a>
            </div>

            <div class="search_box">
                <input class="search-txt" type = "text" name="" placeholder="Type to search">
                <a class="search-btn" href=""><i class="fas fa-search"></i></a>
            </div>

            <div class="menu">
                <a href="#" class="menu_list" >메인</a>
                <a href="#" class="menu_list" >맛집추천</a>
                <a href="#" class="menu_list" >MY페이지</a>
                <a href="#" class="menu_list" >로그인</a>
            </div>

        </div>

        <div id="line"><hr id="header_line" class="line_list"></div>

        <!-- Page Category -->
        <div id="category">
            
            <div class="category_list">

                <div class="category1">
                        <li class="category_list_01">
                            Click 01 - 지역
                            <ul class="sub" style="display:none">
                                <li><a href="#">동구</a></li>
                                <li><a href="#">서구</a></li>
                                <li><a href="#">남구</a></li>
                                <li><a href="#">북구</a></li>
                                <li><a href="#">광산구</a></li>
                            </ul>
                        </li>
                </div>

                <div class="category1">
                    <li class="category_list_01">
                        Click 02 - 음식 종류
                        <ul class="sub" style="display:none">
                            <li><a href="#">한식</a></li>
                            <li><a href="#">양식</a></li>
                            <li><a href="#">중식</a></li>
                            <li><a href="#">일식</a></li>
                            <li><a href="#">아시아</a></li>
                        </ul>
                    </li>
                </div>

                <div class="category1">
                    <li class="category_list_01">
                        Click 03 - 분위기
                        <ul class="sub" style="display:none">
                            <li><a href="#">맛좋은</a></li>
                            <li><a href="#">인기좋은</a></li>
                            <li><a href="#">경치좋은</a></li>
                            <li><a href="#">분위기 좋은</a></li>
                            <li><a href="#">가성비 좋은</a></li>
                        </ul>
                    </li>
                </div>

                <script>
                    $(".category1").click(function(){
                        if($(this).find(".sub").is(":visible")){
                            $(this).find(".sub").css("display","none");
                        }
                        else{
                            $(this).find(".sub").css("display","block");
                        }
                    })
                </script>

            </div>

        </div>

        <div id="line"><hr class="line_list"></div>

        <div id="line"><div id="line_list" class="line_img">맛집 사진</div></div>

        <!-- Page mainpage -->
        <div id="mainpage">

            <!-- Page slider-->
            <div id="slider">

                <div class="slider_list">
                    <li><div class="lim"><img class="slider_list_img" src="img/300x250.jpg" alt=""><img class="slider_list_img" src="img/300x250.jpg" alt=""><img class="slider_list_img" src="img/300x250.jpg" alt=""></div></li>
                    <li><div class="lim"><img class="slider_list_img" src="img/300x250.jpg" alt=""><img class="slider_list_img" src="img/300x250.jpg" alt=""><img class="slider_list_img" src="img/450x300.jpg" alt=""></div></li>
                    <li><div class="lim"><img class="slider_list_img" src="img/300x250.jpg" alt=""><img class="slider_list_img" src="img/food_03.png" alt=""><img class="slider_list_img" src="img/food_01.png" alt=""></div></li>
                    <li><div class="lim"><img class="slider_list_img" src="img/300x250.jpg" alt=""><img class="slider_list_img" src="img/300x250.jpg" alt=""><img class="slider_list_img" src="img/food_01.png" alt=""></div></li>
                    <li><div class="lim"><img class="slider_list_img" src="img/300x250.jpg" alt=""><img class="slider_list_img" src="img/food_03.png" alt=""><img class="slider_list_img" src="img/food_03.png" alt=""></div></li>
                </div> 

            </div>

            <!-- Page rst -->
            <div id="line"><hr class="line_list"></div>

            <div id="line"><div id="line_list">맛집 정보</div></div>

            <div id="rst">
                <div class="rst_box">
                    <div class="rst_inf">
                        <li><a class="rst_inf_list" href="#">맛집이름</a></li>
                        <li><a class="rst_inf_list" href="#">별점</a></li>
                        <li><a class="rst_inf_list" href="#">주소</a></li>
                        <li><a class="rst_inf_list" href="#">전화번호</a></li>                        
                        <li><a class="rst_inf_list" href="#">메인메뉴 & 추천메뉴</a></li>                            
                        <li><a class="rst_inf_list" href="#">가격정보</a></li>
                        <li><a class="rst_inf_list" href="#">영업시간</a></li>
                        <li><a class="rst_inf_list" href="#">휴무일</a></li>
                    </div>
                </div>
            </div>


            <!-- Page rst_button -->
                <div id="rst_button">
                    <li style="display: inline-block;">
                        <span><a href="#"><button class="rst_button_name" id="rst_pick" type="button">찜하기</button>></a></span>
                        <span><a href="#"><button class="rst_button_name" id="rst_review" type="button">리뷰쓰기</button></a></span>
                    </li>
                </div>

            <div id="line"><hr class="line_list"></div>

            <!-- Page map -->
            <div id="line"><div id="line_list">지도 정보</div></div>

            <div id="map">
                <div class="map_box">
                    <div class="map_inf">
                        <div class="map_inf_img"><iframe id="map_img_iframe" src="http://dbcut.com" name="site" frameborder="0"></a></iframe></div>
                    </div>
                </div>
            </div>

            <!-- Page map_button -->
            <div id="map_button">
                <li style="display: inline-block;">
                    <span><a href="https://www.google.com/" target="site"><button class="map_button_name" id="map_view" type="button">지도보기</button></a></span>
                    <span><a href="#"><button class="map_button_name" id="map_round" type="button">주변 놀거리</button></a></span>
                </li>
            </div>

            <!-- Page review -->
            <div id="line"><hr class="line_list"></div>

            <div id="line"><div id="line_list" class="line_review">리뷰 정보</div></div>

            <div id="review">

                    <div class="review_list">
                        <div class="review_photo"><img class="review_photo_img" src="img/food_01.png"></div>
                        <div class="review_write"><span><p>이 가게는 맛이 없습니다.</p></span></div>
                    </div>
                    <div class="review_star">
                        <small id="stsc class= text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    </div>

                    <hr>

                    <div class="review_list">
                        <div class="review_photo"><img class="review_photo_img" src="img/food_02.png"></div>
                        <div class="review_write"><span><p>이 가게는 맛이 없습니다.</p></span></div>
                    </div>
                    <div class="review_star">
                        <small id="stsc class= text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    </div>

                    <hr>

                    <div class="review_list">
                        <div class="review_photo"><img class="review_photo_img" src="img/food_03.png"></div>
                        <div class="review_write"><span><p>이 가게는 맛이 없습니다.</p></span></div>
                    </div>
                    <div class="review_star">
                        <small id="stsc class= text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    </div>

                    <hr>

                    <div class="review_list">
                        <div class="review_photo"><img class="review_photo_img" src="img/food_04.png"></div>
                        <div class="review_write"><span><p>이 가게는 맛이 없습니다.</p></span></div>
                    </div>
                    <div class="review_star">
                        <small id="stsc class= text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    </div>

                    <hr>

                    <div class="review_list">
                        <div class="review_photo"><img class="review_photo_img" src="img/food_05.png"></div>
                        <div class="review_write"><span><p>이 가게는 맛이 없습니다.</p></span></div>
                    </div>
                    <div class="review_star">
                        <small id="stsc class= text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    </div>

                    <hr>
                
                </div>


        <!-- Page footer -->
        <div id="line"><hr class="line_list"></div>
        
        <div id="footer">
            <span>
                <br>
                <p>ㅈㄴ 어렵다</p>
            </span>
        </div>

    </div>

</body>
</html>