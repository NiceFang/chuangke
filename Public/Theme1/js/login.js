function checkusername(){
 if($("#username").val()==''){
   addtip("username","请输入会员账号"); 
 }else{
   removetip("username");
 }
}
function checkpassword(){
 if($("#password").val()==''){
   addtip("password","请输入登陆密码"); 
 }else{
   removetip("password");
 }
}
function checkseccode(){
 if($("#seccode").val()==''){
   addtip("seccode","请输入验证码"); 
 }else{
   removetip("seccode");
 }
}

function checkform(){
 var post = true; 
 if($("#username").val()==''){
   addtip("username","请输入会员账号");
   post = false;
 } 
 if($("#password").val()==''){
   addtip("password","请输入登陆密码");
   post = false;
 } 
 if($("#seccode").val()==''){
   addtip("verify","请输入验证码");
   post = false;
 }
 if(post) listTable.loadfrom('postform');
 return false;  
} 
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
 
});