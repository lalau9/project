<%@ page import="map.dto.Category" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String servletPath = request.getServletPath();
    int sliceIndex = servletPath.lastIndexOf("/");
    String fileName = servletPath.substring(sliceIndex);

    List<Category> categories = Arrays.asList(
            Category.of("/index.jsp", "국내"),
            Category.of("/clinic/clinic.jsp", "진료소"),
            Category.of("/vaccination_status/vaccination_status.jsp", "백신"),
            Category.of("/covid_status/distance.jsp", "거리두기")
    );
%>

<!-- w3 css -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- custom css -->
<link rel="stylesheet" href="/static/index.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="/static/index.js"></script>

<%
	boolean isLogin = (session != null && session.getAttribute("email") != null);
%>

<header class="card mb-4-2">
    <div class="menu-title">
        <h2 class="visible-hidden w24">
        </h2>
        <h2 class="dark--text text-weight-bold">
            Covid <span class="error--text">19</span>
        </h2>
        <h2>
        	<%
        		if (isLogin) {
        	%>
        			<button class="icon" type="button" onclick="modalOpen(true)">
		                <%@ include file="icon/mdi-menu.jsp" %>
		            </button>
        	<%
        		} else {
        	%>
        			<button class="icon" type="button" onclick="modalOpen(false)">
		                <%@ include file="icon/mdi-menu.jsp" %>
		            </button>
        	<%
        		}
        	%>
            
        </h2>
    </div>
    <div class="card-content pt-2 pb-1 text-weight-bold text-center">
        <%
            for (Category category : categories) {
                boolean isActivate = category.isActivate(fileName);
        %>
        <a class="text-decoration-none flex-1" href="<%= category.getServletPath()%>">
            <h4 class="card-content-item py-1 <%= isActivate ? "active" : "" %>">
                <span class="inline-block">
                    <%= category.getName() %>
                </span>
            </h4>
        </a>
        <%
            }
        %>
    </div>
</header>