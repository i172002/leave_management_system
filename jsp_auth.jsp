<html>
    <head>
        <title>
            jsp_auth
        </title>
        
    </head>
    <body>
        <script type="text/javascript">
            function alertName(){
                 alert("Incorrect Username/Password");
         } 
           </script> 
        <%@ page import = "java.sql.*" %>
        <%@ page import="com.mysql.jdbc.Driver" %>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lvm","root","admin");
            String Query = "SELECT * FROM login_data WHERE username = ? and password = ?";
            PreparedStatement pstmt = conn.prepareStatement(Query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next() == false)
            {
                response.sendRedirect("login_error.jsp");  
            }
            else{
                session.setAttribute("username",username);  
                session.setAttribute("password",password);
                response.sendRedirect("jsp_home.jsp");  

            }
        }
        catch(Exception e)
        {

        }
        %>
    </body>
</html>