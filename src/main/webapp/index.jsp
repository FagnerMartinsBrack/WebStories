<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="convention" uri="url-convention" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Web Stories</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <convention:include-head/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-3.2.0.css" media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.custom-0.1.1.css" media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/${build}/css/webstories.css" media="screen">
    <script>var require = { baseUrl: "${pageContext.request.contextPath}/static/${build}" };</script>
    <script src="${pageContext.request.contextPath}/static/${build}/js/require.main.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/require-2.1.15.js"></script>
  </head>
  <body>
    <convention:include-stylesheet/>
    <jsp:include page="/jsp/include/header.jsp"/>
    <div id="wrapper-default">
      <convention:include/>
    </div>
    <script>require( ["bootstrap"] );</script>
    <convention:include-script/>
  </body>
</html>