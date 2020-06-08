
<%@page import="file.FileDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="file.FileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP파일 업로드</title>
</head>
<body>
	<%
		ServletContext context = request.getServletContext();
		String directory = context.getRealPath("upload");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		FileDTO dto =  new FileDTO();	
		
		FileDAO dao = new FileDAO();
	
		MultipartRequest multipartRequest
		= new MultipartRequest(request,directory,maxSize,encoding,
				new DefaultFileRenamePolicy());
		int num = Integer.parseInt(multipartRequest.getParameter("num"));
		int pageNum = Integer.parseInt(multipartRequest.getParameter("pageNum"));
		String original = multipartRequest.getParameter("original");		
		
		String name = multipartRequest.getParameter("name");
		String pwd = multipartRequest.getParameter("pwd");
		String subject = multipartRequest.getParameter("subject");
		String content = multipartRequest.getParameter("content");
		
		dto.setNum(num);
		dto.setName(name);
		dto.setPwd(pwd);
		dto.setSubject(subject);
		dto.setContent(content);

	Enumeration fileNames = multipartRequest.getFileNames();
	while(fileNames.hasMoreElements()){
		
		String parameter = (String) fileNames.nextElement();
		String fileName = multipartRequest.getOriginalFileName(parameter);
		String fileRealName = multipartRequest.getFilesystemName(parameter);
		dto.setFileName(fileName);
		dto.setFileRealName(fileRealName);
		
		if(fileName == null) continue;
		
		if(!fileName.endsWith(".jpg") && !fileName.endsWith(".png") && 
				!fileName.endsWith(".pdf") && !fileName.endsWith(".hwp")){
			File file = new File(directory + fileRealName);
			file.delete();
%>

		<script>
		window.alert("저장할 수 없는 확장자입니다.");
		history.back();
		</script>
<% 
					
		}else{
			File file = new File(directory + original);
			file.delete();
			
			int check = new FileDAO().updateFileBoard(dto);
			if(check == 1){
%>
			<script>
				window.alert("수정 되었습니다.");
			</script>

<% 
			
			response.sendRedirect("fileBoard.jsp?pageNum=" + pageNum);

			}else{
				
			}
			%>
			<script>
						window.alert("틀린 비밀번호입니다.");
						history.back();
			</script>
			<%



		}
	}
	%>
</body>
</html>