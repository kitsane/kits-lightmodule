<#include "../common/helpers.ftl">

<article class="component col-xs-12">
  <h1>
    ${ content.title! }
  </h1>

  <#if content.iframe?has_content >
    <div class="component__iframe">
      <iframe src="${ content.iframe }"></iframe>
    </div>
  </#if >
  <p>
    ${ cmsfn.decode(content).text! }
  </p>
</article>
