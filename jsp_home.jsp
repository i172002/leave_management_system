<html>
   <head>
    <title>jsp_home</title>
    <link rel = "stylesheet" href = "./jsp_style.css">
   </head>

   <body>
    <%
    String username=(String)session.getAttribute("username");
    String password=(String)session.getAttribute("passowrd");%>
   
      <form action="logout.jsp">
        <input type="submit" value = "logout">
      </form>

    <form action="jsp_home_2.html" method="GET">
      <button id= "add_leave_data" >ADD LEAVE</button>  

    </form>

    <form action="jsp_data_2.jsp" method="GET">
      
      <button id="get_leave_data"  name="get_leave" value = 0>GET LEAVE DATA</button>  

    </form>
  </body>
</html>