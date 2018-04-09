layui.use(['element','layer'], function(){
    var $ = layui.jquery,element = layui.element,layer = layui.layer; //Tab的切换功能，切换事件监听等，需要依赖element模块

    //触发事件
    var active = {
        tabAdd: function(name,id,url){
            //新增一个Tab项
            element.tabAdd('tab', {
                title: name
                ,content:'<iframe frameborder="0" src="' + url + '"></iframe>' //'内容'+ (Math.random()*1000|0)//,<iframe tab-id="' + id + '" frameborder="0" src="' + url + '" scrolling="yes" class="x-iframe"></iframe>
                ,id: id //实际使用一般是规定好的id，这里以时间戳模拟下
            })
        }//<div class="layui-tab-item">2</div>
        ,tabDelete: function(id){
            //删除指定Tab
            element.tabDelete('tab', id); //删除
        }
        ,tabChange: function(id){
            //切换到指定Tab项
            element.tabChange('tab', id); //切换到
        }
    };
    //绑定触发事件
    $("[data-url]").on('click', function(){
        var name = this.text;
        var url = $(this).attr('data-url') ;
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