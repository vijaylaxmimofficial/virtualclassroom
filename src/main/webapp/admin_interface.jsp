<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administrator Interface</title>
    <!-- Add your CSS and JavaScript links here -->
</head>
<body>
    <h1>Administrator Interface</h1>
    <table border="1">
        <tr>
            <th>Roll No</th>
            <th>Name</th>
            <th>Email</th>
            <th>Degree</th>
            <th>Course</th>
            <th>Year</th>
            <th>Action</th>
        </tr>
        <% 
            try {
                // Establish connection to the database
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "System@123");
                Statement stmt = con.createStatement();

                // Retrieve pending registration requests
                ResultSet rs = stmt.executeQuery("SELECT * FROM student WHERE is_approved = 0");

                // Loop through the results and display them in a table
                while (rs.next()) {
                    String rollNo = rs.getString("roll_no");
                    String name = rs.getString("name");
                    String email = rs.getString("email_id");
                    String degree = rs.getString("degree");
                    String course = rs.getString("course");
                    String year = rs.getString("year");

                    // Display each row of data
                    out.println("<tr>");
                    out.println("<td>" + rollNo + "</td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("<td>" + degree + "</td>");
                    out.println("<td>" + course + "</td>");
                    out.println("<td>" + year + "</td>");
                    out.println("<td><a href='approve_request.jsp?rollNo=" + rollNo + "'>Approve</a></td>");
                    out.println("</tr>");
                }

                // Close the connection
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
