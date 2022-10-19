<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* e-mail 중복확인 *</h3>
		<form action="emailCheckProc.jsp" onsubmit="return emailCheck()">
			이메일 : <input type="email" name="email" id="email" maxlength="30"
				autofocus> <input type="submit" value="중복확인">
		</form>
	</div>

	<script>
		function email_check(email) {
			var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			return (email != '' && email != 'undefined' && regex.test(email));
		}//end email_check

		$("input[type=email]").blur(function() {
			var email = $(this).val();
			if (email == '' || email == 'undefined')
				return;
			if (!email_check(email)) {
				$(".result-email").text('이메일 형식으로 적어주세요');
				$(this).focus();
				return false;
			} else {
				$(".result-email").text('');
			}
			return true;
		});
	</script>
</body>
</html>