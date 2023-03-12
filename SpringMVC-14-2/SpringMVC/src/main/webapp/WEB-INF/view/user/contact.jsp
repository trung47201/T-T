<!DOCTYPE html>
<html lang="en">
<title>What do you want? :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/index.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/swiper-bundle.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/slide.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/contact.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet" href='<c:url value="/assets/css/login-icon.css"/>'>
<style>
.ok-btn button {
    border: 1px solid;
    background: #0086ff;
    color: white;
    font-size: 20px;
    box-shadow: 0 0 5px #666;
}
.welcome {
    box-shadow: 0px 5px 15px;
}
</style>
<body style="color: white;">
    <header class="container-xl header-content">
        <form method="post">
            <jsp:include page="../layouts/user/header.jsp"></jsp:include>
<!--########################################3   START page CONTACT ###########################################-->
            <div class="title-page">
                <h3>Contact</h3>
                <span><a href="/welcome-to-uchiha-shoes/">Home</a> / <a href="contact">Contact</a></span>
            </div>

            <div class="info-contact">
                <div class="address-contact">
                    <div class="icon-contact">
                        <img src="<c:url value="/assets/images/icons/address30.png"/>" alt="address30-icon">
                    </div>
                    <div class="content-contact">
                        <div class="line-address">Address</div>
                        <div class="line-address">Dong Xuan - Soc Son - Ha Noi</div>
                    </div>
                </div>
                <div class="phone-contact">
                    <div class="icon-contact">
                        <img src="<c:url value="/assets/images/icons/headset32.png"/>" alt="address30-icon">
                    </div>
                    <div class="content-contact">
                        <div class="line-address">Hotline</div>
                        <div class="line-address">0346 643 755</div>
                    </div>
                </div>
                <div class="mail-contact">
                    <div class="icon-contact">
                        <img src="<c:url value="/assets/images/icons/question32.png"/>" alt="address30-icon">
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
                            <div class="line-address"><input type="text" name="" id="" required placeholder="Full name"></div>
                        </div>
                        <div class="customer-mail">
                            <div class="line-address">Email or phone number <em>*</em></div>
                            <div class="line-address"><input type="text" name="" id="" required placeholder="Email address"></div>
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


   <jsp:include page="../layouts/user/footer.jsp"></jsp:include>
   
   <jsp:include page="../layouts/user/search.jsp"></jsp:include>

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