<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Admin :) ?</title>
<link rel="stylesheet" href="<c:url value='/assets/css/admin.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/admin-login.css'/>">

<body>
    <jsp:include page="../layouts/admin/login.jsp"></jsp:include>
    
   	<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
    <div class="admin-body">
        <jsp:include page="../layouts/admin/nav.jsp"></jsp:include>
        <section>
            <div class="section-dashboard">

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
        $('.other').click(function () {
            $(".other-menu").removeClass("none", 10000, "easeInBack");
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