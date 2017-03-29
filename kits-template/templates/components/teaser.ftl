<#include "../common/helpers.ftl">

<#assign image = damfn.getAssetLink( content.image, "half" )! >

<article class="component col-xs-12 col-md-6">
  <h1>
    ${ content.title! }
  </h1>

  <#if image?has_content >
    <div class="component__image" style="background-image: url(${ image! }); background-position: center ${ content.image_position!'center' };"></div>
  </#if >
  <p>
    ${ cmsfn.decode(content).text! }
  </p>

  <a href="${ link_by_path( content.linklink_target! ) }">
    ${ content.linklink_label! }
  </a>
</article>
