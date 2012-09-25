<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://baguajie.net/functions" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>${signInUser.name} 设置账号 八卦街 有图有真相</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-responsive.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/baguajie-base.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/baguajie-theme.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/validationEngine.bootstrap.css" />" />
	<script type="text/javascript" src="<c:url value="/resources/js/ga.js" />" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.1.7.1.js" />" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/baguajie.init.js" />" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/baguajie.op.js" />" ></script>
</head>
<body class="front">
	<jsp:include page="/WEB-INF/views/comp/header.jsp">
		<jsp:param name="noNeed" value="true"/>
		<jsp:param name="tab" value="none"/>
	</jsp:include>
	<div class="container mb-30 board">
		<div class="pl-30 pr-30 pt-20 bg-gray">
		    <ul class="nav nav-tabs fs-14" 
		    	style="margin-left: -30px; margin-right: -30px;  margin-bottom:0px">
		    	<li class="active"  style="margin-left:30px">
		   			<a data-toggle="tab" href="#basic-info">基本信息</a></li>
		   		<li class="ml-10">
	   				<a data-toggle="tab" href="#change-avatar">修改头像</a></li>
	   			<li class="ml-10">
	   				<a data-toggle="tab" href="#change-pwd">修改密码</a></li>		
	   			<li class="">
	   				<a data-toggle="tab" href="#binding-weibo">关联三方账号</a></li>				    
			</ul>
	    </div>
	    <div class="tab-content p-20 of-v">
		    <div id="basic-info" class="tab-pane active fade in">
		    	<c:url value="/setting/basic" var="ub_url"/> 
		    	<form:form id="basicInfoForm" action="${ub_url}" method="post" class="form-horizontal mt-20 mb-0">
		    		<div class="control-group" style="margin-bottom: 30px;">
		    			<label class="control-label fs-18 lh-25 c-888" for="name">请叫我</label>
		    			<div class="controls fs-16 lh-18">
							<input id="name" class="validate[required,minSize[2]] input-xlarge" type="text" name="name" 
								data-prompt-position="centerRight:0,-4" value="${signInUser.name}" style="height: 25px;">
						</div>
		    		</div>
		    		<div class="control-group" style="margin-bottom: 30px;">
		    			<label class="control-label fs-18 lh-30 c-888" for="gender">我是</label>
		    			<div class="controls fs-16 lh-18">
		    				<input id="gender" class="validate[required]" type="hidden" 
		    					data-prompt-position="centerRight:0,-4" name="gender" value="${signInUser.gender}">
		    				<div class="btn-group" data-toggle="buttons-radio" data-toggle-name="gender">
		    					<button id="inputMale" class="btn btn-large btn-info fs-16" type="button" data-val="FEMALE">美女</button>
		    					<button id="gender_target" class="btn btn-large btn-info fs-16" type="button" data-val="MALE">帅哥</button>
		    				</div>
						</div>
		    		</div>
		    		<div class="control-group" style="margin-bottom: 30px;">
		    			<label class="control-label fs-18 lh-30 c-888" for="city">居住在</label>
		    			<div class="controls fs-16 lh-18">
		    				<input id="city" class="validate[required]" type="hidden" 
		    					data-prompt-position="centerRight:0,-4" name="city" placeholder="" value="${signInUser.city}">
		    				<div class="btn-group">
								<a id="city_target" class="btn btn-large dropdown-toggle fs-16" data-toggle="dropdown" href="#">
									<strong>未知</strong>
									<b class="caret"></b>
								</a>
								<jsp:include page="/WEB-INF/views/comp/city.picker.jsp">
									<jsp:param name="domId" value="setting-city-picker"/>
								</jsp:include>
							</div>
						</div>
		    		</div>
		    		<div class="control-group" style="margin-bottom: 30px;">
		    			<label class="control-label fs-18 lh-20 c-888" for="summary">我想说</label>
		    			<div class="controls fs-16 lh-18">
							<textarea id="summary" class="input-xlarge" type="text" name="summary" rows="3" >${signInUser.summary}</textarea>
						</div>
		    		</div>
		    		<div class="form-actions" style="margin-bottom: 0px;">
		    			<div class="dis-i">
						    <button type="submit" class="btn btn-large btn-primary" data-loading-text="更新中...">保存修改</button>
					    	<i class="icon-ok ml-10 dis-n"></i>
				    	</div>
				    </div>
		    	</form:form>
		    </div>
		    <div id="change-avatar" class="tab-pane fade">
		    	<c:url value="/setting/avatar" var="ua_url"/> 
		    	<form:form id="avatarForm" action="${ua_url}" method="post" class="form-horizontal mt-20 mb-0">
		    		<div class="form-actions" style="margin-bottom: 0px;">
		    			<div class="dis-i">
						    <button type="submit" class="btn btn-large btn-primary" data-loading-text="更新中...">保存修改</button>
					    	<i class="icon-ok ml-10 dis-n"></i>
				    	</div>
				    </div>
		    	</form:form>
		    </div>
		    <div id="change-pwd" class="tab-pane fade">
		    	<c:url value="/setting/changepwd" var="cp_url"/> 
		    	<form:form id="changePwdForm" action="${cp_url}" method="post" class="form-horizontal mt-20 mb-0">
		    		<div class="control-group" style="margin-bottom: 30px;">
		    			<label class="control-label fs-18 lh-25 c-888" for="inputOldPwd">旧密码</label>
		    			<div class="controls fs-16 lh-18">
							<input id="oldPwd" autocomplete="off" class="validate[required] input-xlarge" type="password" name="oldPwd" 
								data-prompt-position="centerRight:0,-4" value="" style="height: 25px;">
						</div>
		    		</div>
		    		<div class="control-group" style="margin-bottom: 30px;">
		    			<label class="control-label fs-18 lh-25 c-888" for="inputNewPwd">新密码</label>
		    			<div class="controls fs-16 lh-18">
							<input id="newPwd" autocomplete="off" class="validate[required,minSize[6],maxSize[30]] input-xlarge" type="password" name="newPwd" 
								data-prompt-position="centerRight:0,-4" value="" style="height: 25px;">
						</div>
		    		</div>
		    		<div class="control-group" style="margin-bottom: 30px;">
		    			<label class="control-label fs-18 lh-25 c-888" for="inputNewPwdRe">确认新密码</label>
		    			<div class="controls fs-16 lh-18">
							<input id="newPwdRe" autocomplete="off" class="validate[required,equals[newPwd]] input-xlarge" type="password" name="newPwdRe" 
								data-prompt-position="centerRight:0,-4" value="" style="height: 25px;">
						</div>
		    		</div>
		    		<div class="form-actions" style="margin-bottom: 0px;">
		    			<div class="dis-i">
						    <button type="submit" class="btn btn-large btn-primary" data-loading-text="更新中...">保存修改</button>
					    	<i class="icon-ok ml-10 dis-n"></i>
				    	</div>
				    </div>
		    	</form:form>
		    </div>
		    <div id="binding-weibo" class="tab-pane fade">
		    	<c:url value="/setting/binding" var="bw_url"/> 
		    	<form:form id="bindingForm" action="${bw_url}" method="post" class="form-horizontal mt-10">
		    		<div class="control-group" style="margin-bottom: 20px;">
		    			<!-- <label class="control-label fs-18 lh-25 c-888" for="inputName">新浪微博</label>-->
		    			<div class="controls fs-16 lh-18">
							<!-- <button class="btn btn-large btn-danger" data-toggle="button" type="button">绑定新浪微博</button>-->
							<a class="btn-3rd weibo" href="/oauth/weibo/signup/">
								<div class="logo_wrapper"><span class="logo"></span></div>
								<span>绑定微博帐号</span>
							</a>
						</div>
		    		</div>
		    		<div class="control-group" style="margin-bottom: 20px;">
		    			<!-- <label class="control-label fs-18 lh-25 c-888" for="inputName">腾讯QQ</label>  -->
		    			<div class="controls fs-16 lh-18">
							<!-- <button class="btn btn-large btn-info" data-toggle="button" type="button">绑定人人网</button> -->
							<a class="btn-3rd qq" href="/oauth/weibo/signup/">
								<div class="logo_wrapper"><span class="logo"></span></div>
								<span>绑定QQ帐号</span>
							</a>
						</div>
		    		</div>
		    		<div class="control-group" style="margin-bottom: 20px;">
		    			<!-- <label class="control-label fs-18 lh-25 c-888" for="inputName">豆瓣</label> -->
		    			<div class="controls fs-16 lh-18">
							<!-- <button class="btn btn-large btn-success" data-toggle="button" type="button">绑定豆瓣</button>-->
							<a class="btn-3rd douban" href="/oauth/weibo/signup/">
								<div class="logo_wrapper"><span class="logo"></span></div>
								<span>绑定豆瓣帐号</span>
							</a>
						</div>
		    		</div>
		    		<div class="control-group">
		    			<!-- <label class="control-label fs-18 lh-25 c-888" for="inputName">腾讯微博</label> -->
		    			<div class="controls fs-16 lh-18">
							<!-- <button class="btn btn-large btn-primary" data-toggle="button" type="button">绑定腾讯微博</button> -->
							<a class="btn-3rd renren" href="/oauth/weibo/signup/">
								<div class="logo_wrapper"><span class="logo"></span></div>
								<span>绑定人人帐号</span>
							</a>
						</div>
		    		</div>
		    	</form:form>
		    </div>
		</div>
	</div>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.8.18.custom.min.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.scrollTo.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/languages/zh-cn/jquery.validationEngine.lang.js" />" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.validationEngine.js" />" ></script>
<script type="text/javascript">
	$(function(){
		/*
		$('#basicInfoForm').ajaxForm({ 
	        dataType:  'json', 
	        beforeSubmit: function(formData, jqForm, options){
	        	$('#basicInfoForm .form-actions button').button('loading');
	        	$('#basicInfoForm .icon-ok').hide();
	        },
	        success:  function(data){
	        	if(!data || data.resultCode != 'SUCCESS' ) return;
	        	$('#basicInfoForm .icon-ok').css('display', 'inline-block');
	        },
	        complete: function(jqXHR, textStatus){
          		$('#basicInfoForm .form-actions button').button('reset')
          	}
	    });
		*/
		function attachValidationForBasicInfoForm(){
			$('#basicInfoForm').validationEngine({
				prettySelect: true,
				useSuffix: '_target',
				promptPosition: 'centerRight',
				autoPositionUpdate: true,
				ajaxFormValidation: true,
				ajaxFormValidationMethod: 'post',
				ajaxFormValidationURL: '<c:url value="/setting/basic/validate" />',
				onBeforeAjaxFormValidation: function(form, options){
					$(form).find('.form-actions button').button('loading');
					$('#basicInfoForm .icon-ok').hide();
				},
				onAjaxFormComplete: function(status, form, errors, options){
					$('#basicInfoForm .form-actions button').button('reset')
					if(status == true){
						form.validationEngine('detach');
						form.ajaxSubmit({
					        dataType:  'json', 
					        beforeSubmit: function(formData, jqForm, options){
					        	$('#basicInfoForm .form-actions button').button('loading');
					        	$('#basicInfoForm .icon-ok').hide();
					        },
					        success:  function(data){
					        	if(!data || data.resultCode != 'SUCCESS' ) return;
					        	$('#basicInfoForm .icon-ok').css('display', 'inline-block');
					        },
					        complete: function(jqXHR, textStatus){
				          		$('#basicInfoForm .form-actions button').button('reset');
				          		attachValidationForBasicInfoForm();
				          	}
					    });
					}
				}
			});
		}
		function attachValidationForChangPwdForm(){
			$('#changePwdForm').validationEngine({
				autoPositionUpdate: true,
				ajaxFormValidation: true,
				ajaxFormValidationMethod: 'post',
				ajaxFormValidationURL: '<c:url value="/setting/changepwd/validate" />',
				onBeforeAjaxFormValidation: function(form, options){
					$(form).find('.form-actions button').button('loading');
					$('#changePwdForm .icon-ok').hide();
				},
				onAjaxFormComplete: function(status, form, errors, options){
					$('#changePwdForm .form-actions button').button('reset')
					if(status == true){
						form.validationEngine('detach');
						form.ajaxSubmit({
					        dataType:  'json', 
					        beforeSubmit: function(formData, jqForm, options){
					        	$('#changePwdForm .form-actions button').button('loading');
					        	$('#changePwdForm .icon-ok').hide();
					        },
					        success:  function(data){
					        	if(!data || data.resultCode != 'SUCCESS' ) return;
					        	form.clearForm();
					        	$('#changePwdForm .icon-ok').css('display', 'inline-block');
					        },
					        complete: function(jqXHR, textStatus){
				          		$('#changePwdForm .form-actions button').button('reset');
				          		attachValidationForChangPwdForm();
				          	}
					    });
					}
				}
			});
		};
		attachValidationForBasicInfoForm();
		attachValidationForChangPwdForm();
		/*
		$('#changePwdForm').ajaxForm({
	        dataType:  'json', 
	        beforeSubmit: function(formData, jqForm, options){
	        	$('#changePwdForm .form-actions button').button('loading');
	        	$('#changePwdForm .icon-ok').hide();
	        },
	        success:  function(data){
	        	if(!data || data.resultCode != 'SUCCESS' ) return;
	        	$('#changePwdForm .icon-ok').css('display', 'inline-block');
	        },
	        complete: function(jqXHR, textStatus){
          		$('#changePwdForm .form-actions button').button('reset')
          	}
	    });
		*/
		$('div.btn-group[data-toggle-name=*]').each(function(){
		    var group   = $(this);
		    var form    = group.parents('form').eq(0);
		    var name    = group.attr('data-toggle-name');
		    var hidden  = $('input[name="' + name + '"]', form);
		    $('button', group).each(function(){
		    	var button = $(this);
		      	button.live('click', function(){
		        	hidden.val($(this).attr('data-val'));
		      	});
		      	if(button.attr('data-val') == hidden.val()) {
		     		button.addClass('active');
		    	}
		    });
		});
		var city = $('#city').val();
		if($.trim(city)){
			var targetCityElem = $('#setting-city-picker a[title='+city+']').addClass('active');
			$('#city_target strong').text(targetCityElem.text());
		}else{
			$('#city_target strong').text('-请选择-');
		}
		$('#setting-city-picker').bind('city-click', function(e, pinyin, label){
			$('#city').val(pinyin);
			$('#city').parent().find('.btn-group strong').text(label);
		});
		$('#setting-city-picker').parent().bind('dropdown-open', function(e){
			var pinyin = $('#city').val();
			$('#setting-city-picker').trigger('city-open', [pinyin]);
		});
	});
</script>
</body>
</html>