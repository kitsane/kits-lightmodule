<#include "../common/helpers.ftl">

<article class="component col-xs-12">
  <h1>
    ${ content.title! }
  </h1>

  <#if content.movie?has_content >
    <div class="component__iframe">
      <iframe src="${ content.movie }"></iframe>
    </div>
  </#if >
  <p>
    ${ content.text! }
  </p>
</article>
