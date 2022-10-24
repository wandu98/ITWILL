<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 pdsUpdate.jsp -->
<h3>* 첨부게시판 수정 *</h3>
<p>
	<a href="pdsForm.jsp">[글쓰기]</a> &nbsp;&nbsp; <a href="pdsList.jsp">[글목록]</a>
</p>

<div class="container">
	<%
		int pdsno = Integer.parseInt(request.getParameter("pdsno"));//수정 글번호
		dto = dao.read(pdsno); //글번호가 일치하는 행을 가져오기
		if (dto == null) {
			out.println("해당 글 없음!!");
		} else {
	%>
	<form name="pdsfrm" id="pdsfrm" method="post"
		action="pdsUpdateProc.jsp" onsubmit="return pdsCheck()">
			<input type="hidden" name="pdsno" value="<%=pdsno%>">
			<table class="table">
				<tr>
					<th>이름</th>
					<td style="text-align: left"><input type="text" name="wname"
						id="wname" size="20" maxlength="100" required autofocus></td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="text-align: left"><textarea rows="5" cols="30"
							name="subject" id="subject" required autofocus></textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td style="text-align: left"><input type="password"
						name="passwd" id="passwd" required autofocus>&nbsp;숫자만
						입력하세요!</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td style="text-align: left"><input type="file"
						name="filename" id="filename"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="사진 올리기"
						class="btn btn-success"> <input type="reset" value="취소"
						class="btn btn-danger"></td>
				</tr>
			</table>
	</form>
	<%
		} //if end
	%>

</div>
<!--  본문끝 -->
<%@ include file="../footer.jsp"%>