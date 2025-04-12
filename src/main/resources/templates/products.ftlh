<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <title>BUYSELL</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>BUYSELL</h1>-->
<#--<hr>-->
<#--<#if user.email??>-->
<#--    <h3>Имя пользователя: <i>${user.name}</i></h3>-->
<#--    <form action="/logout" method="post">-->
<#--        <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--        <input type="submit" value="Выйти"/>-->
<#--    </form>-->
<#--    <#if user.isAdmin()>-->
<#--        <a href="/admin">Панель администратора</a>-->
<#--    </#if>-->
<#--<#else>-->
<#--    <a href="/login">Войти</a></h1>-->
<#--</#if>-->
<#--<hr>-->
<#--<h4>Товары со всей России</h4>-->
<#--<form action="/" method="get">-->
<#--    Поиск по названию объявления: <input type="text" name="title">-->
<#--    <input type="submit" value="Поиск"/>-->
<#--</form>-->
<#--<#list products as product>-->
<#--    <div>-->
<#--        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>-->
<#--    </div>-->
<#--<#else>-->
<#--    <h3>Товаров нет</h3>-->
<#--</#list>-->
<#--<#if user.email??>-->
<#--    <hr>-->
<#--    <h3>Создать новый товар</h3>-->
<#--    <form action="/product/create" method="post" enctype="multipart/form-data">-->
<#--        Название объявления: <input type="text" name="title"/><br><br>-->
<#--        Описание объявления: <input type="text" name="description"/><br><br>-->
<#--        Цена: <input type="number" name="price"/><br><br>-->
<#--        Город: <input type="text" name="city"/><br><br>-->
<#--        Первая фотография: <input type="file" name="file1"/><br><br>-->
<#--        Вторая фотография: <input type="file" name="file2"/><br><br>-->
<#--        Третья фотография: <input type="file" name="file3"/><br><br>-->
<#--        <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--        <input type="submit" value="Добавить товар"/>-->
<#--    </form>-->
<#--</#if>-->
<#--</body>-->
<#--</html>-->

<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск товаров</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchCity">Город</label>
                <select id="searchCity" class="form-control">
                    <option value="">Город не выбран</option>
                    <option value="Москва">Москва</option>
                    <option value="Красноярск">Красноярск</option>
                    <option value="Казань">Казань</option>
                </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по объявлениям</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        ${product.city}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>