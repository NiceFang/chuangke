function gotrade(){
	    $("#submit").attr("disabled",true);
		$("#howmoney").attr("disabled",true);
		$("#repass").attr("disabled",true);
		$("#price").attr("disabled",true);
	    var howmoney = $("#howmoney").val();
        var price = $("#price").val();
		var order_type = $("#order_type").val();
	    $("#controlLoad").show();
	    removetip("trade");
        $.getJSON(get_path_url("?mod=member&act=trading&type=ajax&howmoney="+howmoney+"&price="+price+"&order_type="+order_type+"&repass="+$("#repass").val()),function(res){
	      $("#controlLoad").hide();																		 
	      if(res.error=='0'){
			if(res._message=='1'){
			  $("#controlLoad").show();
			  _database = res;
			  _databasetime = window.setInterval("ajaxtrade(_database)",500);
			}else{
			  $("#howmoney").val('');
			  $("#order_total").val('0');
			  $("#order_fee").val('0');
			  $("#repass").val('');
			  $("#submit").attr("disabled",false);
		  	  $("#howmoney").attr("disabled",false);
			  $("#repass").attr("disabled",false);
			  $("#price").attr("disabled",false);
			  $("#controlLoad").hide();
		    }
	      }else{
		    addtip("trade",res.error);
			$("#submit").attr("disabled",false);
			$("#howmoney").attr("disabled",false);
			$("#repass").attr("disabled",false);
			$("#price").attr("disabled",false);
	      }							  
        });
} 
function _removetip(id){
 $("#"+id+"tip").removeClass('_hide').removeClass('_show').removeClass('_yes').removeClass('_error').html('');
}
function _addtip(id,message){
 $("#"+id+"tip").removeClass('_hide').removeClass('_show').removeClass('_yes').addClass('_error').html(message);
}
function _showtip(id,message){
 $("#"+id+"tip").removeClass('_hide').removeClass('_error').removeClass('_yes').addClass('_show').html(message);
}
function _yestip(id,message){
 $("#"+id+"tip").removeClass('_hide').removeClass('_error').removeClass('_show').addClass('_yes').html(message);
}
function _hidetip(id,message){
 $("#"+id+"tip").removeClass('_show').removeClass('_yes').removeClass('_error').addClass('_hide').html(message);
}
function removetip(id){
 var _this = $("#"+id+"tip");
 _this.html('').hide();
 _this.parent().removeClass('has-error').removeClass('has-warning');
}
function addtip(id,message){
 var _this = $("#"+id+"tip");
 _this.html('<i class="fa fa-times-circle-o"></i> <span>'+message+'</span>').show();
 _this.parent().addClass('has-error');
}
function showtip(id,message){
 var _this = $("#"+id+"tip");
 _this.html('<i class="fa fa-bell-o"></i> <span>'+message+'</span>').show();
 _this.parent().addClass('has-warning');
}

function yestip(id,message){
 var _this = $("#"+id+"tip");
 _this.html('<i class="fa fa-check"></i> <span>'+message+'</span>').show();
 _this.parent().removeClass('has-error').addClass('has-success');
}
function istip(id,classname){
 return $("#"+id+"tip").hasClass(classname);
}
function removeclass(id){
 $("#"+id).removeClass();
 $("#"+id).html('');
}
function addClass(id,myclass,message){
 var value = message=='' ? '' : '<span class="action_po"><span class="action_po_top">'+message+'</span><span class="action_po_bot"></span></span></span>'; 
 $("#"+id).removeClass();
 $("#"+id).addClass(myclass);
 $("#"+id).html(value);
}
function reSeccode(obj){
 var src = $(obj).attr("src");
 var str = src.split("&"); 
 var img = str[0]+'&'+str[1]+"&"+getRandom(5);
 $(obj).attr("src",img);
}
function isLogin(){
 $.ajax({url:get_url('&act=islogin'),type:'GET',success:function(isLogin){$("#isLogin").html(isLogin);}});	
}
function sinAlert(message){
 var msg = message ? message : '确定操作吗？';
 if(confirm(msg)) return true;
 return false;
}
function showImg(obj,left){
 var image = new Image();
 image.src = obj.src;
 left = left ? left : 5;
 html = "<img src='"+obj.src+"' width='"+image.width+"' height='"+image.height+"' onmouseout='Close();'/>";
 showDiv(html,image.width,image.height,0,$(obj).offset().left+obj.width+left,$(obj).offset().top+obj.height);
}

function in_array(arr,val){
 var re = false;
 if(arr!=null) for(i=0;i<arr.length;i++) if(arr[i]==val) re = true;
 return re;
}
function Msg(message,url){
 var message = message ? message : '确定操作吗？';
 Ask({Msg:message,callback:'location.href = \''+url+'\';'});
}

function _confirm(message,url){
 var message = message ? message : '确定操作吗？';
 Ask({Msg:message,callback:'location.href = \''+url+'\';'});
}

function Ale(message,obj){
  var msg = message ? message : '确定操作吗？';
  if(confirm(msg)){
    obj.submit();
  }
}

function getrewrite(parmat){
 return ajaxHtml(get_url('act=getrewrite&url='+encodeURIComponent(parmat)));
}
var isArray = function(obj) { 
 return Object.prototype.toString.call(obj) === '[object Array]'; 
} 

var isObject = function(obj) { 
 return Object.prototype.toString.call(obj) === '[object Object]'; 
} 


function checkall(form, name) {
 for(var i = 0; i < form.elements.length; i++) {
  var e = form.elements[i];
  if(e.name.match(name)) e.checked = form.elements['chkall'].checked;
 }
}
function getRandom(n){
 var rnd="";
 for(var i=0;i<n;i++) rnd += Math.floor(Math.random()*10);
 return rnd;
}
function ajaxurl(parmat){
  return siteurl+'index.php?mod=tools&act=ajax&'+parmat+'&floor='+getRandom(5);	
}

function ajax(url){
 var url = url+'&floor='+Math.floor(Math.random()*10000+1),value;
 url = url.replace("mod=admin","mod="+adminpath);
 $.ajax({url:url,type: 'GET',success: function(res){var value = res;},async:false,dataType:"json"});
 return value;
}
function get_url(parmat){
 return siteurl+'index.php?mod=tools&'+parmat+'&floor='+getRandom(5);	
}

function get_path_url(parmat){
 parmat = parmat.replace("mod=admin","mod="+adminpath);
 return siteurl+'index.php'+parmat+'&floor='+getRandom(5);	
}

function ajaxHtml(url){
 var url = url+'&floor='+Math.floor(Math.random()*10000+1),value;
 url = url.replace("mod=admin","mod="+adminpath);
 $.ajax({url:url,type: 'GET',success: function(msg){value = msg;},async:false});
 return value;
}
function strlen(str){
 var strlength=0;
 for(i=0;i<str.length;i++){
  if(isChinese(str.charAt(i))==true){
   strlength=strlength + 2;
  }else{
   strlength=strlength + 1;
  }
 }
 return strlength;
}
String.prototype.trim = function(){
  return this.replace(/(^\s*)|(\s*$)/g, "");
}
function isChinese(str){
  var reg = /[u00-uFF]/;       
  return !reg.test(str);      
}

function isSpecial(str){
  var reg =  /^([a-z0-9]|[_]){0,10000}$/;       
  return reg.test(str);      
}

function isinCn(str){
 var pattern=/[^\x00-\xff]/g;
 if(pattern.test(str)){
  return true;
 }else{
  return false;
 }
} 
function isEmail(email){
  var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
  return reg.test(email);
}
function isNum(str){
  return !isNaN(str);
}

function isFirstNum(str){
  return !isNaN(str.charAt(0));
}
function ishttp(str){
  str = str.match(/http:\/\/.+/);
  return !(str==null);
}
function isIcq(str){
  var reg = /^[1-9]\d{4,9}$/;
  return  reg.test(str);
}
function isPhone(str){
  var reg = /([1-9]{1,3}\-[1-9]{7,8}$)|(1[0-9]{10,10}$)/;
  return  reg.test(str.trim());
}
function getid(id){
  return document.getElementById(id);	
}
function getgm(id){
  return $(id);
}
function checkId(pId){
  var arrVerifyCode = [1,0,"x",9,8,7,6,5,4,3,2];
  var Wi = [7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2];
  var Checker = [1,9,8,7,6,5,4,3,2,1,1];
  if(pId.length != 15 && pId.length != 18)    return false;
  var Ai=pId.length==18 ?  pId.substring(0,17)   :   pId.slice(0,6)+"19"+pId.slice(6,16);
  if (!/^\d+$/.test(Ai))  return false;
  var yyyy=Ai.slice(6,10) ,  mm=Ai.slice(10,12)-1  ,  dd=Ai.slice(12,14);
  var d=new Date(yyyy,mm,dd) ,  now=new Date();
  var year=d.getFullYear() ,  mon=d.getMonth() , day=d.getDate();
  if (year!=yyyy || mon!=mm || day!=dd || d>now || year<1940) return false;
  for(var i=0,ret=0;i<17;i++)  ret+=Ai.charAt(i)*Wi[i];
  Ai+=arrVerifyCode[ret %=11];     
  return pId.length ==18 && pId != Ai ? false : true;        
}
function doget(key){
 var key = "mod,act,"+key;
 var arr = key.split(",");
 var val = new Array();
 for(var i=0;i<arr.length;i++){
   val[i] = $("#"+arr[i]).val();	 
 }
 $.getScript(get_url('&act=request&key='+encodeURIComponent(key)+'&val='+encodeURIComponent(val)),function(){
   if(res.error){
	 Wrong(res.error); 
   }else{																									   
     location.href = res.url;		
   }
 });
}
function autoTop(id,classname){
  var head = document.getElementById(id);
  var height = head.getBoundingClientRect().top;
  window.onscroll = function(){
    var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
    if(scrollTop > height){
      head.className = classname+' autoTop';
    }else{
      head.className = classname;
    }
  }
}
function DrawImage(ImgD,FitWidth,FitHeight){ 
var image=new Image(); 
image.src=ImgD.src; 
if(image.width>0 && image.height>0){ 
if(image.width/image.height>= FitWidth/FitHeight){ 
if(image.width>FitWidth){ 
ImgD.width=FitWidth; 
ImgD.height=(image.height*FitWidth)/image.width;
ImgD.style.marginTop=(FitHeight-ImgD.height)/2+"px";
}else{ 
ImgD.width=image.width; 
ImgD.height=image.height;
ImgD.style.marginTop=(FitHeight-ImgD.height)/2+"px";
ImgD.style.marginLeft=(FitWidth-ImgD.width)/2+"px";
} 
}else{ 
if(image.height>FitHeight){ 
ImgD.height=FitHeight; 
ImgD.width=(image.width*FitHeight)/image.height;
ImgD.style.marginLeft=(FitWidth-ImgD.width)/2+"px"; 
}else{ 
ImgD.width=image.width; 
ImgD.height=image.height;
ImgD.style.marginTop=(FitHeight-ImgD.height)/2+"px";
ImgD.style.marginLeft=(FitWidth-ImgD.width)/2+"px";
} 
} 
} 
}
function tabCutover(c,d){$(c).parent().attr("class");$(c).parent().children().removeClass("current");$(c).addClass("current");$("."+d).parent().children().hide();$("."+d).show();}
function CharMode(iN) {
        if (iN >= 48 && iN <= 57) //数字       
            return 1;
        if (iN >= 65 && iN <= 90) //大写字母       
            return 2;
        if (iN >= 97 && iN <= 122) //小写       
            return 4;
        else
            return 8; //特殊字符       
}    
function bitTotal(num) {
        modes = 0;
        for (i = 0; i < 4; i++) {
            if (num & 1) modes++;
            num >>= 1;
        }
        return modes;
}
function checkStrong(sPW) {
        if (sPW.length <= 4)
            return 0; //密码太短       
        Modes = 0;
        for (i = 0; i < sPW.length; i++) {
            //测试每一个字符的类别并统计一共有多少种模式.       
            Modes |= CharMode(sPW.charCodeAt(i));
        }

        return bitTotal(Modes);
}
function pwStrength(pwd){

        S_level = checkStrong(pwd);

        O_color = "";
        L_color = "ruo";
        M_color = "zhong";
        H_color = "qiang";
        if (pwd == null || pwd == "") {
            Lcolor = O_color;
            Lcolor_H = "";
        }
        else {
            S_level = checkStrong(pwd);
            switch (S_level) {
                case 0:
                    Lcolor = O_color;
                    Lcolor_H = "";
                case 1:
                    Lcolor = L_color;
                    Lcolor_H = "弱";
                    break;
                case 2:
                    Lcolor = M_color;
                    Lcolor_H = "中";
                    break;
                default:
                    Lcolor = H_color;
                    Lcolor_H = "强";
            }
        }
        $(".grade-pwd ul").removeClass().addClass(Lcolor);
        $(".grade-pwd .grade-text").html(Lcolor_H);
}
function clickchked(key,name){
	if(name==null) name = 'paytype';
	$("input[name='"+name+"']").each(
	   function(){
		 $(this)[0].checked=false;
	   }
	)
    $('#'+key).attr("checked",true);
}
function clickrow(obj){
  if($(".cat"+obj.id).is(":hidden")){
	 $(".cat"+obj.id).show();
	 var src = $("#"+obj.id).attr("src").replace("images/menu_plus.gif","images/menu_minus.gif");
	 $("#"+obj.id).attr("src",src);
  }else{
     $(".cat"+obj.id).each(function(){
       $(this).hide();
	   var span = $(this).find("span").html();
	   if(span){
		 $(".cat"+span).hide();
	     var _src = $("#"+span).attr("src").replace("images/menu_minus.gif","images/menu_plus.gif");
	     $("#"+span).attr("src",_src);
	   }
     });
	 var src = $("#"+obj.id).attr("src").replace("images/menu_minus.gif","images/menu_plus.gif");
	 $("#"+obj.id).attr("src",src);
  }
}
function modified(code){
  var number = $('#number').val();
  if(code==1){
   $('#number').val(parseInt(number)+1);
  }
  if(code==-1){
   if(parseInt(number)<2){
     $('#number').val('1');
   }else{
     $('#number').val(parseInt(number)-1);
   }
  }
}
//购物车手动输入数量
function input(){
  var number = $('#number').val();
  if(!(number.match(/\D/)===null)){
   alert('购买数量请输入数字!');
   $("#number")[0].focus();
   $('#number').val('1');
   return false;
  }
  if(number<=0){
   alert('请输入大于零的数字!');
   $("#number")[0].focus();
   $('#number').val('1');
   return false;
  }
}
function autoSeach(){
  document.autoSeachObj.submit();	
}
function chart(obj,type,categories,data,showInLegend,size){
  if(type=='pie'){
	size = size==null ? 240 : size;
	showInLegend = showInLegend==null ? true : false;
    $('#'+obj).highcharts({
      chart:{type:type,backgroundColor: 'rgba(0,0,0,0)'},	  
      title:{text:''},
      plotOptions: {pie:{allowPointSelect: true,cursor: 'pointer',dataLabels:{enabled:true,formatter: function() {
		  return '<b>'+this.point.name+'</b>:'+parseFloat(this.percentage).toFixed(2)+'%'
      }},showInLegend:showInLegend}},
      tooltip:{formatter: function(){return '<b>' + this.point.name + '</b>:  ' + this.point.y + '元(' + parseFloat(this.percentage).toFixed(2) + '%)'}},
      series:[{data:data,size:size}]
    });	  
  }else{
    $('#'+obj).highcharts({
      chart:{type:type,backgroundColor: 'rgba(0,0,0,0)'},
      title:{text:''},
      tooltip:{formatter: function() {return '<b>' + this.series.name + '</b>: '+ this.point.y + '元'}},
      xAxis:{categories:categories,labels:{rotation:20,y:22,style: {fontFamily:'arial',fontSize:'10px'}}},
      yAxis: {min:0,title: {text:''}},
      series:data
    });	
  }
}