_box = function() {
	var loadmessage = '<div class="form-group pull-left"><label class="control-label" id="ajaxformtip"></label></div>';
    var _tplHtml = '<div class="modal fade" id="[Id]">';
	_tplHtml += '<div class="modal-dialog" id="modal-dialog"><div class="modal-content"><div class="modal-header">';
	_tplHtml += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
	_tplHtml += '<h4 class="modal-title">[Title]</h4></div>';
	_tplHtml += '<div class="modal-body">[Message]</div><div class="modal-footer">'+loadmessage;
	_tplHtml += '<button type="button" class="btn btn-default cancel" data-dismiss="modal">[BtnCancel]</button>';
	_tplHtml += '<button type="button" class="btn btn-primary ok" data-dismiss="modal">[BtnOk]</button></div></div></div></div>';

    var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
	
	var modalId='';
		
       var _alert = function (options) {
            var id = _dialog(options);
            var modal = $('#' + id);
            modal.find('.ok').removeClass('btn-success').addClass('btn-primary').attr("data-dismiss","modal");
            modal.find('.cancel').hide();

            return {
                id: id,
                on: function (callback) {
                    if (callback && callback instanceof Function) {
                        modal.find('.ok').click(function () { callback(true); });
                    }
                },
                hide: function (callback) {
                    if (callback && callback instanceof Function) {
                        modal.on('hide.bs.modal', function (e) {
                            callback(e);
                        });
                    }
                }
            };
        };

        var _confirm = function (options) {
            var id = _dialog(options);
            var modal = $('#' + id);
            modal.find('.ok').removeClass('btn-primary').addClass('btn-success');
            modal.find('.cancel').show();

            return {
                id: id,
                on: function (callback) {
                    if (callback && callback instanceof Function) {
                        modal.find('.ok').click(function () { callback(true); });
                        modal.find('.cancel').click(function () { callback(false); });
                    }
                },
                hide: function (callback) {
                    if (callback && callback instanceof Function) {
                        modal.on('hide.bs.modal', function (e) {
                            callback(e);
                        });
                    }
                }
            };
        };
		
       var _dialog = function (options) {
            var ops = {
                msg: "提示内容",
                title: "操作提示",
                btnok: "确定",
                btncl: "取消"
			};

            $.extend(ops, options);

            modalId = _getId();

            var html = _tplHtml.replace(reg, function (node, key) {
                return {
                    Id: modalId,
                    Title: ops.title,
                    Message: ops.msg,
                    BtnOk: ops.btnok,
                    BtnCancel: ops.btncl
                }[key];
            });

            $('body').append(html);
            $('#' + modalId).modal();
			
            $('#' + modalId).on('hide.bs.modal', function (e) {
                $('#' + modalId).remove();
            });
			
            return modalId;
        }

        var _getId = function () {
            var date = new Date();
            return 'mdl' + date.valueOf();
        }
        var _cancelCheckbox = function () {
            //设置取消样式
            $(".datagrid-header-check .checker").find("span").attr("class", "");//取消头部第一个checkbox的样式
            $(".datagrid-cell-check .checker").find("span").attr("class", "");//取消列表选中checkbox的样式
            $(".datagrid-btable").find("tr").attr("class", "datagrid-row");//取消选中行的样式
            $(":checkbox:checked").attr("checked", false); //取消所有选中状态
        };
		
        var _hide = function () {
          $('#' + modalId).modal('hide');
        };
		
        return {
            alert: _alert,
            confirm: _confirm,
			hide:_hide,
            cancelcheck: _cancelCheckbox,
            loading: function () {
                $('body').modalmanager('loading');
            },
            removeLoading: function () {
                $('body').modalmanager('removeLoading');
            }
        }
		

}();

String.prototype.replaceAll = function(s1, s2) {
    var r = new RegExp(s1.replace(/([\(\)\[\]\{\}\^\$\+\-\*\?\.\"\'\|\/\\])/g, "\\$1"), "ig");
    return this.replace(r, s2);
};
Object.extend = function(destination, source) {
    for (var property in source) {
        destination[property] = source[property];
    }
    return destination;
    // 返回扩展后的对象
};
Object.extend(Object, {
    inspect: function(object) {
        try {
            if (object == undefined) return 'undefined';
            // 处理undefined情况
            if (object == null) return 'null';
            // 处理null情况
            // 如果对象定义了inspect方法, 则调用该方法返回, 否则返回对象的toString()值
            return object.inspect ? object.inspect() : object.toString();
        } catch(e) {
            if (e instanceof RangeError) return '...';
            // 处理异常情况
            throw e;
        }
    },
    keys: function(object) {
        // 一个静态方法, 传入一个对象, 返回该对象中所有的属性, 构成数组返回
        var keys = [];
        for (var property in object)
        keys.push(property);
        // 将每个属性压入到一个数组中
        return keys;
    },
    values: function(object) {
        // 一个静态方法, 传入一个对象, 返回该对象中所有属性所对应的值, 构成数组返回
        var values = [];
        for (var property in object) values.push(object[property]);
        // 将每个属性的值压入到一个数组中
        return values;
    },
    clone: function(object) {
        // 一个静态方法, 传入一个对象, 克隆一个新对象并返回
        return Object.extend({},
        object);
    }
});

//获取绝对x坐标
function getX(obj) {
    return obj.offsetLeft + (obj.offsetParent ? getX(obj.offsetParent) : obj.x ? obj.x: 0);


}
//获取绝对Y坐标
function getY(obj) {
    return (obj.offsetParent ? obj.offsetTop + getY(obj.offsetParent) : obj.y ? obj.y: 0);


}
//获取高度和宽度
var Style = {
    //获取元素最终的样式
    getFinalStyle: function(elem, css) {
        if (window.getComputedStyle) {
            return window.getComputedStyle(elem, null)[css];


        } else if (elem.currentStyle) {
            return elem.currentStyle[css];


        } else {
            return elem.style[css];


        }
    },
    height: function(elem) {
        if (this.getFinalStyle(elem, "display") !== "none") {
            return elem.offsetHeight || elem.clientHeight;


        } else {
            //获取隐藏掉的函数的高度，先让它显示，获取到高度之后再隐藏，下同
            elem.style.display = "block";
            var h = elem.offsetHeight || elem.clientHeight;
            elem.style.display = "none";
            return h;


        }


    },
    width: function(elem) {
        if (this.getFinalStyle(elem, "display") !== "none") {
            return elem.offsetWidth || elem.clientWidth;


        } else {
            elem.style.display = "block";
            var w = elem.offsetWidth || elem.clientWidth;
            elem.style.display = "none";
            return w;


        }


    }


};
function numberID() {
    return Math.round(Math.random() * 10000) * Math.round(Math.random() * 10000);


}
//弹出框插件
function T$(i) {
    return document.getElementById(i)

}
//针对自动关闭的计数，如果已经关闭过了就不自动关闭了
var sysCloseCount = 0;
NetBox = function() {
    var p,
    m,
    b,
    fn,
    ic,
    iw,
    ih,
    oe,
    ir,
    f = 0;
    //p:最外层对象 m:蒙板层对象 b:内容容器   oe:old element 原来的元素
    var oeT,
    oeL,
    oeW,
    oeH,
    currT,
    currL;
    //原尺寸的位置和大小,当前顶部 当前左边距离
    var showing = false;
    //是否整处于显示中
    var firstResied = false;
    //是否已经第一次缩放过了,发现会会发缩放两次
    var cc = '';
    //当前内容
    return {
        //显示 c:内容  w 宽度   h:高度   t >0说明这些秒后返回
        show: function(c, w, h, tb, r, mask, showl, showt) {

            //参数c:内容    宽度高度 w:宽度  h:高度   t:是否在指定的秒之后关闭   rresize的缩放id,如果存在的话就用这个进行缩放
            ir = r;
			this.hide();

                //如果不存在包含容器就先创建一个容器
                p = document.createElement('div');
                p.id = 'tinybox';
                m = document.createElement('div');
                m.id = 'tinymask';
                b = document.createElement('div');
                b.id = 'tinycontent';
                document.body.appendChild(m);
                document.body.appendChild(p);
                p.appendChild(b);

            cc = c;
            var t = (NetPage.height() / 2) - (h / 2);
            t = t < 10 ? 10: t;
            var endtop = 0;
            if (h < 100)
            endtop = (t + NetPage.top() - 60);
            else
            endtop = (t + NetPage.top());
            var endLeft = (NetPage.width() / 2) - (w / 2);


            ic = c;
            iw = w;
            ih = h;
            if (r) {
                currT = oeT = getY(r);
                currL = oeL = getX(r);
                oeW = Style.width(r) + 12;
                oeH = Style.height(r) + 12;



            }
            //如果需要缩放显示
            p.style.backgroundImage = 'none';
            p.innerHTML = '';
            if (r) {
                p.style.width = (oeW - 12) + 'px';
                p.style.height = (oeH - 12) + 'px';
                p.style.top = (oeT - 6) + 'px';
                p.style.left = (oeL - 6) + 'px';


            } else {
                p.style.width = w + 'px';
                if (h > 99) {
                    p.style.height = h + 'px';
                    p.style.top = showt ? showt: (endtop - 6) + 'px';
                    p.style.left = showl ? showl: (endLeft - 6) + 'px';


                } else {
                    p.style.height = 'auto';
                    p.style.top = showt ? showt: (endtop + 37) + 'px';
                    p.style.left = showl ? showl: (endLeft) + 'px';


                }



            }

            if (!mask) this.mask();

            if (r) {
                p.style.display = 'block';

                $("#tinybox").animate({
                    left: endLeft,
                    top: endtop,
                    width: w,
                    height: h

                },
                150, '', 
                function() {
                    p.innerHTML = cc;
                    p.style.height = "auto";


                });


            } else
            {
                p.innerHTML = cc;

                $(p).fadeIn(100);
                //fadeIn(100);	


            }
            if (tb) {
                sysCloseCount = 0;
                //还原到可以关闭的状态
                setTimeout(function() {
                    if (sysCloseCount == 0)
                    //如果没有关闭过就关闭
                    {
                        NetBox.hide()


                    }


                },
                1000 * tb)

            }

        },
        add:function(content,width,height,id,top,left){
			var maskid = id+"mask";
			var mask = "#"+maskid;
			var box = "#"+id;
			var allheight = NetPage.height();
			var allwidth = NetPage.width();
			$("body").append("<div class='tinybox' id='"+id+"'><div class='tinycontent'>"+content+"</div></div>");
            top = top==null ? (allheight/2)-(height/2) : top;
			top += NetPage.top() - 10;
			left = left==null ? (allwidth/2)-(width/2) : left;			
			$(box).width(width);
			$(box).height(height);
			$(box).css('top',top);			
			$(box).css('left',left);
            $("body").append("<div class='tinymask' id='"+maskid+"'></div>");
            $(mask).css('opacity',0.1);
			$(mask).css('filter','alpha(opacity=10)');
			$(mask).height(NetPage.theight());
			$(mask).width(NetPage.twidth());
			$(mask).show();
        },
        //关闭
        hide: function(callback) {
            $(m).remove();
            $(p).remove();
        },
        //重设大小 w:宽度 h:高度  callback:选填回调函数 ,h2:原始高度
        resize: function(w, h, callback, h2) {
            var t = (NetPage.height() / 2) - (h / 2);
            t = t < 10 ? 10: t;
            var endtop = (t + NetPage.top());
            var endLeft = (NetPage.width() / 2) - (w / 2);
            if (iw == w) w = 0;
            if (ih == h) h = 0;
            if (w > 0 && h > 0) {
                $("#tinybox").animate({
                    left:endLeft,
                    top:endtop,
                    width:w,
                    height:h
                },
                150, '', 
                function() {
                    if (h2 == 99) p.style.height = 'auto';
                    $("#fancybox-frame").css("height", "100%");
                    if (callback != null)
                    callback;



                });


            } else if (w > 0) {
                $("#tinybox").animate({
                    left: endLeft,
                    width: w

                },
                150, '', 
                function() {
                    if (h2 == 99) p.style.height = 'auto';
                    $("#fancybox-frame").css("height", "100%");
                    if (callback != null)
                    callback;



                });


            } else if (h > 0) {
                $("#tinybox").animate({
                    top: endtop,
                    height: h

                },
                150, '', 
                function() {
                    if (h2 == 99) p.style.height = 'auto';
                    $("#fancybox-frame").css("height", "100%");
                    if (callback != null)
                    callback;



                });


            } else {
                if (h2 == 99) p.style.height = 'auto';
                if (callback != null) callback;


            }


        },
        //遮罩
        mask: function() {
            m.style.opacity = 0.2;
            m.style.filter = 'alpha(opacity=20)';
            m.style.display = "block";
            m.style.height = NetPage.theight() + 'px';
            m.style.width = NetPage.twidth() + 'px';
        },
        //位置
        pos: function() {
            //$("body").append("d ");测试是否没有结束
            },
        //大小  
        size: function(e, w, h, s) {
            e = typeof e == 'object' ? e: T$(e);
            clearInterval(e.si);
            var ow = e.offsetWidth,
            oh = e.offsetHeight,
            wo = ow - parseInt(e.style.width),
            ho = oh - parseInt(e.style.height);
            var wd = ow - wo > w ? -1: 1,
            hd = (oh - ho > h) ? -1: 1;
            e.si = setInterval(function() {
                NetBox.twsize(e, w, wo, wd, h, ho, hd, s)

            },
            10)


        },
        twsize: function(e, w, wo, wd, h, ho, hd, s) {
            var ow = e.offsetWidth - wo,
            oh = e.offsetHeight - ho;
            if (ow == w && oh == h) {
                clearInterval(e.si);
                p.style.backgroundImage = 'none';
                b.style.display = 'block';
                p.innerHTML = cc;


            } else {
                if (ow != w) {
                    e.style.width = ow + (Math.ceil(Math.abs(w - ow) / s) * wd) + 'px'

                }
                if (oh != h) {
                    e.style.height = oh + (Math.ceil(Math.abs(h - oh) / s) * hd) + 'px'

                }
                this.pos();
                if (lastWidth == ow && lastHeight == oh) {

                    clearInterval(e.si);


                }
                lastWidth = ow;
                lastHeight = oh;
                //$("body").append(" 9"+ow+"+"+w);测试是否没有结束


            }


        }


    }
    var lastWidth = 0;
    var lastHeight = 0;


} ();
//页面  
NetPage = function() {
    return {
        top: function() {
            return document.body.scrollTop || document.documentElement.scrollTop

        },
        width: function() {
            return self.innerWidth || document.documentElement.clientWidth

        },
        height: function() {
            return self.innerHeight || document.documentElement.clientHeight

        },
        theight: function() {
            var d = document,
            b = d.body,
            e = d.documentElement;
            return Math.max(Math.max(b.scrollHeight, e.scrollHeight), Math.max(b.clientHeight, e.clientHeight))


        },
        twidth: function() {
            var d = document,
            b = d.body,
            e = d.documentElement;
            return Math.max(Math.max(b.scrollWidth, e.scrollWidth), Math.max(b.clientWidth, e.clientWidth))


        }


    }


} ();

//备份数据修改
function showAsk(options,fn,fun) {
  var defaults = {
    CloseTime:0,//几秒钟后自动关闭 
    Msg:'？',//信息
    Title:'？',
    Height:99,
    callback:"Close()",  //点击确定时的回调函数
    callback2:"Close()",  //点击否时的回调函数
	style:'MessageHelp',
    fromObj:null  //从这个地方弹出来,如果是null就不弹
  };
  options=Object.extend(defaults, options);
  if(options.Title=='？') options.Title = '提示：';
  var content='<div class="AlertMessage"><div class="MessageTitle">'+options.Title+'</div><div class="'+options.style+'"><div class="Message">'+options.Msg+'</div></div><div class="MessageControl"><div class="MessageControl2" >'+
	 '<a onfocus="this.blur()" class="ok" href="javascript:void(0)"><span>确定</span></a>'+
	 '<a onfocus="this.blur()" class="noback" href="javascript:void(0);"><span>取消</span></a>'+
	 '</div></div></div>';
   NetBox.show(content,380,options.Height,options.CloseTime,options.fromObj);
   $(".ok").bind("click", eval(fn));
   if(fun==null){
     $(".noback").bind("click",function(){Close();});
   }else{
     $(".noback").bind("click", eval(fun));
   }
}
//备份数据修改
function showAlert(options,fn,fun) {
  var defaults = {
    CloseTime:0,//几秒钟后自动关闭 
    Msg:'？',//信息
    Title:'？',
    Height:99,
    callback:"Close()",  //点击确定时的回调函数
    callback2:"Close()",  //点击否时的回调函数
    fromObj:null  //从这个地方弹出来,如果是null就不弹
  };
  options=Object.extend(defaults, options);
  if(options.Title!='？') options.Msg=options.Title;
  var content='<div class="AlertMessage"><div class="MessageTitle">提示：</div><div class="MessageAlert"><div class="Message">'+options.Msg+'</div></div><div class="MessageControl"><div class="MessageControl2" >'+
	 '<a onfocus="this.blur()" class="ok" href="javascript:void(0)"><span>确定</span></a>'+
	 '</div></div></div>';
   NetBox.show(content,380,options.Height,options.CloseTime,options.fromObj);
   $(".ok").bind("click", eval(fn));
}
function showLoad() {
    $(".Message").html('<span id="msgload" class="Messageload">数据处理中...</span>');
}
function showMsg(str) {
    $(".Message").html(str);
}
function Message(msg, style, options,functions) {
    var defaults = {
        CloseTime: 0,
        //几秒钟后自动关闭
        Msg: '',
        //信息
        Style: 'Alert',
        //使用的样式
        Height: 99,
        //如果是这个高度就自动高度
        callback: "Close()",
        //从这个地方弹出来,如果是null就不谈
        fromObj: null
        //从这个地方弹出来,如果是null就不弹
    };
    options = Object.extend(defaults, options);
    if (msg.length > 0)
    options.Msg = msg;
    if (style)
    options.Style = style;
    var content = '<div class="AlertMessage">' + 
    '<div class="MessageTitle">提示：</div><div class="Message' + options.Style + '">' + 
    '<div class="Message">' + options.Msg + '</div></div>' + 
    '<div class="MessageControl"><div class="MessageControl2">' + 
    '<a class="ok" href="javascript:;"><span>确定</span></a>' + 
    '</div></div></div>';
    NetBox.show(content, 360, options.Height, options.CloseTime, options.fromObj);
	if(functions==null){
      $(".ok").bind("click",function(){
		Close();							 
	  });	
    }else{
	  $(".ok").bind("click",eval(functions));	
	}
}

function loadMessage(msg,style,options) {
    var defaults = {
        CloseTime: 0,
        //几秒钟后自动关闭
        Msg: '',
        //信息
        Style: 'Alert',
        //使用的样式
        Height:30,
		Width: 200,
        //如果是这个高度就自动高度
        callback: "Close()",
        //从这个地方弹出来,如果是null就不谈
        fromObj: null
        //从这个地方弹出来,如果是null就不弹
    };
    options = Object.extend(defaults, options);
    if (msg.length > 0)
    options.Msg = msg;
    if (style)
    options.Style = style;
    var content = '<div class="Message">' + options.Msg + '</div></div>';
    NetBox.show(content, options.Width, options.Height, options.CloseTime, options.fromObj);
}

//询问插件
function Ask(options) {
    var defaults = {
        CloseTime: 0,
        //几秒钟后自动关闭 
        Msg: '？',
        //信息
        Title: '？',
        Height: 99,
        callback: "Close()",
        //点击确定时的回调函数
        callback2: "Close()",
        //点击否时的回调函数
        fromObj: null
        //从这个地方弹出来,如果是null就不弹
    };
    options = Object.extend(defaults, options);
    if (options.Title != '？')
    options.Msg = options.Title;
    var content = '<div class="AlertMessage"><div class="MessageTitle">提示：</div><div class="MessageHelp"><div class="Message">' + options.Msg + '</div></div><div class="MessageControl"><div class="MessageControl2">' + 
    '<a class="ok" href="javascript:' + options.callback + ';"><span>确定</span></a>' + 
    '<a class="noback" href="javascript:' + options.callback2 + ';"><span>取消</span></a>' + 
    '</div></div></div>';
    NetBox.show(content, 380, options.Height, options.CloseTime, options.fromObj);
}

function Confirm(res,options){
	
}

//弹出警告对话框
function Alert(msg, options){
    Message(msg + "", "Alert", options);
}

//信息对话框
function Info(msg, options)
 {
    Message(msg + "", "Info", options);



}
//信息对话框
function Wrong(msg, options)
 {
    Message(msg + "", "Wrong", options);



}
//正确信息对话框
function Right(msg,options,functions)
 {
    Message(msg + "", "Right", options,functions);



}
//帮助/询问信息对话框
function Help(msg, options)
 {
    Message(msg + "", "Help", options);



}


function LoadingCircle() {
    var content = '<div id="msgload" class="LoadingCircle"></div>';
    NetBox.show(content,220,38);
}



function showLoading(options) {
    loadMessage('<span id="msgload" class="Messageload">数据处理中...</span>', "Loading", options);
}


//直接显示
function msgHtml(id,width,height,title,remove) {
    var content = '';
    if (title) content += '<div class="popIframeTitle"><div class="popIframeTitle">&nbsp;&nbsp;' + title + '</div><div class="popIframeCloseC">' + 
    '<a class="popIframeClose"  href="javascript:Close()">关闭</a></div></div>';
    content += $("#"+id).html();
    if (remove==null) $("#"+id).remove();
    NetBox.show(content, width, height);
}

//通用的简化Close方法
function Close() {
    NetBox.hide();
}

function resize(w, h) {
    NetBox.resize(w, h);
}
function showDiv(content, width, height, closeTime, left, top) {
    NetBox.show(content,width, height, closeTime, '', true, left, top);
}
//用Iframe来显示一个网页地址
function Iframe(options) {
    var defaults = {
        Url: '',
        zoomSpeedIn: 100,
        zoomSpeedOut: 100,
        Width: 540,
        Height: 190,
        Title: "",
        overlayShow: false,
        modal: true,
        isShowIframeTitle: true,
        isIframeAutoHeight: false,
        scrolling: "auto",
        overlayOpacity: 0.5,
        overlayColor: '#000000',
        padding: 0,
        IsShow: false,
        fromObj: null
        //从这个地方弹出来,如果是null就不谈


    };
    options = Object.extend(defaults, options);
    var iframeHeight = (options.height - 36) + "px";
    var content = '';
    if (options.isShowIframeTitle)
    {
        if (options.isIframeAutoHeight)
        //需要自适应高度 
        {
            content = '<div class="popIframeTitle"><div class="popIframeTitle">&nbsp;&nbsp;' + options.Title + '</div><div class="popIframeCloseC">' + 
            '<a class="popIframeClose"  href="javascript:Close()">关闭</a></div></div><iframe id="fancybox-frame" name="fancybox-frame' + new Date().getTime() + '" frameborder="0"   hspace="0" ' + ($.browser.msie ? 'allowtransparency="true""': '') + ' scrolling="' + options.scrolling + '" onload="$(this).height($(this).contents().height());NetBox.resize(0,($(this).contents().height()+36));" src="' + options.Url + '"></iframe>';


        }
        else {
            content = '<div class="popIframeTitle"><div class="popIframeTitle">&nbsp;&nbsp;' + options.Title + '</div><div class="popIframeCloseC">' + 
            '<a class="popIframeClose"  href="javascript:Close()">关闭</a></div></div><div id="popLoad" class="popLoad" style="height:' + (options.Height - 36) + 'px">&nbsp;</div><iframe id="fancybox-frame" name="fancybox-frame' + new Date().getTime() + '" frameborder="0" hspace="0"  scrolling="' + options.scrolling + '" style="height:' + (options.Height - 36) + 'px;" onload="hidepopLoad(this);"  src="' + options.Url + '"></iframe>';


        }


    }
    else
    {
        if (options.isIframeAutoHeight)
        //需要自适应高度
        content = '<iframe id="fancybox-frame" name="fancybox-frame' + new Date().getTime() + '" frameborder="0" hspace="0" ' + ($.browser.msie ? 'allowtransparency="true""': '') + '  onload="$(this).height($(this).contents().height());NetBox.resize(0,($(this).contents().height()));" scrolling="' + options.scrolling + '" src="' + options.Url + '"></iframe>';
        else
        content = '<iframe id="fancybox-frame" name="fancybox-frame' + new Date().getTime() + '" frameborder="0" hspace="0" ' + ($.browser.msie ? 'allowtransparency="true""': '') + ' scrolling="' + options.scrolling + '" src="' + options.Url + '"></iframe>';


    }
    NetBox.show(content, options.Width, options.Height, 0, options.fromObj);

}
function showbox(opts){
    var main = {
      html:"",
      width:540,
      height:190,
      id:"",
      title:"",
      closed:true
    };
	opts = Object.extend(main,opts);
	if(opts.closed==false&&$("#"+opts.id).length>0){
      $("#"+id).show(500);
      $("#"+id+"mask").show(500);
	}else{
	  var html = ''
	  if(opts.title){
	    html += '<div class="popIframeTitle"><div class="popIframeTitle">&nbsp;&nbsp;'+opts.title+'</div><div class="popIframeCloseC">';
	    html += '<a class="popIframeClose"  href="javascript:hidebox(\''+opts.id+'\',\''+opts.closed+'\')">关闭</a></div></div>';		
  	  }
	  html += opts.html;
      NetBox.add(html,opts.width,opts.height,opts.id);
	}
}
function hidebox(id,closed){
  if(closed){
    $("#"+id).remove();
    $("#"+id+"mask").remove();
  }else{
    $("#"+id).hide();
    $("#"+id+"mask").hide();
  }
}

function resizebox(id,width,height){
   var t = (NetPage.height()/2)-(height/2);
   var top = (t + NetPage.top());
   var left = (NetPage.width()/2)-(width/2);
   $("#"+id).animate({left:left,top:top,width:width,height:height},100);

}

function hidepopLoad(obj) {
    $(obj).show();
    $("#popLoad").remove();
}
function showhandle(opts,functions) {
    var main = {
      html:"",
      width:540,
      height:190,
      id:"",
      title:"",
      closed:true
    };
	opts = Object.extend(main,opts);
	if(opts.closed==false&&$("#"+opts.id).length>0){
		alert('abcd');
      $("#"+id).show();
      $("#"+id+"mask").show();
	}else{
      if($("#"+opts.id).length<1){
	  var html = ''
	  if(opts.title){
	    html += '<div class="popIframeTitle"><div class="popIframeTitle">'+opts.title+'</div><div class="popIframeCloseC">';
	    html += '<a class="popIframeClose" href="javascript:hidebox(\''+opts.id+'\',\''+opts.closed+'\')">关闭</a></div></div>';		
  	  }
	  html += opts.html;
	  html += '<div class="MessageControl"><span id="'+opts.id+'tip" class="tips tipsmes"></span><span id="controlLoad">数据处理中...</span><div class="MessageControl2">';
	  html += '<a class="ok" href="javascript:;"><span>确定</span></a><a class="noback" href="javascript:;"><span>取消</span></a></div></div>';
      NetBox.add(html,opts.width,opts.height,opts.id);
	  $(".ok").bind("click",eval(functions));
	  $(".noback").bind("click",function(){
		hidebox(opts.id,opts.closed);							 
	  });
	  }
	}
}