<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/ext.css"/>
</head>
<body>
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title">用户登陆</h3>
            </div>
            <div class="modal-body">
                <div class="row" style="margin: 1rem;">
                    <div class="col-md-12">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <!--<label for="account" style="font-size: large;">账 号</label>-->
                                <input type="text" class="form-control" id="account" name="account"
                                       placeholder="账号/手机/邮箱"/>
                            </div>
                            <div class="form-group">
                                <!--<label for="password" style="font-size: large;">密 码</label>-->
                                <input type="password" class="form-control" id="password" placeholder="密 码"/>
                                <div>
                                    <p id="msg" style="color: red"></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="checkLogin()">登陆</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/operation.js"></script>
<script type="text/javascript">

    //点击登陆发送请求到服务器
    function checkLogin() {
        console.log($("#account").val()+"---"+$("#password").val());
        $.ajax({
            type: "POST",
            url: "/LoginServlet",
            data: {
                account: $("#account").val(),
                password: $("#password").val()
            }
        }).done(function (data) {
            if (data =="1") {
                $("#loginModal").modal('hide');
                window.location.reload();
            } else if (data =="0") {
                $("#password").val('');
                $("#msg").text("账号或密码错误，请重新输入");
            } else {
                alert(data);
            }
        });
    }

    //单击关闭按钮登录窗口
    function hideDiv() {
        $("modal"), hide();
    }
</script>
>


</body>
</html>
