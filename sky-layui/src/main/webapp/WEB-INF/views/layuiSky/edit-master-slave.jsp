<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/16
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>编辑主从</title>
    <link rel="stylesheet" href="${basePath}/UI/test/layuiSky/layui2.2.5/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath}/UI/test/layuiSky/sky/css/edit-list.css"  media="all">
</head>
<body style="padding: 5px;">
<div class="layui-row">
    <div class="layui-col-xs5">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">单行输入框</label>
                    <div class="layui-input-block">
                        <input name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" type="text">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">验证必填项</label>
                    <div class="layui-input-block">
                        <input name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">验证手机</label>
                    <div class="layui-input-inline">
                        <input name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input" type="tel">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">验证邮箱</label>
                    <div class="layui-input-inline">
                        <input name="email" lay-verify="email" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">多规则验证</label>
                    <div class="layui-input-inline">
                        <input name="number" lay-verify="required|number" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">验证日期</label>
                    <div class="layui-input-inline">
                        <input name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">验证链接</label>
                    <div class="layui-input-inline">
                        <input name="url" lay-verify="url" autocomplete="off" class="layui-input" type="tel">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">验证身份证</label>
                    <div class="layui-input-block">
                        <input name="identity" lay-verify="identity" placeholder="" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">自定义验证</label>
                    <div class="layui-input-inline">
                        <input name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input" type="password">
                    </div>
                    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">范围</label>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input name="price_min" placeholder="￥" autocomplete="off" class="layui-input" type="text">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input name="price_max" placeholder="￥" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">单行选择框</label>
                    <div class="layui-input-block">
                        <select name="interest" lay-filter="aihao">
                            <option value=""></option>
                            <option value="0">写作</option>
                            <option value="1" selected="">阅读</option>
                            <option value="2">游戏</option>
                            <option value="3">音乐</option>
                            <option value="4">旅行</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">分组选择框</label>
                    <div class="layui-input-inline">
                        <select name="quiz">
                            <option value="">请选择问题</option>
                            <optgroup label="城市记忆">
                                <option value="你工作的第一个城市">你工作的第一个城市</option>
                            </optgroup>
                            <optgroup label="学生时代">
                                <option value="你的工号">你的工号</option>
                                <option value="你最喜欢的老师">你最喜欢的老师</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">搜索选择框</label>
                    <div class="layui-input-inline">
                        <select name="modules" lay-verify="required" lay-search="">
                            <option value="">直接选择或搜索选择</option>
                            <option value="1">layer</option><option value="2">form</option><option value="3">layim</option><option value="4">element</option><option value="5">laytpl</option><option value="6">upload</option><option value="7">laydate</option><option value="8">laypage</option><option value="9">flow</option><option value="10">util</option><option value="11">code</option><option value="12">tree</option><option value="13">layedit</option><option value="14">nav</option><option value="15">tab</option><option value="16">table</option><option value="17">select</option><option value="18">checkbox</option><option value="19">switch</option><option value="20">radio</option>
                        </select>
                    </div>
                </div>
                <label class="layui-form-label">联动选择框</label>
                <div class="layui-input-inline">
                    <select name="quiz1">
                        <option value="">请选择省</option>
                        <option value="浙江" selected="">浙江省</option>
                        <option value="你的工号">江西省</option>
                        <option value="你最喜欢的老师">福建省</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="quiz2">
                        <option value="">请选择市</option>
                        <option value="杭州">杭州</option>
                        <option value="宁波" disabled="">宁波</option>
                        <option value="温州">温州</option>
                        <option value="温州">台州</option>
                        <option value="温州">绍兴</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="quiz3">
                        <option value="">请选择县/区</option>
                        <option value="西湖区">西湖区</option>
                        <option value="余杭区">余杭区</option>
                        <option value="拱墅区">临安市</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">此处只是演示联动排版，并未做联动交互</div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">复选框</label>
                    <div class="layui-input-block">
                        <input name="like[write]" title="写作" type="checkbox">
                        <input name="like[read]" title="阅读" checked="" type="checkbox">
                        <input name="like[game]" title="游戏" type="checkbox">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">开关-默认关</label>
                    <div class="layui-input-block">
                        <input name="close" lay-skin="switch" lay-text="ON|OFF" type="checkbox">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">开关-默认开</label>
                    <div class="layui-input-block">
                        <input checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF" type="checkbox">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">单选框</label>
                    <div class="layui-input-block">
                        <input name="sex" value="男" title="男" checked="" type="radio">
                        <input name="sex" value="女" title="女" type="radio">
                        <input name="sex" value="禁" title="禁用" disabled="" type="radio">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">普通文本域</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    <div class="layui-col-xs*">
        <div class="layui-btn-group demoTable">
            <button class="layui-btn" data-type="isAll" id="addTable">添加</button>
        </div>
        <table id="test2" lay-filter="test2"></table>
    </div>
</div>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="checkboxTpl">
    <input type="checkbox" name="" title="锁定" checked>
</script>
<script type="text/html" id="switchTpl">
    <input type="checkbox" name="yyy" lay-skin="switch" lay-text="女|男">
</script>


<script src="${basePath}/UI/test/layuiSky/layui2.2.5/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate','table'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,table = layui.table
            ,$ = layui.jquery;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        table.render({
            elem: '#test2'
            ,url: '${basePath}/UI/test/json/demo1.json'
            //,page: false
            ,height: 'full-20'//最大高度-20  full-20
            , limit:1000
            //,width: 500
            ,cellMinWidth: 80
            ,cols: [[
                {type:'numbers', fixed: 'left',width:30}
                ,{type: 'checkbox', fixed: 'left',width:30}
                ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none'}
                ,{field:'username', title:'用户名',edit: 'text', templet: '#usernameTpl'}
                ,{field:'email', title:'邮箱'}
                ,{field:'sex', title:'性别', templet: '#switchTpl', minWidth: 85, align:'center'}
                ,{field:'lock', title:'是否锁定', templet: '#checkboxTpl', minWidth: 110, align:'center'}
                ,{field:'city', title:'城市'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
        });

        //点击加号按钮时，新添一行
        $("#addTable").click(function(){
            var oldData =  table.cache["test2"];
            var data1={
                "id": null
                ,"username": null
                ,"email": null
                ,"sex": null
                ,"city": null
                ,"sign": "君不见，黄河之水天上来，奔流到海不复回。 君不见，高堂明镜悲白发，朝如青丝暮成雪。 人生得意须尽欢，莫使金樽空对月。 天生我材必有用，千金散尽还复来。 烹羊宰牛且为乐，会须一饮三百杯。 岑夫子，丹丘生，将进酒，杯莫停。 与君歌一曲，请君为我倾耳听。(倾耳听 一作：侧耳听) 钟鼓馔玉不足贵，但愿长醉不复醒。(不足贵 一作：何足贵；不复醒 一作：不愿醒/不用醒) 古来圣贤皆寂寞，惟有饮者留其名。(古来 一作：自古；惟 通：唯) 陈王昔时宴平乐，斗酒十千恣欢谑。 主人何为言少钱，径须沽取对君酌。 五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。"
                ,"experience": null
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
                ,"LAY_CHECKED": true
            };
            oldData.push(data1);
            table.reload('test2',{
                data : oldData
                ,url:false
            });
        });


    });
</script>

</body>
</html>