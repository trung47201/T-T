<!DOCTYPE html>
<html lang="en">
<title>Hi, how are you?</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/swiper-bundle.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/slide.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/question.css"/>">

<body style="color: white;">
    <header class="container-xl header-content">
        <form method="post">
            <div class="container-xl header-1">
                <a href="index.html"><img class="img-fluid logo-header" src="images/logo/logo_header.jpg"
                        alt="logo_UchihaShoes"></a>


                <img class="smartphone-icon" src="images/icons/smartphone48.png" alt="icon-smartphone">
                <p class="customer-support-content">Custormer Support<br>
                    <a class="phone" href="#">0346 643 755</a>
                </p>

                <!--################################################## btn LOGIN ################################################################### -->
                <div class="container-xl icon-user">
                    <button type="button" class="icon-user btn btn-primary" data-toggle="modal" data-target="#login">
                        <img class="icon-user" src="images/icons/user48.png" alt="icon-user">
                    </button>
                    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <button type="button" class="btn btn-secondary close" data-dismiss="modal">
                                    <img class="close-login-icon" src="images/icons/close48.png" alt="icon-close"
                                        width="32px">
                                </button>
                                <div class="login_form_container">
                                    <div class="login_form">
                                        <h2>Login</h2>
                                        <div class="input_group">
                                            <i class="fa fa-user"></i>
                                            <input type="text" placeholder="Username" class="input_text"
                                                autocomplete="off" />
                                        </div>
                                        <div class="input_group">
                                            <i class="fa fa-unlock-alt"></i>
                                            <input type="password" placeholder="Password" class="input_text"
                                                autocomplete="off" />
                                        </div>
                                        <div class="button_group" id="login_button">
                                            <a>Login</a>
                                        </div>
                                        <div class="fotter">
                                            <a>Forgot Password ?</a>
                                            <a>SingUp</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--################################################## btn Love Product ###################################################### -->
                <div class="container-xl icon-heart">
                    <button type="button" class="icon-user btn btn-primary" data-toggle="modal"
                        data-target="#heart"><img class="icon-heart" src="images/icons/heart.png"
                            alt="icon-user"></button>
                    <div class="modal fade" id="heart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--####################################   btn CART    ################################################# -->
                <div class="container-xl icon-cart">
                    <a href="cart.html">
                        <button type="button" class="icon-user btn btn-primary">
                            <img class="icon-cart" src="images/icons/cart48.png" alt="icon-user"
                                style="margin-top: -15px; margin-left: -15px;">
                        </button>
                    </a>
                </div>
            </div>

            <!--########################################3   START NAVIGATION ###########################################-->
            <div class="wrapper container-xl" style="background-color: #212122;">
                <nav>
                    <div class="content">
                        <ul class="links">
                            <li><a class="menu" href="index.html"><b>Home</b></a></li>
                            <li>
                                <a href="#" class="desktop-link menu"><b>Shoes</b></a>
                                <ul>
                                    <li><a class="menu" href="#">Drop Menu 1</a></li>
                                    <li><a class="menu" href="#">Drop Menu 2</a></li>
                                    <li><a class="menu" href="#">Drop Menu 3</a></li>
                                    <li><a class="menu" href="#">Drop Menu 4</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="desktop-link menu"><b>Accessories</b></a>
                                <ul>
                                    <li><a class="menu" href="#">Drop Menu 1</a></li>
                                    <li><a class="menu" href="#">Drop Menu 2</a></li>
                                    <li><a class="menu" href="#">Drop Menu 3</a></li>
                                    <li><a class="menu" href="#">Drop Menu 4</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="desktop-link menu"><b>News</b></a>
                                <ul>
                                    <li><a class="menu" href="#">Drop Menu 1</a></li>
                                    <li><a class="menu" href="#">Drop Menu 2</a></li>
                                    <li><a class="menu" href="#">Drop Menu 3</a></li>
                                    <li>
                                        <a href="#" class="desktop-link menu">More Items</a>
                                        <ul>
                                            <li><a class="menu" href="#">Sub Menu 1</a></li>
                                            <li><a class="menu" href="#">Sub Menu 2</a></li>
                                            <li><a class="menu" href="#">Sub Menu 3</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="menu" href="questions.html"><b>Questions</b></a></li>
                            <li><a class="menu" href="contact.html"><b>Contact</b></a></li>
                        </ul>
                    </div>
                    <div class="nav-search" id="nav-search">
                        <input class="container-xl search-nav" type="text" name="search-nav" id="search-nav"
                            placeholder="Search...">
                        <img class="search-triangle-nav-icon" src="images/icons/triangle32.png" alt="icon-triangle">
                        <a href="#" class="search-nav-link-icon">
                            <img class="search-nav-icon" src="images/icons/search48.png" alt="icon-search"
                                width="32px"></a>
                    </div>
                </nav>
            </div>

            <div class="search-keys">
                <input class="container-xl search key-search" type="text" name="search" id="search"
                    placeholder="Search...">
                <button type="button" class="search-triangle-btn">
                    <img class="search-triangle" src="images/icons/triangle32.png" alt="icon-triangle">
                    <div class="listkeys" id="listkeys">
                        <p>People also search</p>
                        <div class="listkeys-span1">
                            <div class="keys-search-span">
                                <span class="keys-search-span" id="span_Id1" onclick="test('1');">New shoes</span>
                                <span class="keys-search-span" id="span_Id2" onclick="test('2');">shoes</span>
                                <span class="keys-search-span" id="span_Id3" onclick="test('3');">boot</span>
                                <span class="keys-search-span" id="span_Id4" onclick="test('4');">sneaker</span>
                                <span class="keys-search-span" id="span_Id5" onclick="test('5');">nike</span>
                                <span class="keys-search-span" id="span_Id6" onclick="test('6');">adidas</span>
                                <span class="keys-search-span" id="span_Id7" onclick="test('7');">shoes adidas</span>
                                <span class="keys-search-span" id="span_Id8" onclick="test('8');">shoes nike</span>
                                <span class="keys-search-span" id="span_Id9" onclick="test('9');">shoes sneaker</span>
                                <span class="keys-search-span" id="span_Id10" onclick="test('10');">shoes boot</span>
                            </div>
                        </div>
                    </div>
                </button>
                <a href="#" class="search-link-icon">
                    <img class="search-icon" src="images/icons/search48.png" alt="icon-search" width="32px"></a>
            </div>
            <div class="title-page">
                <h3>Questions</h3>
                <span><a href="index.html">Home</a> / <a href="questions.html">Questions</a></span>
            </div>
            <div class="list-questions">
                <div class="question" id="question1" onclick="show(1);">
                    <h6 class="question">
                        1. Is the color of the product in the picture the same as the real thing?</h6>
                    <div class="answer" id="answer1">
                        Hello, the product is as shown in the picture. The color shown in the photo may be slightly
                        different from the real thing. Hi, the product is as shown in the picture. The color shown in
                        the photo may be slightly different from the real thing.
                        <hr>
                    </div>

                </div>
                <div class="question" id="question2" onclick="show(2);">
                    <h6 class="question">
                        2. When the product is out of stock, when will it be back in stock?</h6>
                    <div class="answer" id="answer2">
                        Hello, the product has not arrived yet, please follow Fanpage and Website to update product
                        status.
                        <hr>
                    </div>
                </div>
                <div class="question" id="question3" onclick="show(3);">
                    <h6 class="question">
                        3. Does the product have a warranty?</h6>
                    <div class="answer" id="answer3">
                        Hi, Uchiha Shoes does not have a warranty policy for the product. I am very sorry and hope for
                        your understanding.
                        <hr>
                    </div>
                </div>
                <div class="question" id="question4" onclick="show(4);">
                    <h6 class="question">
                        4. System of stores and opening times?</h6>
                    <div class="answer" id="answer4">
                        Opening hours are from 8:00 a.m. to 10:00 p.m. daily.
                        <hr>
                    </div>
                </div>
                <div class="question" id="question5" onclick="show(5);">
                    <h6 class="question">
                        5. When I have a problem, complaint, where to contact?</h6>
                    <div class="answer" id="answer5">
                        Hi, In case you have problems or questions that need support, please contact the hotline <b
                            style="color: #ff6200;">19002004</b> for direct advice.
                        Or you click on the contact item above the navigation bar, enter your personal information and
                        the problem to be answered.
                        <hr>
                    </div>
                </div>
                <div class="question" id="question6" onclick="show(6);">
                    <h6 class="question">
                        6. Does the store incur a transfer fee?</h6>
                    <div class="answer" id="answer6">
                        For all money transfers from Uchiha Shoes to the Shop, the transfer fee will be borne
                        by the Shop. Currently, Uchiha Shoes stipulates a household remittance fee of 1$/transaction.
                        <hr>
                    </div>
                </div>
                <div class="question" id="question7" onclick="show(7);">
                    <h6 class="question">
                        7. Does Uchiha Shoes have delivery timers?</h6>
                    <div class="answer" id="answer7">
                        Currently, Uchiha Shoes does not deliver timers. However, Uchiha Shoes can ensure morning
                        delivery,
                        afternoon delivery the next morning, will try to deliver to customers as soon as possible.
                        <hr>
                    </div>
                </div>
                <div class="question" id="question8" onclick="show(8);">
                    <h6 class="question">
                        8. Is it possible to delay delivery?</h6>
                    <div class="answer" id="answer8">
                        If at the time of delivery, the customer is busy, Uchiha Shoes will postpone and re-deliver on
                        the next shift or the date the customer has scheduled.
                        Uchiha Shoes always tries to re-deliver and assist customers with successful delivery. However,
                        for orders that are delayed
                        more than 3 times by customers, Uchiha Shoes will change the order status to Undelivered and
                        return the goods to the shop.
                        <hr>
                    </div>
                </div>
                <div class="question" id="question9" onclick="show(9);">
                    <h6 class="question">
                        9. Is it possible to change the delivery address after placing an order?</h6>
                    <div class="answer" id="answer9">
                        Hi, you can change the delivery address, please contact customer service as soon as possible
                        with your phone number,
                        order code and address you want to change so that the staff can assist you. Thank you.
                        <hr>
                    </div>
                </div>
                <div class="question" id="question10" onclick="show(10);">
                    <h6 class="question">
                        10. Does Uchiha Shoes accept refunded product returns?</h6>
                    <div class="answer" id="answer10">
                        Hi, Uchiha Shoes reserves the right to receive returned products for a refund but only in cases
                        where the problem or manufacturing
                        defect is on Uchiha Shoes's side and the product or similar product is out of stock.
                        <hr>
                    </div>
                </div>
            </div>
        </form>
    </header>


    <hr class="shadow">

    <footer>
        <form action="" method="post">
            <div class="footer">
                <div class="logo-footer">
                    <a href="index.html"><img class="logo-footer" src="images/logo/logo_footer.jpg"
                            alt="logo-footer"></a>
                    <div class="shop-name">
                        <p class="text-shadow"><a href="index.html">UCHIHA SHOES</a></p>
                    </div>
                </div>
                <div class="content-footer">
                    <div class="text-shadow">CONTACT WITH US</div>
                    <div class="content-footer-sub">
                        <div class="col1">
                            ABOUT US
                            <div class="content-col">
                                <a href="#">UCHIHA SHOES Community</a> <br>
                                <a href="#">UCHIHA SHOES Agency</a>
                            </div>
                        </div>
                        <div class="col2">
                            ADDRESS
                            <div class="content-col">
                                dovantrung47201@gmail.com <br>
                                Mr. Trung - 036 97 96 359
                            </div>
                        </div>
                        <div class="col3">
                            FOLLOW
                            <div class="follow-app">
                                <a href="https://www.facebook.com/trung472"><img src="images/icons/facebook60.png"
                                        alt="facebook60" class="app"></a>
                                <a href="https://github.com/trung47201/QLYTHUVIEN"><img
                                        src="images/icons/instagram60.png" alt="instagram60" class="app"></a>
                                <a href="https://www.youtube.com/channel/UCB_GgY-I9WyNOOjVAax3ayg"><img
                                        src="images/icons/youtube60.png" alt="youtube60" class="app"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="copyright">
            <div class="footer-copyright">UCHIHA SHOES Â© 2022 All rights reserved.</div>
        </form>
    </footer>

    <script>
        function show(str) {
            for (let i = 1; i <= 10; i++) {
                if (str == i) {
                    var question1 = document.getElementById("question" + i);
                    var answer1 = document.getElementById("answer" + i);
                    let text = (answer1.offsetHeight) + "px";
                    question1.style.marginBottom = text;
                    answer1.style.visibility = "visible";
                } else {
                    var question1 = document.getElementById("question" + i);
                    var answer1 = document.getElementById("answer" + i);
                    question1.style.marginBottom = "0px";
                    answer1.style.visibility = "hidden";
                }
            }

        }
    </script>

    <script>
        function test($a) {
            for (let i = 1; i <= 10; i++) {
                if (i == $a) {
                    var span_Text = document.getElementById("span_Id" + $a).innerText;
                    document.querySelector('input[name="search"]').value = span_Text;
                }
            }
        }
    </script>

    <script type="text/javascript">
        window.addEventListener("scroll", function () {
            var div = document.getElementById('nav-search');
            var div1 = document.getElementsByClassName('hidden-poster2');
            if (window.scrollY > 80) {
                div.style.visibility = 'visible';
            } else {
                div.style.visibility = 'hidden';
            }
            if (window.scrollY > 2280 && window.scrollY < 2380) {
                div1.style.visibility = 'hidden';
            } else {
                div1.style.visibility = 'visible';
            }
        })
    </script>

    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            effect: "coverflow",
            grabCursor: true,
            centeredSlides: true,
            slidesPerView: "auto",
            coverflowEffect: {
                rotate: 0,
                stretch: 0,
                depth: 150,
                modifier: 1,
                slideShadows: true,
            },
            loop: true,
        });
    </script>
    <!-- auto play header slide -->
    <script type="text/javascript">
        var counter = 1;
        setInterval(function () {
            document.getElementById('radio' + counter).checked = true;
            counter++;
            if (counter > 4) {
                counter = 1;
            }
        }, 5000);
    </script>

    <script>
        function bigImg(x) {
            var listkeys = document.getElementById("listkeys");
            listkeys.style.visibility = 'visible';
        }

        function normalImg(x) {
            var listkeys = document.getElementById("listkeys");
            listkeys.style.visibility = 'hidden';
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="js/login.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>