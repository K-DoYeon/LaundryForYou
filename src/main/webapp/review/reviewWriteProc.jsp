<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "review.ReviewDAO" %>
<%@ page import = "java.io.*, java.nio.file.Path, java.nio.file.Paths" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.Enumeration" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<jsp:useBean id="bean" class = "review.ReviewBean" />
<jsp:setProperty property = "*"  name = "bean" />
<%
	String uid = (String)session.getAttribute("uid");
	String upass = (String)session.getAttribute("upass");

	ReviewDAO dao = new ReviewDAO();
/* 	dao.insertReview(bean); */
	
	

	String realFolder = "";
   String saveFolder = "images";   //사진을 저장할 경로
   String encType = "utf-8";   //변환형식
   int maxSize = 3*680*680; //3MB로 파일 크기 제한
   
   ServletContext context = this.getServletContext();   //절대경로 얻기
   //realFolder = context.getRealPath(saveFolder);   //savefolder 절대 경로를 얻음
   realFolder = context.getRealPath("upload");
   System.out.print(realFolder);
   //파일 업로드를 직접적으로 담당
   MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());      
   
   String img = multi.getFilesystemName("img");
   String subject = multi.getParameter("subject");
   String realuid = multi.getParameter("uid");
   String realupass = multi.getParameter("upass");
   String content = multi.getParameter("content");
   int resnum = Integer.parseInt(multi.getParameter("resnum"));

	
	dao.insertReview(uid, upass, subject, content, img, resnum);
	
	
 /* 	if (!realuid.equals(bean.getUid())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해주세요 없습니다.')");
		script.println("location.href = '/main/login.jsp'");
		script.println("</script>");				
	} else {
				PrintWriter script = response.getWriter();
				if(img != null){
					String real = "";
					//String real = "C:\\Users\\choinuri\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Laundry\\imgs";
					File delFile = new File(real+"\\"+realuid+"사진.jpg");
					if(delFile.exists()){
						delFile.delete();
					}
					File oldFile = new File(realFolder+"\\"+img);
					File newFile = new File(realFolder+"\\"+realuid+"사진.jpg");
					oldFile.renameTo(newFile);
				}
				script.println("<script>");
				script.println("location.href= \'review.jsp?uid="+uid+"\'");
				script.println("</script>");
			} 
		 */
	
	response.sendRedirect("review.jsp");
	
%>  
</body>
</html>
