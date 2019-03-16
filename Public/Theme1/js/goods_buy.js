$(function(){
		   _number(1,goods_id);
})
function settake(id){
  $("#takeList").find('dl').removeClass('selected');
  $("#remove_"+id).addClass('selected');
  $("#takeid").val(id);
}
function checkform(){
  var post = true; 
  if(parseFloat($("#price").html())<=0){
	_box.alert({msg:'请选择您要订购的产品'});
    post = false;
  }
  return post;
} 
function _number(code,id){
  var number = $('#number_'+id).val();
  var _price = parseFloat($('#_price_'+id).html());
  var price = parseFloat($('#price').html());
  if(!(number.match(/\D/)===null)){
   Wrong('购买数量请输入数字!');
   $('#number_'+id).val('0');
   $('#number_'+id)[0].focus();
   return false;
  }
  if(code==1) $('#number_'+id).val(parseInt(number)+1);
  if(code==-1){
   if(parseInt(number)<2){
     $('#number_'+id).val('1');
   }else{
     $('#number_'+id).val(parseInt(number)-1);
   }
  }
  getprice(id);
}
function _input(obj,id){
  var number = $(obj).val();
  var _price = parseFloat($('#_price_'+id).html());
  var price = parseFloat($('#price').html());
  if(!(number.match(/\D/)===null)){
    Wrong('购买数量请输入数字!');
    $(obj)[0].focus();
    $(obj).val('0');
    return false;
  }
  if(number<0){
    Wrong('请输入大于或等于零的数字!');
    $(obj)[0].focus();
    $(obj).val('0');
    return false;
  }
  getprice(id);
}
function getprice(id){
  var _price = parseFloat($('#_price_'+id).html());
  $("#price_"+id).html(parseFloat(_price*parseInt($('#number_'+id).val())).toFixed(2));
  var price = 0.00;
  $(".price_").each(function(){
    price += parseFloat($(this).html());
  });
  $("#price").html(price.toFixed(2));
}
function addtack(id){
  if(id==null){
    sinbox('添加收货地址',get_path_url('?mod=member&act=delivery&refun=restack'),430,350);
  }else{
    sinbox('修改收货地址',get_path_url('?mod=member&act=delivery&refun=retack&id='+id),430,350);  
  }
}
function restack(json){
  if(json==null) return false;  
  var div = '<dl id="remove_'+json.id+'" onClick="settake(\''+json.id+'\');">';
  div += '<dt><strong class="itemConsignee">'+json.name+'</strong> <span class="itemTel">'+json.mobile+'</span> </dt>';
  div += '<dd><p class="itemStreet">'+json.address+'</p>';
  div += '<span class="icon-common icon-common-del delete" onClick="listTable.memberRemove(\''+json.id+'\',\'确定要删除该收货信息?\');"></span>';
  div += '<span class="icon-common icon-common-edit" onClick="addtack(\''+json.id+'\');"></span>';  
  div += '</dd>';
  div += '</dl>';
  $('#takeList').append(div);
  Close();
}
function retack(json){
  if(json==null) return false;
  var div = '<dt><strong class="itemConsignee">'+json.name+'</strong> <span class="itemTel">'+json.mobile+'</span> </dt>';
  div += '<dd><p class="itemStreet">'+json.address+'</p>';
  div += '<span class="icon-common icon-common-del delete" onClick="listTable.memberRemove(\''+json.id+'\',\'确定要删除该收货信息?\');"></span>';
  div += '<span class="icon-common icon-common-edit" onClick="addtack(\''+json.id+'\');"></span>';  
  div += '</dd>';
  $("#remove_"+json.id).html(div);
  Close();
}