<#assign image = damfn.getAssetLink( content.image )! >

  <article class="component col-xs-12">
      <#if image?has_content >
          <div class="component__image" style="background-image: url(${ image! }); background-position: center ${ content.image_position!'center' };"></div>
      </#if >
      <p class="text--large">
          ${ cmsfn.decode(content).text! }
      </p>
  </article>
