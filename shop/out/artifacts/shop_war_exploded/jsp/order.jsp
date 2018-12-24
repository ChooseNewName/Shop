<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>确认订单</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/ext.css" />
</head>

<body>
<div class="container">
    <div class="row box" style="margin-bottom: 2rem; margin-top: 2rem;">
        <div class="col-md-10 column">
            <h1 style="color: red; margin: auto;">确认订单</h1>
        </div>
        <div class="col-md-2 column" align="right">
            <a href="index.html">返回首页</a>
        </div>
    </div>
    <!-- 地址信息-->
    <div class="row" style="margin-bottom: 2rem;">
        <div class="col-md-12 column">
            <ul class="nav navcolor nav-pills nav-stacked">
                <li class="active" style="font-size: large;">
                    <a href="#">配送地址</a>
                </li>
                <li>
                    <input type="radio" name="address"/>&nbsp; 江西省赣州市什么路153号(张三 收) 15818876898
                </li>
                <li>
                    <input type="radio" name="address"/>&nbsp; 广东省广州市天河区什么路121号(李四 收) 18777890986
                </li>
                <li>
                    <input type="radio" name="address"/>&nbsp; 广东省珠海市香洲区什么路101号(王五 收) 13043709878
                </li>
                <li>
                    <input type="button" id="newaddr" class="btn btn-info btn-sm" value="使用新地址"/>
                </li>
            </ul>
        </div>
    </div>
    <!-- 订单信息 -->
    <div class="row" style="margin-bottom: 2rem;">
        <div class="col-md-12 column">
            <ul class="nav navcolor nav-pills nav-stacked">
                <li class="active" style="font-size: large;">
                    <a href="#">订单信息</a>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-1 column" align="left"></div>
                        <div class="col-md-3 column" align="left">商品信息</div>
                        <div class="col-md-3 column" align="left">单价</div>
                        <div class="col-md-2 column" align="left">数量</div>
                        <div class="col-md-3 column" align="left">金额</div>
                    </div>
                    <div class="row box">
                        <div class="col-md-1 column" align="left">
                            <img alt="60x60" style="margin: 1rem;" width="60rem" height="60rem" src="https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/263726286/TB2qqpCu2iSBuNkSnhJXXbDcpXa_!!263726286-0-item_pic.jpg_460x460Q90.jpg_.webp" />
                        </div>
                        <div class="col-md-3 column" align="left">
                            <p>
                                3期免息【当天发/保修2年】Apple/苹果 iPhone 8 全网通4G手机 官方旗舰店
                            </p>
                        </div>
                        <div class="col-md-3 column" align="left">
                            <p style="font-size: large;">¥ 4458.00</p>
                        </div>
                        <div class="col-md-2 column" align="left">
                            <p style="font-size: large;">1</p>
                        </div>
                        <div class="col-md-3 column" align="left">
                            <p style="color: red; font-size: large;">¥ 4458.00</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row box">
                        <div class="col-md-1 column" align="left">
                            <img alt="60x60" style="margin: 1rem;" width="60rem" height="60rem" src="https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/112417306/TB2A6YsjhGYBuNjy0FnXXX5lpXa_!!112417306.jpg_460x460Q90.jpg_.webp" />
                        </div>
                        <div class="col-md-3 column" align="left">
                            <p>
                                2017新款27寸5K苹果/Apple iMac Pro一体机台式电脑MQ2Y2CH/A定制
                            </p>
                        </div>
                        <div class="col-md-3 column" align="left">
                            <p style="font-size: large;">¥ 33580.00</p>
                        </div>
                        <div class="col-md-2 column" align="left">
                            <p style="font-size: large;">1</p>
                        </div>
                        <div class="col-md-3 column" align="left">
                            <p style="color: red; font-size: large;">¥ 33580.00</p>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 结算 -->
    <div class="row">
        <div class="col-md-12 column" align="right" style="margin-top: 1rem;">
            <p style="color: red; font-size: large; font-weight: bold;">实付款：¥ 38038.00</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 column" align="right">
            <input type="button" id="suborder" class="btn btn-primary btn-lg" value="提交订单" />
        </div>
    </div>
</div>
<!-- 模式对话框 -->
<div id="addrModal"></div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $(function(){
        $("#newaddr").on("click",function(){
            $("#addrModal").load("newaddr.html",function(){
                $("#newAddrModal").modal('show');
            });
        });
        $("#suborder").on("click",function(){
            alert("在数据生成订单记录，并更新相应的购物项关联此订单\n，并修改购物项记录的状态为已下单");
        });
    });
</script>
</html>