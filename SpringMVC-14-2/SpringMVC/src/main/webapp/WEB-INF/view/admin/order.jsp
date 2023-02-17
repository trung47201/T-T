<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value ="/assets/css/admin-order.css"/>">
<c:if test="${ management == 'true' }">
	<title>Order management :)</title>
</c:if>
<c:if test="${ search== 'true' }">
	<title>Order search :)</title>
</c:if>

<body>
    <jsp:include page="../layouts/admin/header.jsp"></jsp:include>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>
        <!-- ORDER MANAGEMENT -->
        <section class="admin-order-management">
            <div class="title title-order-management">
                <img src="<c:url value="assets/images/icons/icons8-calendar-96.png"/>" alt="">
                <h1>ORDER MANAGEMENT</h1>
            </div>
            <div class="title title-add-new importantNone">
                <img src="<c:url value="assets/images/icons/icons8-add-64-title.png"/>" alt="">
                <h1>ADD NEW</h1>
            </div>
            <div class="title title-edit-new importantNone">
                <img src="<c:url value="assets/images/icons/icons8-edit-100-title.png"/>" alt="">
                <h1>EDIT ORDER</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="<c:url value="assets/images/icons/icons8-home-page-64.png"/>" alt="">
                    <a href="">Home</a>
                </div>
                <div>
                    <p>/</p>
                    <img src="<c:url value="assets/images/icons/icons8-purchase-order-100-nav.png"/>" alt="">
                    <a href="">Order</a>
                </div>

                <div>
                    <p>/</p>
                    <img src="<c:url value="assets/images/icons/icons8-calendar-96.png"/>" alt="">
                    <a href="">Management</a>
                </div>

                <div class="addneworder-nav importantNone">
                    <p>/</p>
                    <img src="<c:url value="assets/images/icons/icons8-add-64-title.png"/>" alt="">
                    <a href="">Add new</a>
                </div>
                <div class="editneworder-nav importantNone">
                    <p>/</p>
                    <img src="<c:url value="assets/images/icons/icons8-edit-100-title.png"/>" alt="">
                    <a href="">Edit order</a>
                </div>
            </div>
            <div class="table-order table-order-add">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addneworder">
                                <button class="addneworder" id="addneworder" name=""> <img
                                        src="<c:url value="assets/images/icons/icons8-add-64.png"/>" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Phone number</th>
                            <th>Address</th>
                            <th>Order date</th>
                            <th>Note</th>
                            <th>Status</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Do Van Trung</td>
                            <td>dovantrung47201@gmail.com</td>
                            <td>0346 643 755</td>
                            <td>Cong Hoa - Kim Thanh - Hai Duong</td>
                            <td>15-02-2023</td>
                            <td></td>
                            <td>Cho xac nhan</td>
                            <td class="td-action">
                                <button class="btn-confirm-order" id="1"><img src="<c:url value="assets/images/icons/icons8-done-64.png"/>"
                                        alt=""></button>
                                <button class="btn-edit-product" id="editneworder"><img
                                        src="<c:url value="assets/images/icons/icons8-edit-100.png"/>" alt=""></button>
                                <button class="btn-details-order"><img src="<c:url value="assets/images/icons/icons8-eye-64.png"/>"
                                        alt=""></button>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Do Van Trung</td>
                            <td>dovantrung47201@gmail.com</td>
                            <td>0346 643 755</td>
                            <td>Cong Hoa - Kim Thanh - Hai Duong</td>
                            <td>15-02-2023</td>
                            <td></td>
                            <td>Cho xac nhan</td>
                            <td class="td-action">
                                <button class="btn-confirm-order" id="2"><img src="<c:url value="assets/images/icons/icons8-done-64.png"/>"
                                        alt=""></button>
                                <button class="btn-edit-product" id="editneworder"><img
                                        src="<c:url value="assets/images/icons/icons8-edit-100.png"/>" alt=""></button>
                                <button class="btn-details-order"><img src="<c:url value="assets/images/icons/icons8-eye-64.png"/>"
                                        alt=""></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="add-new-order-form importantNone">
                <div class="customer-infor">
                    <h2>Customer information</h2>
                    <div class="customer-infor-form">
                        <div class="fullname">
                            <label> Full name: </label>
                            <input type="text">
                        </div>
                        <div class="email">
                            <label> Email: </label>
                            <input type="text">
                        </div>
                        <div class="phone-number">
                            <label> Phone number: </label>
                            <input type="text">
                        </div>
                        <div class="address">
                            <label> Address: </label>
                            <input type="text">
                        </div>
                    </div>
                </div>
            </div>
            <div class="edit-new-order-form importantNone">
                <div class="customer-infor">
                    <h2>Order information</h2>
                    <div class="customer-infor-form">
                        <div class="id">
                            <p> ID </p>
                            <input type="text">
                        </div>
                        <div class="fullname">
                            <p> Order date </p>
                            <input type="date">
                        </div>
                        <div class="email">
                            <p> Status </p>
                            <select class="selected-order status">
                                <option value="">Choose status</option>
                                <option value="1">Awaiting confirmation</option>
                                <option value="2">Packing</option>
                                <option value="3">Delivery</option>
                            </select>
                        </div>
                        <div class="phone-number">
                            <p> Method </p>
                            <select class="selected-order status">
                                <option value="">Choose method</option>
                                <option value="1">COD</option>
                            </select>
                        </div>
                        <div class="address">
                            <p> Voucher </p>
                            <select class="selected-order status">
                                <option value="">Choose voucher</option>
                                <option value="1">1-TET2023 </option>
                                <option value="2">2-TISHOESTET2023 </option>
                                <option value="3">3-TSTET2023 </option>
                            </select>
                        </div>
                    </div>
                    <h2>Customer information</h2>
                    <div class="customer-infor-form">

                        <div class="fullname">
                            <p> Full name </p>
                            <input type="text">
                        </div>
                        <div class="email">
                            <p> Email </p>
                            <input type="text">
                        </div>
                        <div class="phone-number">
                            <p> Phone number </p>
                            <input type="text">
                        </div>
                        <div class="address">
                            <p> Address </p>
                            <input type="text">
                        </div>
                        <div class="id">
                            <p> Note </p>
                            <input type="text">
                        </div>
                    </div>
                    <h2>Products</h2>
                    <div class="customer-infor-form table-product-order-edit">
                        <table class="order product-order">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Name</th>
                                    <th>Price</th>

                                    <th class="td-display-center">Color</th>
                                    <th class="td-display-center">Size</th>
                                    <th class="td-display-center">Quantity</th>
                                    <th class="td-action">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>

                                    <td>Nike Air Max 90 LTR</td>
                                    <td>$175.55</td>

                                    <td class="td-display-center">
                                        <select class="order-edit-select">
                                            <option value="1" style="background: aqua;" selected>Aqua</option>
                                            <option value="1" style="background: black;">Black</option>
                                        </select>
                                    </td>
                                    <td class="td-display-center"><select class="order-edit-select">
                                            <option value="1" selected>36</option>
                                            <option value="1">37</option>
                                        </select></td>
                                    <td class="td-display-center quantity-order">
                                        <input type="text" value="1">
                                    <td class="td-action">
                                        <button class="btn-del-order btn-del-order-edit" id="1" onclick="delProdInOrder(this)"><img
                                                src="<c:url value="assets/images/icons/icons8-remove-60.png"/>" alt=""></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>

                                    <td>Nike Air Max 90 LTR</td>
                                    <td>$175.55</td>

                                    <td class="td-display-center"><span class="td-color-product"
                                            style="background: aqua;"></span></td>
                                    <td class="td-display-center">36</td>
                                    <td class="td-display-center">1</td>
                                    <td class="td-action">
                                        <button class="btn-del-order btn-del-order-edit" id="2" onclick="delProdInOrder(this)"><img
                                                src="<c:url value="assets/images/icons/icons8-remove-60.png"/>" alt=""></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>

                                    <td>Nike Air Max 90 LTR</td>
                                    <td>$175.55</td>

                                    <td><span class="td-color-product" style="background: aqua;"></span></td>
                                    <td>36</td>
                                    <td>1</td>
                                    <td class="td-action">
                                        <button class="btn-del-order btn-del-order-edit" id="3" onclick="delProdInOrder(this)"><img
                                                src="<c:url value="assets/images/icons/icons8-remove-60.png"/>" alt=""></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-img-product"><img src="assets/images/emiuuu.jpg" alt=""></td>

                                    <td>Nike Air Max 90 LTR</td>
                                    <td>$175.55</td>

                                    <td><span class="td-color-product" style="background: aqua;"></span></td>
                                    <td>36</td>
                                    <td>1</td>
                                    <td class="td-action">
                                        <button class="btn-del-order btn-del-order-edit" id="4" onclick="delProdInOrder(this)"><img
                                                src="<c:url value="assets/images/icons/icons8-remove-60.png"/>" alt=""></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <!-- ORDER SEARCH -->
        <section class="admin-order-search none">
            <div class="title">
                <img src="<c:url value="assets/images/icons/icons8-search-client-60.png"/>" alt="">
                <h1>SEARCH ORDER</h1>
            </div>
            <div class="nav-history">
                <div class="origin">
                    <img src="<c:url value="assets/images/icons/icons8-home-page-64.png"/>" alt="">
                    <a href="">Home</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-purchase-order-100-nav.png"/>" alt="">
                    <a href="">Order</a>
                </div>
                <p>/</p>
                <div>
                    <img src="<c:url value="assets/images/icons/icons8-search-client-60.png"/>" alt="">
                    <a href="">Search order</a>
                </div>
            </div>
            <div class="table-order">
                <table class="order">
                    <thead>
                        <tr>
                            <th colspan="1000" class="td-addneworder">
                                <button class="addneworder"> <img src="<c:url value="assets/images/icons/icons8-add-64.png"/>" alt="icon-plus">
                                    Add New</button>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Phone number</th>
                            <th>Address</th>
                            <th>Order date</th>
                            <th>Note</th>
                            <th>Status</th>
                            <th class="td-action">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Maria Anders</td>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
                            <td>Maria Anders</td>
                            <td>Germany</td>
                            <td>Alfreds Futterkiste</td>
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