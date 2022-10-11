<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ssi.jsp 공통코드--%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="net.utility.*"%>
<%@ page import="net.bbs.*"%>

<jsp:useBean id="dao" class="net.bbs.BbsDAO" scope="page"></jsp:useBean>    
<jsp:useBean id="dto" class="net.bbs.BbsDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>