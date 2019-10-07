<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach items="${employeeList}" var="employee">
		${employee.emp_id } <br>
		${employee.join_dt } <br>
	</c:forEach>

