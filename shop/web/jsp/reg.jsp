<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/ext.css"/>
</head>
<body>
<div id="regModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title">用户注册</h3>
            </div>
            <div class="modal-body">
                <div class="row" style="margin: 1rem;">
                    <div class="col-md-12">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <input type="text" class="form-control" id="account" name="account" placeholder="账号"/>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password" placeholder="密码"/>
                            </div>
                            <div class="form-group">
                                <input type="tel" class="form-control" id="tel" placeholder="手机"/>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" id="email" placeholder="邮箱"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="hideDiv1()">关闭</button>
                <button type="button" class="btn btn-primary" onclick="regSend()">注册</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/operation.js"></script>

<script type="text/javascript">

    //点击注册发送请求
    function regSend() {
        /*alert($("#account").val());
        alert($("#password").val());
        alert($("#tel").val());
        alert($("#email").val());
        */
        $.ajax({
            type: "post",
            url: "/RegisterServlet",
            data: {
                userName: $("#account").val(),
                password: $("#password").val(),
                phoneNumber: $("#tel").val(),
                email: $("#email").val(),
            }
        }).done(function(data){
            alert(data);
            if (data==1){
                alert("注册成功");
                //$("#regModal").modal('hide');
               // login();

            } else{
                alert("注册失败")
            }

        })

    }

    //单击关闭按钮注册窗口
    function hideDiv1() {
        $("modal"), hide();
    }

</script>

</body>
</html>
