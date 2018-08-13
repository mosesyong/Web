<%-- 
    Document   : newAnalytics
    Created on : 11 Aug 2018, 1:43:18 PM
    Author     : moses
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Temp analytics page</title>
    </head>
    <body>
        <h1>Temp analytics page</h1>
        <form method="get" action="AnalyticsWebServlet">
            Select type:<select name="analyticsType">
                <option value="sales">Sales Numbers</option>
                <option value="items">Item Numbers</option>
            </select><br>
            Select period<select name="period">
                <option value="day">day</option>
                <option value="week">week</option>
                <option value="month">month</option>
                <option value="year">year</option>
                <option value="all">all</option>
            </select><br>
            <input type="submit" value="submit">
        </form>
    </body>
</html>
