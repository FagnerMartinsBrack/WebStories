<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/jsp/include/header.jsp"/>
<div class="container toolbar">
  <ol class="breadcrumb breadcumb-clear">
    <li class="active">
      <span class="icon-home"></span>
      Página inicial
    </li>
  </ol>
</div>
<div class="container">
  <div class="row">
    <div class="col-md-8 col-lg-9">
      <c:forEach items="${feedItems}" var="feed">
        <div class="media">
          <a class="pull-left" href="${feed.author.profileURL}">
            <img class="media-object img-circle" alt="Foto" src="${feed.author.avatarURL}">
          </a>
          <div class="media-body">
            <h4 class="media-heading">
              <a href="${feed.author.profileURL}">
                ${feed.author}
              </a>
            </h4>
            <div class="media-body">
              <c:if test="${feed.type == 'JOINED'}">
                <p>
                  Entrou em Web Stories
                </p>
              </c:if>
              <c:if test="${feed.type == 'NEW_STORY'}">
                Começou a escrever "${feed.content.storyTitle}, ${feed.content.storySummary}"
              </c:if>
              <c:if test="${feed.type == 'CHAPTER_PUBLISHED'}">
                <p>
                  Publicou um novo capítulo de "${feed.content.storyTitle}":
                </p>
                <p>
                  Capítulo ${feed.content.chapterPosition}:
                  <a href="${pageContext.request.contextPath}/view/stories/?id=${feed.content.storyId}#section-${feed.content.chapterPosition}-0">
                    ${feed.content.chapterTitle}
                  </a>
                </p>
              </c:if>
            </div>
            <div>
              <abbr class="text-muted">
                ${feed.date}
              </abbr>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
    <div class="hidden-xs hidden-sm col-md-4 col-lg-3">
      <div class="welcome-image-container">
        <img class="img-thumbnail img-circle"
             src="https://graph.facebook.com/276170692591315/picture?width=120" alt="Foto">
      </div>
      <h4>Olá!</h4>
      <div class="welcome-content">
        <p>
          Sou <strong>Fagner Brack</strong>, fundador do Web Stories.
        </p>
        <p>
          Parabéns por escolher participar dessa iniciativa inovadora!
        </p>
        <p>
          Atualmente estamos em um <strong>pré beta</strong>, ou seja, estamos preparando a
          plataforma para deixá-la online aberta apenas a convites.
        </p>
        <p>
          Se tiver qualquer dúvida ou sugestões, pode entrar em contato comigo diretamente pelo
          <a href="https://www.facebook.com/fagner.brack">Facebook</a> ou pelo e-mail
          <a href="mailto:webstories@fagnermartins.com">webstories@fagnermartins.com</a>.
        </p>
      </div>
    </div>
  </div>
</div>