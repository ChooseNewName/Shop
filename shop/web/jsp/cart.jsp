<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/ext.css"/>
</head>
<body>
<div class="container">
    <div class="row box" style="margin-bottom: 2rem; margin-top: 2rem;">
        <div class="col-md-10 column">
            <h1 style="color: red; margin: auto;">我的购物车</h1>
        </div>
        <div class="col-md-2 column" align="right">
            <a href="index.html">返回首页</a>
        </div>
    </div>
    <div class="row well well-sm">
        <div class="col-md-2 column" align="left">
            <input type="checkbox"/>&nbsp;全选
        </div>
        <div class="col-md-3 column" align="left">商品信息</div>
        <div class="col-md-2 column" align="left">单价</div>
        <div class="col-md-2 column" align="left">数量</div>
        <div class="col-md-2 column" align="left">金额</div>
        <div class="col-md-1 column" align="left">操作</div>
    </div>
    <!-- 购物车列表 -->
    <div class="row well well-sm box">
        <div class="col-md-2 column" align="left">
            <input type="checkbox"/>
            <img alt="120x120" width="120rem" height="120rem" src="https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/263726286/TB2qqpCu2iSBuNkSnhJXXbDcpXa_!!263726286-0-item_pic.jpg_460x460Q90.jpg_.webp" />
        </div>
        <div class="col-md-3 column" align="left">
            <p>
                3期免息【当天发/保修2年】Apple/苹果 iPhone 8 全网通4G手机 官方旗舰店
            </p>
        </div>
        <div class="col-md-2 column" align="left">
            <p style="font-size: large;">¥ 4458.00</p>
        </div>
        <div class="col-md-2 column" align="left">
            <input type="number" name="buyNum" value="1"/>
        </div>
        <div class="col-md-2 column" align="left">
            <p style="color: red; font-size: large;">¥ 4458.00</p>
        </div>
        <div class="col-md-1 column" align="left">
            <input type="button" class="btn btn-danger" name="del" value="删除"/>
        </div>
    </div>
    <div class="row well well-sm box">
        <div class="col-md-2 column" align="left">
            <input type="checkbox"/>
            <img alt="120x120" width="120rem" height="120rem" src="https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/112417306/TB2A6YsjhGYBuNjy0FnXXX5lpXa_!!112417306.jpg_460x460Q90.jpg_.webp" />
        </div>
        <div class="col-md-3 column" align="left">
            <p>
                2017新款27寸5K苹果/Apple iMac Pro一体机台式电脑MQ2Y2CH/A定制
            </p>
        </div>
        <div class="col-md-2 column" align="left">
            <p style="font-size: large;">¥ 33580.00</p>
        </div>
        <div class="col-md-2 column" align="left">
            <input type="number" name="buyNum" value="1" />
        </div>
        <div class="col-md-2 column" align="left">
            <p style="color: red; font-size: large;">¥ 33580.00</p>
        </div>
        <div class="col-md-1 column" align="left">
            <input type="button" class="btn btn-danger" name="del" value="删除"/>
        </div>
    </div>
    <!-- 结算 -->
    <div class="row well well-sm">
        <div class="col-md-12 column" align="right" style="margin-top: 1rem;">
            <p style="color: red; font-size: large; font-weight: bold;">合计：¥ 38038.00</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 column" align="right">
            <input type="button" class="btn btn-primary btn-lg" value="结算" onclick="location.href='order.html'"/>
        </div>
    </div>
</div>
</body>
<script src="js/operation.js"></script>
</html>


