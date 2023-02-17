<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<c:if test="${ product == 'true' }">
	<title>Product management :)</title>
</c:if>
<c:if test="${ colorSize == 'true' }">
	<title>Color - Size :)</title>
</c:if>
<c:if test="${ gallery == 'true' }">
	<title> Gallery :)</title>
</c:if>
<c:if test="${ bsg == 'true' }">
	<title>Brand - Style - Gender :)</title>
</c:if>


<link href="<c:url value="/assets/css/admin.css"/>">
<body>
    
<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>
       
        <!-- PRODUCT -->
        <section class="admin-shoes-product">
            <div class="title">
                <img src="<c:url value="assets/images/icons/icons8-trainers-100-title.png"/>" alt="">
                <h1>PROCUCT</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="<c:url value="assets/images/icons/icons8-home-page-64.png"/>" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-trainers-100-title.png"/>" alt="">
                    <a href="">Shoes</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-calendar-96.png"/>" alt="">
                    <a href="">Product</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addnewshoes">
                                <button class="addnewshoes" id="addnewshoes-product"><img src="<c:url value="assets/images/icons/icons8-add-64.png"/>"
                                        alt="icon-plus">Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Discount</th>
                            <th>Style</th>
                            <th>Brand</th>
                            <th>Gender</th>
                            <th>Created at</th>
                            <th>Updated at</th>
                            <th>Published at</th>
                            <th>Sold</th>
                            <th>Most loved</th>
                            <th class="th-description">Description</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>
                            <td>1</td>
                            <td>Nike Air Max 90 LTR</td>
                            <td>$175.55</td>
                            <td>20</td>
                            <td>Running</td>
                            <td>Sneaker</td>
                            <td>Men & Women</td>
                            <td>15-02-2023</td>
                            <td>15-02-2023</td>
                            <td>15-02-2023</td>
                            <td>1234</td>
                            <td>5000</td>
                            <td></td>
                            <td class="td-action">
                                <button class="btn-edit-order"><img src="<c:url value="assets/images/icons/icons8-edit-100.png"/>"
                                        alt=""></button>
                                <button class="btn-del-order"><img src="<c:url value="assets/images/icons/icons8-remove-60.png"/>"
                                        alt=""></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- Color - Size -->
        <section class="admin-shoes-color-size none">
            <div class="title">
                <img src="<c:url value="assets/images/icons/icons8-paint-palette-64.png"/>" alt="">
                <h1>COLOR - SIZE</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="<c:url value="assets/images/icons/icons8-home-page-64.png"/>" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-trainers-100-title.png"/>" alt="">
                    <a href="">Shoes</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-paint-palette-64.png"/>" alt="">
                    <a href="">Color - Size</a>
                </div>
            </div>
            <div class="list-table">
                <div class="table-order">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="<c:url value="assets/images/icons/icons8-add-64.png"/>"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th></th>
                                <th>ID</th>
                                <th>Product</th>
                                <th>Color</th>
                                <th>Rgb</th>
                                <th>Size</th>
                                <th>Quantity</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>
                                <td>1</td>
                                <td>Nike Air Max 90 LTR</td>
                                <td>Aqua Anders</td>
                                <td><span class="td-color-product" style="background: aqua;"></span></td>
                                <td>37</td>
                                <td>1999</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="<c:url value="assets/images/icons/icons8-edit-100.png"/>"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="<c:url value="assets/images/icons/icons8-remove-60.png"/>"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <div class="table-color">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="<c:url value="assets/images/icons/icons8-add-64.png"/>"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Color</th>
                                <th>Rgb</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                                <td>1</td>
                                <td>Aqua Anders</td>
                                <td><span class="td-color-product" style="background: aqua;"></span></td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="<c:url value="assets/images/icons/icons8-edit-100.png"/>"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="<c:url value="assets/images/icons/icons8-remove-60.png"/>"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-size">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="<c:url value="assets/images/icons/icons8-add-64.png"/>"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Size number</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                                <td>1</td>
                                <td>37</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="<c:url value="assets/images/icons/icons8-edit-100.png"/>"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="<c:url value="assets/images/icons/icons8-remove-60.png"/>"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- Gallery -->
        <section class="admin-shoes-gallery none">
            <div class="title">
                <img src="<c:url value="assets/images/icons/icons8-image-gallery-100.png"/>" alt="">
                <h1>GALLERY</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="<c:url value="assets/images/icons/icons8-home-page-64.png"/>" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-trainers-100-title.png"/>" alt="">
                    <a href="">Shoes</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-image-gallery-100.png"/>" alt="">
                    <a href="">Gallery</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addnewshoes">
                                <button class="addnewshoes"> <img src="<c:url value="assets/images/icons/icons8-add-64.png"/>" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Thumbnail</th>
                            <th>Product</th>
                            <th>Color</th>
                            <th>Description</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>
                            <td>Germany Alfreds Futterkiste</td>
                            <td><span class="td-color-product" style="background: aqua;"></span></td>
                            <td></td>
                            <td class="td-action">
                                <button class="btn-details-gallery"><img src="<c:url value="assets/images/icons/icons8-eye-64.png"/>"
                                        alt=""></button>
                                <button class="btn-edit-product"><img src="<c:url value="assets/images/icons/icons8-edit-100.png"/>"
                                        alt=""></button>
                                <button class="btn-del-order"><img src="<c:url value="assets/images/icons/icons8-remove-60.png"/>"
                                        alt=""></button>

                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </section>
        <!-- BRAND - STYLE - GENDER -->
        <section class="admin-shoes-brand-style-gender none">
            <div class="title">
                <img src="<c:url value="assets/images/icons/icons8-brand-58.png"/>" alt="">
                <h1>BRAND - STYLE - GENDER</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="<c:url value="assets/images/icons/icons8-home-page-64.png"/>" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-trainers-100-title.png"/>" alt="">
                    <a href="">Shoes</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-brand-58.png"/>" alt="">
                    <a href="">BRAND - STYLE - GENDER</a>
                </div>
            </div>
            <div class="list-table">
                <div class="table-brand">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="<c:url value="assets/images/icons/icons8-add-64.png"/>"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Brand</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Maria Anders</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="<c:url value="assets/images/icons/icons8-edit-100.png"/>"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="<c:url value="assets/images/icons/icons8-remove-60.png"/>"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-style">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="<c:url value="assets/images/icons/icons8-add-64.png"/>"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Style</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Maria Anders</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="<c:url value="assets/images/icons/icons8-edit-100.png"/>"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="<c:url value="assets/images/icons/icons8-remove-60.png"/>"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-gender">
                    <table class="order">
                        <thead>
                            <tr>
                                <th colspan="1000" class="td-addnewshoes">
                                    <button class="addnewshoes"> <img src="<c:url value="assets/images/icons/icons8-add-64.png"/>"
                                            alt="icon-plus"> Add New</button>
                                </th>
                            </tr>
                            <tr>

                                <th>ID</th>
                                <th>Gender</th>
                                <th class="td-action">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Maria Anders</td>
                                <td class="td-action">
                                    <button class="btn-edit-order"><img src="<c:url value="assets/images/icons/icons8-edit-100.png"/>"
                                            alt=""></button>
                                    <button class="btn-del-order"><img src="<c:url value="assets/images/icons/icons8-remove-60.png"/>"
                                            alt=""></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
       
    </div>

    <div class="message msg-order none">
        <h2>Message</h2>
        <p class="content-msg"></p>
        <div class="btn-ok-cancel">
            <input class="cancel" type="button" value="Cancel">
            <input class="ok hover-btn" type="button" value="OK">
        </div>
    </div>

    <div class="msg-done importantNone">
        Done!
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <script>
        function delProdInOrder (x) {
            $(".message").removeClass("none");
            $(".content-msg").text("Are you sure you want to delete this order?");
            var id_prod = x.id;
            $('.ok').click(function () {
                $(".message").addClass("none");
                setTimeout(function () {
                    $(".msg-done").removeClass("importantNone");
                    
                }, 500);
                setTimeout(function () {
                    $(".msg-done").addClass("importantNone");
                    
                }, 3000);
                $('.ok').removeData('clicked', true);
                alert(x.id);
                location.reload();
            });            
        }
    </script>
    
    <script>

        
            
        
        $('.cancel').click(function () {
            $(".message").addClass("none");
        });

    </script>
    <script>
        $('.btn-confirm-order').click(function () {
            $(".message").removeClass("none");
            $(".content-msg").text("Are you sure you want to browse this order?");
            var id_prod = this.id;
            $('.ok').click(function () {
                $(".message").addClass("none");
                setTimeout(function () {
                    $(".msg-done").removeClass("importantNone");
                    
                }, 500);
                setTimeout(function () {
                    $(".msg-done").addClass("importantNone");
                    
                }, 3000);
                $('.ok').removeData('clicked', true);
                alert(id_prod);
                location.reload();
            });       
        });
        $('.cancel').click(function () {
            $(".message").addClass("none");
        });
    </script>
    <script>
        $('.cancel').hover(function () {
            $(".ok").removeClass("hover-btn");
            $(".ok").removeClass("font-size-btn-msg");
            $(".cancel").addClass("hover-btn");
            $(".cancel").addClass("font-size-btn-msg");
        });
        $('.ok').hover(function () {
            $(".cancel").removeClass("hover-btn");
            $(".cancel").removeClass("font-size-btn-msg");
            $(".ok").addClass("hover-btn");
            $(".ok").addClass("font-size-btn-msg");
        });
    </script>
    <!-- ADD NEW ONCLICK-->
    <script>
        $('#addnewshoes-product').click(function () {
            $(".addneworder-nav").removeClass("importantNone");
            $(".table-order-add").addClass("importantNone");
            $(".title-add-new").removeClass("importantNone");
            $(".title-order-management").addClass("importantNone");
            $(".add-new-order-form").removeClass("importantNone");

        });
        $('#addneworder').click(function () {
            $(".addneworder-nav").removeClass("importantNone");
            $(".table-order-add").addClass("importantNone");
            $(".title-add-new").removeClass("importantNone");
            $(".title-order-management").addClass("importantNone");
            $(".add-new-order-form").removeClass("importantNone");

        });
        $('#editneworder').click(function () {
            $(".editneworder-nav").removeClass("importantNone");
            $(".table-order-add").addClass("importantNone");
            $(".title-edit-new").removeClass("importantNone");
            $(".title-order-management").addClass("importantNone");
            $(".edit-new-order-form").removeClass("importantNone");

        });
    </script>
    <script>
        $('.other').click(function () {
            $(".other-menu").removeClass("none", 10000, "easeInBack");
        });
    </script>
    <script>
        $('.dashboard').click(function () {
            window.location.href = "admin.html";
        });
        $('.admin-logo').click(function () {
            window.location.href = "admin.html";
        });
    </script>

    <script>
        var arrSec = document.getElementsByTagName("section");
        $(document).ready(function () {
            $(".sub-menu-ul").click(function () {
               window.location.href= this.id;
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $(".admin-menu-icon").click(function () {
                $(".navigation").toggle("none");
            });
        });
    </script>


    <script>
        var arrDiv = document.getElementsByClassName("menu");
        var arrP = document.getElementsByClassName("dropdown-menu");
        $(document).ready(function () {
            $(".menu").click(function () {
                var classSubMenu = "." + this.id;
                $(classSubMenu).toggle("none");
                for (let i = 0; i < arrP.length; i++) {
                    if (arrP[i].className.includes(this.id)) {
                        $(arrP[i]).toggleClass("rotate");
                    }
                }
            });
        });
    </script>

</body>

</html>