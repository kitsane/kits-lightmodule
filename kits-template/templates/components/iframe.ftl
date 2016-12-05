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

  <a href="${ link_by_path( content.linklink_target! ) }">
    ${ content.linklink_label! }
  </a>
</article>
