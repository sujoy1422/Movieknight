<%@page import="com.cognizant.model.AdminModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cognizant.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Session validation for Movie operator  -->
<%
	if (session.getAttribute("type") == null) {
		response.sendRedirect("AdminLogin.jsp");
	}
%>
<!-- session validation ends -->
<jsp:include page="layout/Header.jsp" />
<jsp:include page="layout/AdminSidebar.jsp" />
<link href="assets/css/admin_homepage.css" rel="stylesheet" type="text/css"/>
<!-- ***********   START   *********** -->
<%
	ResultSet rs = null;
	AdminModel am = new AdminModel();
	am.setUserid(String.valueOf(session.getAttribute("userid")));
	rs = am.showAllBookings();
%>
<div id="main">
<div class="mymainWrapper col-lg-9 col-md-9 col-sm-9 col-xs-9">
	<div class="tableWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Total Bookings</div>
		<div class="tableContent col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table class="table table-bordered">
				<tr>
					<td>booking ID</td>
					<td>Movie Id</td>
					<td>Date</td>
					<td>Time</td>
				</tr>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
				</tr>
				<%
					}
					rs.close();
				%>
			</table>
		</div>
	</div>
</div>
                        </div>






