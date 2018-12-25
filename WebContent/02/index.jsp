<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
<%
	Date date = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String today = df.format(date);
%>


<div data-role="page">
  <div data-role="header">
    <h1>田氏物流发货统计</h1>
  </div>

  <div data-role="main" class="ui-content">
    <table border="3">
    	<tr>
    		<td><%= today %></td>
    		<td></td>
    	</tr>
    	<tr>
    		<td>yes</td>
    		<td>no</td>
    		<td>sorry</td>
    	</tr>    	
    </table>
  </div>

  <div data-role="footer">
    <h1>底部文本</h1>
  </div>
</div> 

</body>
</html>
