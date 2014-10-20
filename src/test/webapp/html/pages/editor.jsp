<%@ taglib prefix="ws" tagdir="/WEB-INF/tags/ws" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Story Editor</title>
    <link rel="stylesheet" href="../../css/vendor/qunit.css">
    <script src="../../js/vendor/qunit.js"></script>
    <script>
      var require = {
        baseUrl: "../../../../main/webapp/static",
        test: true
      };
    </script>
    <script src="../../../../main/webapp/static/js/require.main.js"></script>
    <script src="../../../../main/webapp/static/js/require-2.1.15.js"></script>
  </head>
  <body>
    <div id="qunit"></div>
    <div id="qunit-fixture">
      <ws:editor-chapter chapter="1"/>
    </div>
    <script src="../../js/custom/editor.js"></script>
  </body>
</html>