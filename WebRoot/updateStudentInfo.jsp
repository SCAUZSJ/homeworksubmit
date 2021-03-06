<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="Dao.ClassDao"%>
<%@ page import="Bean.Class"%>
<%@ page import="Dao.CollegeDao"%>
<%@ page import="Bean.College"%>
<%@ page import="Dao.StudentDao"%>
<%@ page import="Bean.Student"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<base href="<%=basePath%>">
		<!-- 最新 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="js/jquery.min.js"></script>

		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="js/bootstrap.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


		<title>修改学生信息</title>



	</head>
	<%
		String Id = (String) session.getAttribute("Id");
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.findStudent(Id);
	%>


	<body>
		<%@include file="nav.jsp"%>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>
					学生信息修改
				</h2>
				<hr />
				<div class="col-md-2"></div>
				<div class="col-md-9">
					<form class="form-horizontal" role="form"
						action="servlet/UpdateUserInfo" method="post">
						<input type="hidden" name="loginType" value="student" />
						<input type="hidden" name="Id" value="<%=Id%>" />
						<div class="form-group" align="left">
							<label for="inputEmail3" class="col-sm-2 control-label">
								姓名：
							</label>
							<div class="col-md-6">
								<input type="text" class="form-control" name="name"
									placeholder="Name" value=<%=student.getName()%> />
							</div>
							*必填
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">
								密码：
							</label>
							<div class="col-md-6">
								<input type="password" class="form-control" name="pwd"
									placeholder="Password" value="<%=student.getPwd()%>" />

							</div>
							*必填
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
								学院：
							</label>
							<div class="col-md-6">
								<select name='collegeId'>
									<%
										ArrayList<College> Colleges = new ArrayList<College>();
										CollegeDao Collegedao = new CollegeDao();
										Colleges = Collegedao.listAllColleges();
										for (int i = 0; i < Colleges.size(); ++i) {
											College cls = (College) Colleges.get(i);
									%>
									<option value='<%=cls.getCollegeId()%>' <%if (i == 0) {%>
										selected='true' <%}%>><%=cls.getCollegeName()%></option>

									<%
										}
									%>
								</select>

							</div>
							*必填
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
								专业班级：
							</label>
							<div class="col-md-6">
								<select name='classId'>
									<%
										ArrayList<Class> classes = new ArrayList<Class>();
										ClassDao classdao = new ClassDao();
										classes = classdao.listAllClasses();
										for (int i = 0; i < classes.size(); ++i) {
											Class cls = (Class) classes.get(i);
									%>
									<option value='<%=cls.getClassId()%>' <%if (i == 0) {%>
										selected='true' <%}%>><%=cls.getClassName()%></option>

									<%
										}
									%>
								</select>

							</div>
							*必填
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
								性别：
							</label>
							<div class="col-md-6">
								<select name="sex">
									<option value='1' selected='true'>
										男
									</option>
									<option value='2'>
										女
									</option>
								</select>

							</div>
							*必选
						</div>

						<br />
						<br />
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">
								提交
							</button>
						</div>
					</form>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>
	</body>
</html>
