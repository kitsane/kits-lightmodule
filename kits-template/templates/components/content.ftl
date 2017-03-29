<#assign template_style = cmsfn.page(content).background>
<#if template_style == 'none'>
  <#assign template_style = ''>
</#if>

<#assign image = damfn.getAssetLink( content.image, "full")! >

<article class="component col-xs-12">
      <h1<#if template_style == 'lined'> class="entry-title"</#if>>
          ${ content.title! }
      </h1>
      <p class="text--large">
          ${ content.introduction! }
      </p>
      <#if image?has_content >
          <div class="component__image" style="background-image: url(${ image! }); background-position: center ${ content.image_position!'center' };"></div>
      </#if >
      <div class="text-columns">
          ${ cmsfn.decode(content).text! }
      </div>
  </article>
