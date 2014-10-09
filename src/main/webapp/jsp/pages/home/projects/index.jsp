<%@ taglib prefix="ws" tagdir="/WEB-INF/tags/ws" %>
<div id="meta" data-id-story="${story.id}"></div>
<div class="saving">
  <div class="alert alert-warning fade saving-alert">
    <span class="saving-text"></span>
  </div>
</div>
<div class="container">
  <ol class="breadcrumb breadcumb-clear toolbar">
    <li>
      <a href="${pageContext.request.contextPath}/home/projects">
        <span class="icon-draft"></span>
        Meus projetos
      </a>
    </li>
    <li class="active">
      ${story.title}
    </li>
  </ol>
</div>
<div class="container">
  <ul class="nav nav-tabs editor-tabs">
    <li class="active">
      <a href="${pageContext.request.contextPath}/home/projects/?id=${story.id}">
        História
      </a>
    </li>
    <li>
      <a href="${pageContext.request.contextPath}/home/projects/details?id=${story.id}">
        Detalhes
      </a>
    </li>
  </ul>
</div>
<div class="container editor">
  <div class="editor-title">
    <h1 class="editor-title-header">
      ${story.title}
    </h1>
  </div>
  <div class="row">
    <div class="col-sm-9 col-lg-10 editor-chapters">
      <ws:editor-chapter chapter="1">
        <ws:editor-section></ws:editor-section>
      </ws:editor-chapter>
    </div>
    <div class="col-sm-3 col-lg-2 hidden-xs">
      <div class="editor-chapter-thumbs" id="chapter-menu">
        <ul class="nav">
          <ws:editor-chapter-thumb chapter="1"/>
        </ul>
        <button class="btn btn-primary btn-block editor-chapter-thumb-add">
          Novo capítulo
        </button>
      </div>
    </div>
  </div>
</div>