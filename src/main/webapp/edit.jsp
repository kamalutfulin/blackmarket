<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit product</title>
    <style>
        body {
            background: #000000; /* Цвет фона */
            color: #C0C0C0; /* Цвет текста */
        }
    </style>
    <style type="text/css">
        html {
            height: 100%;
        }

        body {

            background-image: url("https://media3.giphy.com/media/JSjiaBMFpyrQ66VfdP/giphy.gif?cid=ecf05e47o1bfto3k0kjl94cfbf346cbokhac8tv75j2lu2cp&rid=giphy.gif");
            background-position: center center; /* Положение фона */
            background-repeat: no-repeat; /* Отменяем повторение фона */
        }


    </style>
</head>
<body>
<h3>Edit product</h3>

<form method="post">
    <input type="hidden" value="<%= request.getParameter("id") %>" name="id"/>
    <label>Name</label><br>
    <input name="name" type="text"/><br><br>
    <label>Price (min 100$)</label><br>
    <input name="price" type="number" min="100"/><br><br>
    <input type="submit" value="Send"/>
</form>
</body>
</html>