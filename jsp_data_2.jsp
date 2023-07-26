        <html>
            <head>
                <title>
                    jsp_data_2
                </title>
                <style>
                    #leave_table{
                      border: 2px solid black;
                      margin-left: 200px;
                      margin-top: 300px;
                      text-align: center;
                    }
                    #leave_table th
                    {
                      border: 2px solid black;
                      margin-left: 200px;
                      margin-top: 300px;
                      text-align: center;
                    }
                    #leave_table td
                    {
                      border: 2px solid black;
                      margin-left: 200px;
                      margin-top: 300px;
                      text-align: center;
                    }
                    input[type = "submit"]
                    {
                                margin-left: 990px;
                                margin-top: -100px;
                    }

                    #percentage_table
                    {
                      border: 2px solid black;
                      margin-left: 700px;
                      margin-top: -130px;
                      text-align: center;
                    }

                    #percentage_table th
                    {
                        border: 2px solid black;
                    }

                    #percentage_table td
                    {
                        border: 2px solid black;
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
                    <%@ page import = "java.text.DecimalFormat" %>

                    <%

                        try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lvm","root","admin");
                                if(request.getParameter("get_leave")!=null)
                                {
                                    String username = (String)session.getAttribute("username");
                                    String Query = "SELECT * FROM leave_data WHERE reg_no = ?";
                                    PreparedStatement pstmt = conn.prepareStatement(Query);
                                    pstmt.setString(1, username);
                                    ResultSet rs = pstmt.executeQuery();
                                    if(rs.next() == false)
                                    {
                                        %>
                                            <h2>No data available</h2>
                                    <%
                                }
                                    
                                    else{
                                        %>
                                        <table id = "leave_table">
                                            <tr>
                                               <th>
                                                    Date
                                                </th>
                                                
                                                <th>
                                                    Course
                                                </th>
                                                
                                                <th>
                                                    No Of Periods
                                                </th>

                                                <th>
                                                    Description
                                                </th>
                                            </tr>
                                       <%  do{
                                            %>
                                            <tr>
                                                <td>
                                                  <%out.print(rs.getString("_data"));%>
                                                </td>

                                                <td>
                                                  <%out.print(rs.getString("course"));%>
                                                </td>

                                                <td>
                                                  <%out.print(rs.getString("no_of_periods"));%>
                                                </td>

                                                <td>
                                                  <%out.print(rs.getString("description"));%>
                                                </td>
                                         </tr> 
                                       <% }while(rs.next()); %>

                                     
                                       
                                     </table>

                                <%    
                                }
                                %>

                                <%
                                String Query2 = "SELECT * FROM course";
                                Statement stmt = conn.createStatement();
                                ResultSet rs2 = stmt.executeQuery(Query2);
                                
                                %>
                                   <table id = "percentage_table">
                                        <tr>

                                            <th>
                                                NAME
                                            </th>
                                           
                                            <th>
                                                COURSE CODE
                                            </th>

                                            <th>
                                                TOTAL HOURS
                                            </th>
                                            
                                            <th>
                                                TOTAL LEAVE
                                            </th>

                                            <th>
                                                PERCENTAGE
                                            </th>
                                        </tr>
                                        
                                        <%
                                        while(rs2.next())
                                        {
                                           String course_name = rs2.getString("course_name");
                                           String course_code = rs2.getString("course_code");
                                           int no_of_hours = rs2.getInt("no_of_hours");
                                        %>
                                        <tr>
                                            <td>
                                                <%out.print(course_name);%>
                                            </td>
                                            <td>    
                                                <%out.print(course_code);%>
                                            </td>
                                            <td>
                                                <%out.print(no_of_hours);%>
                                            </td>
                                            <td>
                                                <%
                                              
                                              String Query3 = "select sum(no_of_periods) from leave_data where course = ? and reg_no = ?";
                                              PreparedStatement pstmt2 = conn.prepareStatement(Query3);
                                              pstmt2.setString(1, course_code);
                                              pstmt2.setString(2,username);
                                              ResultSet rs3 = pstmt2.executeQuery();
                                              int leave_count;
                                               if(rs3.next() == false)
                                               {}
                                               do{
                                                leave_count = rs3.getInt(1);
                                                out.print(leave_count);

                                               }while(rs3.next());
                                                %>
                                            </td>
                                            <td>
                                                <%
                                                float percentage = ((float)(no_of_hours-(float)leave_count)/(float)no_of_hours)*100;
                                                DecimalFormat df = new DecimalFormat("#.##");

                                                out.print(df.format(percentage)+"%");
                                                %>
                                            </td>
                            
                                        </tr>

                                   

                            <%}%>
                                   </table>
                                <%}
                        }catch(Exception e)
                        {
                            out.print(e);
                        }
                        %>


                </body>
        </html>