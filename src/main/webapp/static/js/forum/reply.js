//点击小图片，显示表情
	$(".bq").click(function(e){
		$(".face").slideDown();//慢慢向下展开
		e.stopPropagation();   //阻止冒泡事件
	});

	//在桌面任意地方点击，他是关闭
	$(document).click(function(){
		$(".face").slideUp();//慢慢向上收
	});

	//点击小图标时，添加功能
	$(".face ul li").click(function(){
		var simg=$(this).find("img").clone();
		$(".message").append(simg);
	});

	//点击发表按扭，发表内容
	$("span.submit").click(function(){

		var txt=$(".message").html();
		if(txt==""){
			$('.message').focus();//自动获取焦点
			return;
		}

		$(".msgCon").prepend("<div class='msgBox'><dl><dt><img src='images/tx.jpg' width='50' height='50'/></dt><dd>神马都是浮云</dd></dl><div class='msgTxt'>"+txt+"</div></div>");
	});