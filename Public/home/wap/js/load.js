$(function () {
    var page = 1;
    setTimeout(function () {
        mui.init({
            pullRefresh: {
                container: '#pullrefresh',
                up: {
                    contentrefresh: '正在加载...',
                    contentnomore:'没有更多数据了',
                    container: '#pullrefresh',
                    // var that = this;
                    callback: function() {
                        var that = this;
                        $.ajax({
                            url:url1,
                            type:'post',
                            data:{
                                page:page,
                            },
                            success:function (meg) {
                                loadData(that,meg)
                            }
                        })

                    }
                }
            }
        });
    },2000)
    function loadData(obj,meg){
        var str = '';
        page++;
        console.log(meg.message)
        if(meg.status==0){
            obj.endPullupToRefresh(true);
            return;
        }
        $.each(meg.message,function(key,value){
            str += '<li class="lis">'
            str += "<p>"+value.type_name+"</p>"
            if(value.get_nums>=0){
                str += '<p style="color:red;">'+value.get_nums+'</p>'
            }else{
                str += '<p style="color:green;">'+value.get_nums+'</p>'
            }
            str += "<p>"+value.now_nums+"</p>"
            str += "<p>"+value.get_time+"</p>"
            str += "</li>"
        });
        $('.mui-scroll ul').append(str);
        obj.endPullupToRefresh(false);
    }
})