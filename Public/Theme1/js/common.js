$(function () {
	
    if (buydate <= 0 && action == 'main') {
		
        var content = '你当前账户已到期，请及时续费';
        _box.confirm({msg: content, title: '续费提醒'}).on(function (e) {
            if (e) {
              //  location.href = '__APP__/User/add_use';
            }
        });
	}
	
    else if (buydate <= 5 && action == 'main') {
        var content = '你当前账户有效期仅剩' + buydate + '天，请及时续费';
        _box.confirm({msg: content, title: '续费提醒'}).on(function (e) {
            if (e) {
              //  location.href = '__APP__/User/add_use';
            }
        });
    }
})




// $(function () {
    // if (buydate <= 5 && action == 'main') {
        // var content = '你当前账户有效期仅剩' + buydate + '天，请及时续费';
        // _box.confirm({msg: content, title: '续费提醒'}).on(function (e) {
            // if (e) {
                // location.href = '__APP__/User/add_user';
            // }
        // });
    // }
// })