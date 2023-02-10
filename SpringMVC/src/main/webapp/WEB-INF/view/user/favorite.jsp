<!DOCTYPE html>
<html lang="en">
<title>What do you want? :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/swiper-bundle.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/slide.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/favorite.css"/>">

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
                            <div class="keys-search-span" >
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
                <h3>Contact</h3>
                <span><a href="index.html">Home</a> / <a href="contact.html">Contact</a></span>
            </div>

            <div class="info-contact">
                <div class="address-contact">
                    <div class="icon-contact">
                        <img src="images/icons/address30.png" alt="address30-icon">
                    </div>
                    <div class="content-contact">
                        <div class="line-address">Address</div>
                        <div class="line-address">Đông Xuân - Sóc Sơn - Hà Nội</div>
                    </div>
                </div>
                <div class="phone-contact">
                    <div class="icon-contact">
                        <img src="images/icons/headset32.png" alt="address30-icon">
                    </div>
                    <div class="content-contact">
                        <div class="line-address">Hotline</div>
                        <div class="line-address">0346 643 755</div>
                    </div>
                </div>
                <div class="mail-contact">
                    <div class="icon-contact">
                        <img src="images/icons/question32.png" alt="address30-icon">
                    </div>
                    <div class="content-contact">
                        <div class="line-address">Q&A</div>
                        <div class="line-address">dovantrung47201@gmail.com</div>
                    </div>
                </div>
            </div>

            <div class="info-contact">
                <div class="map-contact">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3719.440687427703!2d105.87790031744385!3d21.2143666!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31350474c1ccb777%3A0xba4d783d17b8b62f!2zeMOzbSBDaMO0aSwgxJDDtG5nIFh1w6JuLCBTw7NjIFPGoW4sIEjDoCBO4buZaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1673858104091!5m2!1svi!2s"
                        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <div class="customer-contact">
                    <div class="customer-info">
                        <div class="customer-name">
                            <div class="line-address">Your name <em>*</em></div>
                            <div class="line-address"><input type="text" name="" id="" required></div>
                        </div>
                        <div class="customer-mail">
                            <div class="line-address">Email or phone number <em>*</em></div>
                            <div class="line-address"><input type="text" name="" id="" required></div>
                        </div>
                    </div>
                    <div class="content-question">
                        <div>Descriptions <em>*</em></div>
                        <div class="txt-ques">
                            <textarea class="content-question"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="send">
                <button>Send</button>
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
            <div class="footer-copyright">UCHIHA SHOES © 2022 All rights reserved.</div>
        </form>
    </footer>



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