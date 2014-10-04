<%@ taglib prefix="ws" tagdir="/WEB-INF/tags/ws" %>
<ws:context-alert show="${saved}">
  Informações salvas!
</ws:context-alert>
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
    <li>
      <a href="${pageContext.request.contextPath}/home/projects/?id=${story.id}">
        História
      </a>
    </li>
    <li class="active">
      <a href="${pageContext.request.contextPath}/home/projects/details?id=${story.id}">
        Detalhes
      </a>
    </li>
  </ul>
</div>
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <label>
          Capa
        </label>
        <div class="thumbnail">
          <img id="details-cover" src="//placehold.it/800x300" alt="Imagem da capa">
        </div>
      </div>
      <div class="col-md-4">
        <form name="metaForm" action="${pageContext.request.contextPath}/home/projects/details/save" method="post">
          <input name="idStory" type="hidden" value="${story.id}">
          <div class="form-group">
            <label for="details-meta-title">
              Título
            </label>
            <input class="form-control" id="details-meta-title" name="title" type="text" value="${story.title}" required>
          </div>
          <div class="form-group">
            <label for="details-meta-summary">
              Resumo
            </label>
            <div class="remaining">
              <textarea class="form-control remaining-input details-meta-summary" id="details-meta-summary"
                        name="summary" data-rule-maxlength="140" type="text" required>${story.summary}</textarea>
              <div>
                <span class="remaining-chars">140</span>
                caracteres restantes
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="details-meta-synopsis">
              Sinopse
            </label>
            <textarea class="form-control remaining-input details-meta-synopsis" id="details-meta-synopsis"
                      name="synopsis" type="text" required>${story.synopsis}</textarea>
          </div>
          <div class="form-group">
            <button class="btn btn-primary btn-lg btn-block">Salvar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</form>