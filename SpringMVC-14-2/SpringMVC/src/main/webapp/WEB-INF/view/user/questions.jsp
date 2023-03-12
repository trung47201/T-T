<!DOCTYPE html>
<html lang="en">
<title>Hi, how are you?</title>
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
<link rel="stylesheet" href="<c:url value="/assets/css/question.css"/>">
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

    <jsp:include page="../layouts/user/footer.jsp"></jsp:include>
    <jsp:include page="../layouts/user/search.jsp"></jsp:include>

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