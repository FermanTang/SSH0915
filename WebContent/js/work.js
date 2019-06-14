//添加加载事件
$(document).ready(showUserName);
// 为用户名输入框配置事件
$("[name='userName']").bind({
	"blur" : checkUserName,
	"focus" : showUserName
});
// 为密码输入框配置事件
$(":password:first").bind({
	"blur" : checkPassword,
	"focus" : showPassword
});
// 为密码确认输入框配置事件
$(":password:last").bind({
	"blur" : checkPaw,
	"focus" : showPaw
});

// 为生日输入框配置事件
$("[name='birthday']").bind({
	"blur" : checkBirthday,
	"focus" : showBirthday
});

//为电话输入框配置事件
$("[name='phone']").bind({
	"blur" : checkPhone,
	"focus" : showPhone
});

//为邮箱输入框配置事件
$("[name='email']").bind({
	"blur" : checkEmail,
	"focus" : showEmail
});
/*验证邮箱信息*/
function checkEmail() {
	//获取当前电话框信息
	var email = $("[name='email']").val();
	//验证，声明变量
	var msg = "√邮箱输入正确", // 默认提示信息
	color = "green", // 默认的提示信息颜色
	flag = true;// 默认的验证结果
	// 判断
	if (!email) {
		msg = "×邮箱不能为空";
		color = "red";
		flag = false;
	} else if (!/^[\w@]{4,12}(\.[a-z]{2,8})?@[\da-zA-Z]{2,6}(\.[a-z]{2,3}){1,2}$/.test(email)) {
		msg = "×邮箱输入格式有误";
		color = "red";
		flag = false;
	}
	// 显示提示信息，返回验证结果
	$("[name='email']").css("border", "solid" + color).parent().next().html(
			msg).css("color", color)
	return flag;
}
/*验证电话信息*/
function checkPhone() {
	//获取当前电话框信息
	var phone = $("[name='phone']").val();
	//验证，声明变量
	var msg = "√电话输入正确", // 默认提示信息
	color = "green", // 默认的提示信息颜色
	flag = true;// 默认的验证结果
	// 判断
	if (!phone) {
		msg = "×电话不能为空";
		color = "red";
		flag = false;
	} else if (!/^0[1-9]\d-\d{8}|0[1-9]\d{2}-\d{8}|1[2,3,5,6,8]\d{9}$/.test(phone)) {
		msg = "×电话或手机输入格式有误";
		color = "red";
		flag = false;
	}
	// 显示提示信息，返回验证结果
	$("[name='phone']").css("border", "solid" + color).parent().next().html(
			msg).css("color", color)
	return flag;
}
/* 验证生日信息 */
function checkBirthday() {
	// 获取当前生日信息
	var birthday = $("[name='birthday']").val();
	// 验证，声明变量
	var msg = "√生日输入正确", // 默认提示信息
	color = "green", // 默认的提示信息颜色
	flag = true;// 默认的验证结果
	// 判断
	if (!birthday) {
		msg = "×生日不能为空";
		color = "red";
		flag = false;
	} else if (!/^\d{4}-\d{1,2}-\d{1,2}$/.test(birthday)) {
		msg = "×生日输入格式有误";
		color = "red";
		flag = false;
	}
	if (!checkDateValid(birthday)) {
		msg = "×日期无效或者未成年";
		color = "red";
		flag = false;
	}else {
		/*根据输入的生日判断其年龄*/
		//分割得到年月日
		var arrDate = birthday.split("-");
		// 得到年并转换成数字
		var year = parseInt(arrDate[0]);
		// 得到月并转换成数字
		var month = parseInt(arrDate[1]);
		// 得到日并转换成数字
		var day = parseInt(arrDate[2]);
		//得到现时的时间
		var date = new Date();
		//得到年
		var newYear = date.getFullYear();
		//得到月
		var newMonth = date.getMonth()+1;
		//得到日
		var newDay = date.getDate();
		//得到日差
		var dayDiff = newDay- day;
		if(dayDiff<0){
			newMonth--;
		}
		//得到月差
		var monthDiff = newMonth - month;
		if(monthDiff<0){
			newYear--;
		}
		//得到年龄
		var ageDiff = newYear-year;
		//更改信息
		$("[name='age']").attr("placeholder",ageDiff + "岁");
	}
	// 显示提示信息，返回验证结果
	$("[name='birthday']").css("border", "solid" + color).parent().next().html(
			msg).css("color", color)
	return flag;

}

/* 对输入的日期进行确认 */
function checkDateValid(birthday) {
	// //得到分割符
	// var sepa = birthday.indexOf("-");
	// 将字符串分割成数组
	var arrDate = birthday.split("-");
	// 得到年并转换成数字
	var year = parseInt(arrDate[0]);
	// 得到月并转换成数字
	var month = parseInt(arrDate[1]);
	// 得到日并转换成数字
	var day = parseInt(arrDate[2]);
	// 判断基本年月日是否正确
	if (year > 2001 || year < 1900 || month > 13 || month < 1 || day > 31
			|| day < 1) {
		return false;
	}
	// 判断日是否正确
	if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {// 闰年
		if ((month == 2 && day > 29)
				|| ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30)
				|| ((month == 1 || month == 3 || month == 5 || month == 7
						|| month == 8 || month == 10 || month == 12) && day > 31)) {
			return false;
		}
	}else {//平年
		if ((month == 2 && day > 28)
				|| ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30)
				|| ((month == 1 || month == 3 || month == 5 || month == 7
						|| month == 8 || month == 10 || month == 12) && day > 31)) {
			return false;
		}
	}
	return true;
}
/* 验证密码确认信息 */
function checkPaw() {
	// 获取当前密码信息
	var pass = $(":password:first").val();
	// 获取当前确认密码信息
	var password = $(":password:last").val();
	// 验证，声明变量
	var msg = "√密码输入正确", // 默认提示信息
	color = "green", // 默认的提示信息颜色
	flag = true;// 默认的验证结果
	// 判断
	if (!password) {
		msg = "×密码确认不能为空";
		color = "red";
		flag = false;
	} else if (pass != password) {
		msg = "×两次密码输入不一致";
		color = "red";
		flag = false;
	}
	// 显示提示信息，返回验证结果
	$(":password:last").css("border", "solid" + color).parent().next()
			.html(msg).css("color", color)
	return flag;
}
/* 验证密码信息 */
function checkPassword() {
	// 获取当前密码信息
	var password = $(":password:first").val();
	// 验证，声明变量
	var msg = "√密码输入正确", // 默认提示信息
	color = "green", // 默认的提示信息颜色
	flag = true;// 默认的验证结果
	// 判断
	if (!password) {
		msg = "×密码不能为空";
		color = "red";
		flag = false;
	} else if (!/^(?![^0-9]+$)(?![^a-z]+$)(?![^A-Z]+$).{6,16}$/.test(password)) {
		msg = "×长度 6~18必须包含大写字母小写字母和数字";
		color = "red";
		flag = false;
	}
	// 显示提示信息，返回验证结果
	$(":password:first").css("border", "solid" + color).parent().next().html(
			msg).css("color", color)
	// 调用验证确认密码的函数
	checkPaw();
	return flag;

}
/* 验证用户信息 */
function checkUserName() {
	// 获取当前用户名信息
	var userName = $("[name='userName']").val();
	// 验证，声明变量
	var msg = "√用户名可用", // 默认提示信息
	color = "green", // 默认的提示信息颜色
	flag = true;// 默认的验证结果
	// 判断
	if (!userName) {
		msg = "×用户名不能为空";
		color = "red";
		flag = false;
	} else if (!/^[\w][0-9a-zA-Z@\&_\$\.]{3,15}$/.test(userName)) {
		msg = "×长度 4~16字母开头可以包含字母数字 _$@.不能有中文字符";
		color = "red";
		flag = false;
	}
	// 显示提示信息，返回验证结果
	$("[name='userName']").css("border", "solid" + color).parent().next().html(
			msg).css("color", color)
	return flag;
}
function checkAll() {
	// 创建包含所有验证函数的数组
	// 注：数组中的函数以字符串格式保存
	var arr = [ "checkUserName()", "checkPassword()", "checkPaw()",
			"checkBirthday()", "checkPhone()", "checkEmail()" ];
	// 循环遍历数组，使用eval(字符串)函数，逐一执行数组中的函娄，统计验证通过的数量
	var count = 0;// 计数器
	for (var i = 0; i < arr.length; i++) {
		// 判断
		if (eval(arr[i])) {
			count++;
		}
	}
	// 比对，通过数量与函数总数是否一致
	if (arr.length == count) {
		return true;
	}
	return false;
}
//邮箱框提示信息
function showEmail() {
	showHint("[name='email']","(必填)输入您的邮箱")
}
//电话框提示信息
function showPhone() {
	showHint("[name='phone']","(必填)输入您的手机或电话")
}
// 生日框提示信息
function showBirthday() {
	showHint("[name='birthday']", "(必填)输入的日期格式: 1990-5-5")
}
// 密码确认框提示信息
function showPaw() {
	showHint(":password:last", "(必填)与密码输入一致")
}
// 密码框提示信息
function showPassword() {
	showHint(":password:first", "(必填)长度 6~18必须包含大写字母小写字母和数字")
}
// 用户名框提示信息
function showUserName() {
	showHint("[name='userName']", "长度 4~16字母开头可以包含字母数字 _$@.不能有中文字符")
}
function showHint(selecter, msg) {
	$(selecter).parent().next().html(msg).css("color", "gray");
}