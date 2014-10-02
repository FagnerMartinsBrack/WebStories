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
    <div class="col-sm-9 col-lg-10">
      <div class="editor-chapter-title">
        <h2 class="editor-chapter-title-header">
          Capítulo 1
          <small class="editor-chapter-title-header-name">
            &mdash; O feiticeiro e a dama de honra
          </small>
        </h2>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-9 col-lg-10">
      <div class="editor-chapter-content">
        <textarea class="form-control editor-chapter-text" rows="10"></textarea>
        <textarea class="form-control editor-chapter-text" rows="10"></textarea>
        <textarea class="form-control editor-chapter-text" rows="10"></textarea>
        <textarea class="form-control editor-chapter-text" rows="10"></textarea>
        <textarea class="form-control editor-chapter-text" rows="10"></textarea>
        <textarea class="form-control editor-chapter-text" rows="10"></textarea>
        <textarea class="form-control editor-chapter-text" rows="10"></textarea>
      </div>
      <div class="editor-chapter-content-add">
        <button class="btn btn-primary btn-block">
          <span class="icon-plus"></span>
        </button>
      </div>
    </div>
    <div class="col-sm-3 col-lg-2">
      <div class="editor-chapter-thumbs" data-spy="affix" data-offset-top="220">
        <button class="thumbnail editor-chapter-thumb">
          Capítulo 1
        </button>
        <button class="thumbnail editor-chapter-thumb">
          Capítulo 2
        </button>
        <button class="thumbnail editor-chapter-thumb">
          Capítulo 3
        </button>
      </div>
    </div>
  </div>
</div>