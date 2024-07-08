<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather APP</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="style.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        #weatherTable {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        #weatherTable th, #weatherTable td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        #weatherTable th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Weather Data</h1>
        <table id="weatherTable">
            <thead>
                <tr>
                    <th>Temperature</th>
                    <th>Humidity</th>
                    <th>Wind Speed</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="detail" items="${sessionScope.weatherDetails}">
                    <tr>
                        <td>${detail.temperature}</td>
                        <td>${detail.humidity}</td>
                        <td>${detail.windspeed}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>