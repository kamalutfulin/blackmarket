<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Black Market</title>
    <style type="text/css">
        html {
            height: 100%;
        }

        body {

            background-image: url("https://psv4.userapi.com/c536132/u366282592/docs/d26/bfb46c743261/glitch_2021-3-28_22-50-37.gif?extra=1NXZuO9XsB4evde3BufMCzL8PxFGlPNuifqNpVIqxaG_ZlGsjNUFTk-SsQTaRONoolvbjl4kvkm8WpX13E1bXCvLS1xliRCr9lPVD8zf3IgrzgLzLHJ6HuctpbFCYK6_CjzLiRU02PYSUc__D-LZ1jo");
            background-position: center bottom; /* Положение фона */
            background-repeat: no-repeat; /* Отменяем повторение фона */
        }


    </style>

</head>
<body>

<marquee direction="left"
         style="color: #D9470D; font-size: 40px; font-weight: bolder; line-height: 150%; text-shadow: #000000 0px 1px 1px;">
    Welcome to Black Market! The site is not responsible for the posted product. P.S. payment in bitcoins and dollars:)
</marquee>
<h2>Products List</h2>
<p><a href='<c:url value="/create" />'>Create product</a></p>
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
        <%--        <td class="w3-center w3-text-black"><%= u.getId()%>--%>
        <%--        </td>--%>
        <td class="w3-center w3-text-black"><%= u.getName()%>
        </td>
        <td class="w3-center w3-text-black"><%= u.getPrice()%>$
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

        <td class="w3-center w3-text-black">
            <p><img src="https://media3.giphy.com/media/3og0IKIiFKbrNa9IR2/giphy.gif" alt="Упс-с"
                    width="47" height="47" class="rightpic">
        </td>

    </tr>
    <%
        }
    %>
</table>
</body>
</html>