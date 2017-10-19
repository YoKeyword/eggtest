<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
</head>
<body>
<form method="POST" action="/upload?_csrf={{ ctx.csrf | safe }}" enctype="multipart/form-data">
    title: <input name="title"/>
    file: <input name="file" type="file"/>
    <p id="myDiv"></p>
    <input type="text" name="_csrf" value="{{ ctx.csrf }}">
    <button type="submit">upload</button>
    <button type="button" id="b01">POST1 -->JSON</button>
    <button type="button" id="b02">POST2 ajax 通过cookie获取csrf</button>

</form>
</body>
<script>
    function csrfSafeMethod(method) {
        // these HTTP methods do not require CSRF protection
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }
    $(document).ready(function () {
        $("#b01").click(function () {
            /*var csrftoken = Cookies.get('csrfToken');
             $.ajaxSetup({
             beforeSend: function(xhr, settings) {
             if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
             xhr.setRequestHeader('x-csrf-token', csrftoken);
             }
             },
             });*/
            $.ajax({
                type: "POST",
                url: "/upload",
                data: JSON.stringify({Skip: '123', Take: '345'}),
                contentType: "application/json; charset=utf-8",//(可以)
                //contentType: "text/xml",//(可以)
                //contentType:"application/x-www-form-urlencoded",//(可以)
                dataType: "json",
                success: function (data) {
                    console.log(data);
                }
            });

        });
        $("#b02").click(function () {
            console.log($);
            var csrftoken = $.cookie('csrfToken');

            $.ajaxSetup({
                beforeSend: function (xhr, settings) {
                    if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
                        xhr.setRequestHeader('x-csrf-token', csrftoken);
                    }
                },
            });
            $.ajax({
                type: "POST",
                url: "/upload",
                data: {Skip: '123', Take: '345'},
                //contentType: "application/json; charset=utf-8",//(可以)
                //contentType: "text/xml",//(可以)
                //contentType:"application/x-www-form-urlencoded",//(可以)
                dataType: "json",
                success: function (data) {
                    console.log(data);
                }
            });

        });

    });
</script>
</html>