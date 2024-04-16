<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Approve Request</title>
    <!-- Add your CSS and JavaScript links here -->
</head>
<body>
    <% 
        // Get the roll number from the request parameter
        String rollNo = request.getParameter("rollNo");

        try {
            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "System@123");
            Statement stmt = con.createStatement();

            // Update the is_approved field to 1 for the corresponding student record
            String updateQuery = "UPDATE student SET is_approved = 1 WHERE roll_no = ?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            ps.setString(1, rollNo);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Display a success message if the approval is successful
    %>
                <h1>Approval Successful</h1>
                <p>The registration request with Roll No <%= rollNo %> has been approved.</p>
    <%
            } else {
                // Display an error message if the approval fails
    %>
                <h1>Error</h1>
                <p>Failed to approve the registration request. Please try again later.</p>
    <%
            }

            // Close the connection
            ps.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <h1>Error</h1>
            <p>Failed to approve the registration request. Please try again later.</p>
    <%
        }
    %>
</body>
</html>
