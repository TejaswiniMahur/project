<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Weather Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
        }

        input[type=text], input[type=date] {
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        #responseContainer {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Weather Data</h1>
        <form action="avgtemp" method="POST">
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required><br><br>
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="start_date" required><br><br>
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="end_date" required><br><br>
            <button type="submit">Get Average Temperature</button>
        </form>
        <div id="responseContainer">
            <%-- Response will be displayed here --%>
            <%
                String avgTemperature = request.getAttribute("averageTemperature") != null ? request.getAttribute("averageTemperature").toString() : "";
                if (!avgTemperature.isEmpty()) {
            %>
                <p>Average temperature between <%= request.getParameter("start_date") %> and <%= request.getParameter("end_date") %> is <%= avgTemperature %>°C</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
