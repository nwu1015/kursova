<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <title>Neko Sushi</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">

</head>
<body>

<%@include file="header.jspf"%>

<div class="content">
    <div class="text">
        <h1>
            <span class="highlight" style="text-decoration: underline; text-decoration-style: wavy;">すしん</span>
            <br/>
            a bowl of love from<br/>
            <span class="highlight">japanese cuisine</span><br/>
            for you
        </h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur dicta eos fugit incidunt nihil optio perferendis qui quod, repellat sapiente soluta tempora, veniam, voluptates! Asperiores commodi cum distinctio earum fuga mollitia perferendis saepe? Aliquam cumque delectus deleniti fugiat ipsum laborum, laudantium obcaecati officiis quae veritatis? Alias animi aperiam blanditiis culpa cum cupiditate deserunt laboriosam rerum sit sunt! At beatae dolores eos est facere facilis in iure iusto labore laborum modi nam natus nemo officia optio, pariatur perferendis praesentium quia quo repellat, repudiandae rerum vel. Aliquid aspernatur aut deserunt dolores eaque enim, ipsum maiores qui voluptatem voluptates! Facere neque optio sapiente?
        </p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum eveniet quaerat tempore? Cum dolorem dolorum earum fuga, incidunt soluta vero. Aspernatur beatae cupiditate dignissimos ea illum impedit incidunt, iure laboriosam minima, mollitia natus non pariatur perferendis quam quas ratione tempore. Accusamus aperiam dicta eaque error esse ex excepturi id, laudantium magnam nostrum omnis pariatur, quas qui quibusdam, quisquam rem sequi similique temporibus totam unde velit veritatis voluptatum! Ducimus eligendi eum facilis mollitia sapiente. A animi consectetur dolores esse illum, impedit iure laudantium molestiae nisi provident quas quia quisquam tempore unde voluptatum! Blanditiis earum nam necessitatibus placeat totam velit. Laborum, modi.</p>
        <button class="btn" onclick="scrollToMenu()">Order now</button>
    </div>
    <div class="main-picture">
        <img src="images/mainPic.png"  alt="bowl"/>
    </div>
</div>

<%@include file="menu.jspf"%>

<%@include file="footer.jspf"%>


</body>
</html>