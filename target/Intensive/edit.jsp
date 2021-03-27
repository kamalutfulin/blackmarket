<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit product</title>
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