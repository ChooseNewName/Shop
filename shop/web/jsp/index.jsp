<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>天喵--理想生活上天喵</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/ext.css"/>
</head>
<body>
<div class="container">
    <div class="row box" style="margin-top: 2rem; margin-bottom: 2rem;">
        <div class="col-md-3 column">
            <!-- 修改bootstrap中h1的margin-->
            <h1 style="color: red; margin: auto;">天喵网</h1>
        </div>
        <div class="col-md-6 column">
            <form role="form" class="form-inline">
                <div class="form-group">
                    <input type="text" size="60" class="form-control" id="search" placeholder="搜一下"/>
                    <input type="button" class="btn btn-primary" value="搜索" onclick="searchMi()">

                </div>
            </form>
        </div>
        <div class="col-md-2 column" align="right">
            <a id="carthref" href="cart.html"><span class="badge pull-right">2</span>我的购物车</a>
        </div>

        <c:choose>
            <c:when test="${User==null}">
                <div class="col-md-1 column" align="right">
                    <a href="#" id="loginhref" onclick="login()">登陆</a>/<a href="#" id="reghref"
                                                                           onclick="register()">注册</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="col-md-1 column" align="right" style="color: darkorange">
                    <span>Hi，</span>${User.userName}
                    <span><a href="#" onclick="cancellation()">注销</a></span>
                </div>
            </c:otherwise>

        </c:choose>


    </div>
    <!-- 商品列表 -->
    <div class="row">
        <div class="col-md-2 column">
            <ul class="nav navcolor nav-pills nav-stacked" id="pTypeList">

            </ul>
        </div>
        <div class="col-md-10 column">
            <div class="row" id="productList">

            </div>
        </div>
    </div>
    <!-- 模态框 -->
    <div id="modal"></div>
</div>
</body>

<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/operation.js"></script>

<script type="text/javascript">

    //定义搜索框的查询方法
    function searchMi() {
        //清空div
        $("#productList").empty();
        $.ajax({
            type: "post",
            url: "/ShowProductServlet",
            data: {
                value: $("#search").val()
            }
        }).done(function (data) {
            var productList = $("#productList");
            $.each($.parseJSON(data), function (index, obj) {
                productList.append(
                    "<div class='col-md-4'>" +
                    "   <div class='thumbnail'>" +
                    "       <img alt='300*300' src='" + obj.pPicture + "'/>" +
                    "      <div class='caption'>" +
                    "           <h3 style='color: red; font-weight: bold;'>￥" + obj.price + "</h3>" +
                    "           <p>" + obj.pName + "/" + obj.pDetails + "</p>" +
                    "           <p><a class='btn btn-primary addcart' href='#'> 加入购物车</a></p>" +
                    "       </div>" +
                    "    </div>" +
                    "</div>"
                );
            });
        });
    }

    //加载列表的方法
    function loadTypeListData() {
        //循环前先清空列表
        $("#pTypeList").empty();
        $.ajax({
            //发送的方式
            type: "get",
            //发送到的地址
            url: "/ShowTypeListServlet"
            //要发送过去的参数
        }).done(function (data) {
            //获取ul列表
            var pTypeList = $("#pTypeList");

            pTypeList.append(
                "<li class='active' >" +
                "   <a href='#' onclick='loadData()' >分类</a>" +
                "</li>"
            );
            $.each($.parseJSON(data), function (index, obj) {
                pTypeList.append(
                    "<li class='nav' >" +
                    "   <a href='#' onclick='loadTypeData(" + obj.id + ")' >" + obj.type + "</a>" +
                    "</li>"
                );
            });
        });
    }

    //查询全部商品的方法
    function loadData() {
        //清空div
        $("#productList").empty();
        $.ajax({
            type: "get",
            url: "/ShowProductServlet",
            data: {
                type: 0
            }
        }).done(function (data) {
            var productList = $("#productList");

            $.each($.parseJSON(data), function (index, obj) {
                productList.append(
                    "<div class='col-md-4'>" +
                    "   <div class='thumbnail'>" +
                    "       <img alt='300*300' src='" + obj.pPicture + "'/>" +
                    "      <div class='caption'>" +
                    "           <h3 style='color: red; font-weight: bold;'>￥" + obj.price + "</h3>" +
                    "           <p>" + obj.pName + "/" + obj.pDetails + "</p>" +
                    "           <p><a class='btn btn-primary addcart' href='#'> 加入购物车</a></p>" +
                    "       </div>" +
                    "    </div>" +
                    "</div>"
                );
            });
        });
    }

    //查询各种类型的方法
    function loadTypeData(type) {
        //清空div
        $("#productList").empty();
        $.ajax({
            type: "get",
            url: "/ShowProductServlet",
            data: {
                type: type
            }
        }).done(function (data) {
            var productList = $("#productList");

            $.each($.parseJSON(data), function (index, obj) {
                productList.append(
                    "<div class='col-md-4'>" +
                    "   <div class='thumbnail'>" +
                    "       <img alt='300*300' src='" + obj.pPicture + "'/>" +
                    "       <div class='caption'>" +
                    "           <h3 style='color: red; font-weight: bold;'>￥" + obj.price + "</h3>" +
                    "           <p>" + obj.pName + "/" + obj.pDetails + "</p>" +
                    "           <p><a class='btn btn-primary addcart' href='#'> 加入购物车</a></p>" +
                    "       </div>" +
                    "    </div>" +
                    "</div>"
                );
            });
        });
    }

    //加入购物车的方法

    //登录的方法
    function login() {
        $("#modal").load("/jsp/login.jsp", function () {
            $('#loginModal').modal('show');
        });
    }

    //注册的方法
    function register() {
        $("#modal").load("/jsp/reg.jsp", function () {
            $('#regModal').modal('show');
        });
    }

    //注销的方法
    function cancellation() {
        $.ajax({
            type: "get",
            url: "/CancellationServlet"
        }).done(function (data) {
            window.location.reload();
        });
    }

    //窗体加载事件
    $(function () {
        //查询列表
        loadTypeListData();
        //查询全部商品
        loadData();


    });
</script>

</html>
