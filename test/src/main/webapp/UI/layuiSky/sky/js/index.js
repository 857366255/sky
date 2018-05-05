layui.use(['element','layer'], function(){
    var $ = layui.jquery,element = layui.element,layer = layui.layer;
    //获取后台菜单栏数据
    $.ajax({
        url: "/menu",
        type: 'GET',
        success: function(data) {
            forMenu(data);
            element.init();
        },error : function(data) {
            alert("菜单栏加载失败!");
        }
    });
    //循环输出动态菜单栏(目前只写了2级)
    function forMenu(menus) {
        var $menu_ul=  $("#menu-ul");
        for(var i=0;i<menus.length;i++){
            var s = "<li class='layui-nav-item' style=''>";
            var temp = menus[i];
            var tempMenus = temp.menus;
            if(tempMenus.length==0){
                s += "<a data-url='" + temp.url + "'>" + temp.name + "</a></li>";
            }else{
                s +=  "<a class='' href='javascript:;'>" + temp.name + "</a><dl class='layui-nav-child'>";
                for(var j=0;j<tempMenus.length;j++){
                    var t = tempMenus[j];
                    s += "<dd><a data-url='" + t.url + "'>" + t.name + "</a></dd>";
                }
                s += "</dl></li>";
            }
            $menu_ul.append(s);
        }
        $menu_ul.find(".layui-nav-bar").remove();//删除鼠标悬停导航栏定位图标 使得可以重新渲染效果
    }
    var active = {
        tabAdd: function(name,id,url){
            element.tabAdd('tab', {
                title: name
                ,content:'<iframe frameborder="0" src="' + url + '"></iframe>' //'内容'+ (Math.random()*1000|0)//,<iframe tab-id="' + id + '" frameborder="0" src="' + url + '" scrolling="yes" class="x-iframe"></iframe>
                ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
            });//新增一个Tab项
        }
        ,tabDelete: function(id){
            element.tabDelete('tab', id);//删除指定Tab
        }
        ,tabChange: function(id){
            element.tabChange('tab', id);  //切换到指定Tab项
        }
    };
    element.on('nav(menu)', function(elem){
        var name = elem.text();
        var url = elem.find('[data-url]') .attr('data-url');
        var id = url;
        var lis = $('.layui-tab-title li');
        for(var i=0;i<lis.length;i++){
            var temp = lis.eq(i).attr("lay-id");
            if(id===temp){
                active.tabChange(id);
                return;
            }
        }
        active.tabAdd(name,id,url);
        active.tabChange(id);
    });
});