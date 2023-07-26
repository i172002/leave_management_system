<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN</title>
        <link rel="stylesheet" href="./login_style.css">
        <script src = "./login_js.js" type="text/javascript"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
      <H1 id = "id_1">WELCOME TO THE LEAVE MANAGEMENT SYSTEM</H1>
      <h1 id  = "id_2">LOGIN</h1>
      
       <form id = "form_style" action = "jsp_auth.jsp" method="post">
            <!--span class = "label_style" >Username</span-->
            <input type = "text"  name = "username" placeholder = "Enter the Username" required maxlength= "20" id = "user_field"
            onkeypress="move_down(event,'password_field')" onfocus="user_focus(this);" onblur="user_blur(this);"><br><br>
    
        <!--span class = "label_style" >Email ID</span-->
            
         <!--span class = "label_style" >Email ID</span-->
            <input type = "password" placeholder="Password" name = "password" required id = "password_field" 
            style="-webkit-text-security: square;" onfocus="user_focus(this);" onblur="user_blur(this);" onkeypress="move_down(event,'submit_button')" /><br><br>
            
            <input type="submit" id = "submit_button" value="LOGIN" />
        </form>
    <p id = "auth_message"></p>
    </body>
</html>