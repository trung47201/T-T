<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
        <div class="admin-header">
            <div class="admin-menu-icon">
                <img src="<c:url value="/assets/images/icons/icons8-menu-rounded-100.png"/>" alt="icon-menu">
            </div>
            <div class="admin-logo">
                <a href="/SpringMVC/admin"><h2>ADMIN</h2></a>
            </div>
            <div class="admin-search-form">
                <div class="admin-search-input">
                    <input type="text" name="" id="" placeholder="Search...">
                </div>
                <div class="admin-search-icon">
                    <img src="<c:url value="/assets/images/icons/icons8-search-50-blue.png"/>" alt="icon-search">
                </div>
            </div>
            <div class="admin-notify-icon">
                <img src="<c:url value="/assets/images/icons/icons8-notification-100.png"/>" alt="icon-notify">
            </div>
            <div class="admin-avatar">
                <img src="<c:url value="/assets/images/users/emiuuu.jpg"/>" alt="img-avt">
            </div>
            <div class="admin-infor">
                <div class="admin-infor-name">
                    <p>Dao Thu Trang</p>
                </div>
                <div class="admin-infor-icon">
                    <img src="<c:url value="/assets/images/icons/triangle32.png"/>" alt="icon-triangle">
                </div>
            </div>
        </div>
    </header>