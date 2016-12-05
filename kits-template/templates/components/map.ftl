<#include "../common/helpers.ftl">

<article class="component col-xs-12 col-md-4">
  <h1>
    ${ content.title! }
  </h1>

  <#if content.iframe?has_content >
    <div class="component__iframe">
      <iframe src="${ content.iframe }"></iframe>
    </div>
  </#if >
  <p>
    ${ content.text! }
  </p>
</article>