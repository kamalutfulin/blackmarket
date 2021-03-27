
<%@ page import="java.util.ArrayList" %>
<%@ page import="mysql.business.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Black Market</title>
    <style type="text/css">
        html {
            height: 100%; /* Высота страницы */
        }

        body {
            background-image: url("https://static10.tgstat.ru/channels/_0/1c/1cb26923bf64508ece9e2c0698c3c9a0.jpg"); /* Путь к фоновому рисунку */
            background-position: center bottom; /* Положение фона */
            background-repeat: no-repeat; /* Отменяем повторение фона */
        }
    </style>
</head>
<body>


<h2>Products List</h2>
<p><a href='<c:url value="/create" />'>Create new</a></p>
<table>


    <%

        ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("products");
        if (productList == null) {
            productList = new ArrayList<>();
        }
        System.out.println(productList.size());
        for (Product u : productList) {
    %>
    <tr>
        <td class="w3-center w3-text-black"><%= u.getId()%>
        </td>
        <td class="w3-center w3-text-black"><%= u.getName()%>
        </td>
        <td class="w3-center w3-text-black"><%= u.getPrice()%>
        </td>
        <td class="w3-center w3-text-black">
            <a href="edit?id=<%= u.getId()%>">
                <button>Edit</button>
            </a>
        </td>
        <td class="w3-center w3-text-black">
            <form method="post" action="delete">
                <input type="submit" value="Delete"/>
                <input type="hidden" name="id" value="<%= u.getId()%>"/>
            </form>
        </td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>