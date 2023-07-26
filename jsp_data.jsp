                <html>
                    <head>
                        <title>
                            JSP DATA
                        </title>
                        <style>
                            table, th, td {
                              border: 2px solid black;
                              margin-left: 570px;
                              margin-top: 300px;
                              text-align: center;
                            }
                            body
                            {
                                background-color: rgb(133, 171, 159);
                            }
                        </style>
                        
                    </head>
                    <body>
                        <%@ page import = "java.sql.*" %>
                        <%@ page import="com.mysql.jdbc.Driver" %>


                        <%

                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lvm","root","admin");
                            String Reg_no = (String)session.getAttribute("username");
                            String Date = request.getParameter("Date");
                            String course[] = request.getParameterValues("course");
                            String no_of_period[] = request.getParameterValues("no_of_period");
                            String description[] = request.getParameterValues("description");
                            PreparedStatement ps = null;
                            int x  = 0;
                            for(int  i = 0;i<course.length;i++)
                            {
                            ps = conn.prepareStatement("insert into leave_data(reg_no,_data,course,no_of_periods,description) values(?,?,?,?,?)");
                            ps.setString(1,Reg_no);
                            ps.setString(2,Date);
                            ps.setString(3,course[i]);
                            ps.setString(4,no_of_period[i]);
                            ps.setString(5,description[i]);
                            x = ps.executeUpdate();
                            }
                            if(x>0)
                               out.print("data entry done successfully");
                            else
                              out.print("Error");
                            }
                            catch(Exception e)
                            {   
                                out.print(e);         
                            }
                            %>
                    </body>
                </html>






                