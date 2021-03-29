<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create product</title>
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

            background-image: url("https://i.gifer.com/9zvR.gif");
            background-position: center center; /* Положение фона */
            background-repeat: no-repeat; /* Отменяем повторение фона */
        }


    </style>
</head>
<body>
<h3>New product</h3>
<form method="post">

    <label>Name</label><br>
    <input name="name"/><br><br>
    <label>Price(min 100$)</label><br>
    <input name="price" type="number" min="100"  /><br><br>
    <input type="submit" value="Save" />
</form>
</body>
</html>