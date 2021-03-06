<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="facebook" tagdir="/WEB-INF/tags/facebook" %>
<%@ taglib prefix="ws" tagdir="/WEB-INF/tags/ws" %>
<div id="fb-root"></div>
<ws:header/>
<div class="jumbotron index-banner">
  <div class="container index-banner-container">
    <h1>Web Stories</h1>
    <p class="index-banner-paragraph">
      Você tem o potencial para criar grandes histórias
    </p>
    <c:if test="${canPublish}">
      <p>
        <facebook:login className="btn btn-primary btn-lg" invite="${param.invite}" redirect="${pageContext.request.contextPath}/home/projects">
          Começar agora!
        </facebook:login>
      </p>
      <p class="index-banner-terms">
        Ao acessar o site você concorda com os
        <a href="${pageContext.request.contextPath}/terms">Termos e Condições</a>
      </p>
    </c:if>
    <c:if test="${!canPublish}">
      <p class="index-banner-closed">
        Web Stories atualmente está em um beta fechado.
        <br>
        <span class="index-banner-contact">
          <a href="http://eepurl.com/bhsXPH">Cadastre o seu e-mail abaixo para receber um convite</a>
        </span>
      </p>
    </c:if>
  </div>
</div>
<c:if test="${not empty featuredStories}">
  <div class="container index-stories-container">
    <div class="row">
      <c:forEach items="${featuredStories}" var="story">
        <div class="col-sm-4">
          <div class="thumbnail story-thumb">
            <div class="caption">
              <div class="media">
                <a class="pull-left" href="${story.author.profileURL}">
                  <img class="media-object" height="60" width="60" src="${story.author.avatarURL}" alt="(Avatar)">
                </a>
                <div class="media-body" title="${story.description}">
                  <a class="story-thumb-title" href="${pageContext.request.contextPath}/view/stories/?id=${story.id}">
                    ${story.title}
                  </a>
                  <p class="story-thumb-summary">
                    ${story.description}
                  </p>
                  <div class="story-thumb-author">
                    por <cite>${story.author.name.first}</cite>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</c:if>
<div class="container main-container">
  <div class="row">
    <div class="col-sm-6 col-md-8">
      <div class="row">
        <div class="col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
          <img class="mail-list-pointer" src="${pageContext.request.contextPath}/static/img/pointing-arrow.png" alt="">
          <form method="post" action="http://webstories.us10.list-manage.com/subscribe/post">
            <input type="hidden" name="u" value="62cb6a0352cc02c516d7c1e6d">
            <input type="hidden" name="id" value="7db64e74b2">
            <h3>Quer receber novidades?</h3>
            <div class="input-group">
              <input class="form-control" type="email" autocapitalize="off" autocorrect="off" name="MERGE0" placeholder="Digite o seu e-mail" required>
              <span class="input-group-btn">
                <button class="btn btn-default">Enviar</button>
              </span>
            </div>
          </form>
        </div>
      </div>
      <div class="quote">
        <hr>
        <blockquote class="quote-content">
          Acredite em si mesmo e descubra o por quê você faz o que faz, assim descobrirá o seu
          o potencial para fazer o que quiser.
          <span class="quote-tweet">
          	[<a target="_blank" href="http://ctt.ec/19O4f">Twitte isso</a>]
          </span>
        </blockquote>
        <hr>
      </div>
      <div class="text-center about">
        É o pensamento acima que sustenta Web Stories.<br>
        <a href="${pageContext.request.contextPath}/about">Clique para saber mais.</a>
      </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 text-center">
      <hr class="visible-xs">
      <div
        class="fb-page"
        data-href="http://facebook.com/webstories.org"
        data-width="500"
        data-small-header="true"
        data-show-facepile="true"
        data-show-posts="true"
      >
        <div class="fb-xfbml-parse-ignore">
          Veja Web Stories <a href="http://facebook.com/webstories.org">no Facebook</a> ...
        </div>
      </div>
    </div>
  </div>
</div>
