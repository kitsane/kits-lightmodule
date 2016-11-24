<article class="component col-xs-12">
    <#if content.images?has_content >
      <#if content.images?size gt 1>
        <#list content.images>
          <div class="swiper-container">
            <div class="swiper-wrapper">
              <#items as image>
                <div class="swiper-slide" style="background-image: url(${ damfn.getAssetLink( image )! });"></div>
              </#items>
            </div>

            <div class="swiper-pagination"></div>
          </div>
        </#list>
      <#else>
        <div class="component__image" style="background-image: url(${ damfn.getAssetLink( content.images?first )! });"></div>
      </#if >
    </#if >

    <p class="text--large">
      ${ content.text! }
    </p>
  </article>
