<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "review.ReviewDAO" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="bean" class = "review.ReviewBean" />
<jsp:setProperty property = "*"  name = "bean" />
<%
	ReviewDAO dao = new ReviewDAO();
	dao.insertReview(bean);
	response.sendRedirect("review.jsp");
%>
<%
	String realFolder = "";
	String saveFolder = "images";	//사진을 저장할 경로
	String encType = "UTF-8";	//변환형식
	int fileSize = 1024*1024*10; //10MB로 파일 크기 제한
	
	ServletContext context = this.getServletContext();	//절대경로 얻기
	String uploadPath = context.getRealPath("saveFolder");	//savefolder 절대 경로를 얻음
	realFolder = uploadPath;
	
	MultipartRequest multi = null;
	
	//파일 업로드를 직접적으로 담당
	multi = new MultipartRequest(request, realFolder +"/"+ saveFolder, fileSize, encType, new DefaultFileRenamePolicy());
	
	String subject = multi.getParameter("subject");
	String uid = multi.getParameter("uid");
	String upass = multi.getParameter("upass");
	String content = multi.getParameter("content");
	String img = multi.getFilesystemName("img");
	
	bean.setSubject(subject);
	bean.setUid(uid);
	bean.setUpass(upass);
	bean.setContent(content);
	
	if(img != null){
		File oldFile = new File(realFolder+"/"+img);
		File newFile = new File(realFolder+"/"+(uid)+"사진.jpg");
		oldFile.renameTo(newFile);
	}
%>
</body>
</html>
