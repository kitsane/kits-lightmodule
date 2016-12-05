<article class="component col-xs-12">
    <#if content.images?has_content >
      <#if content.images?size gt 1>
        <#list cmsfn.children( content.images )>
          <div class="swiper-container swiper-container-gallery">
            <div class="swiper-wrapper">
              <#items as item>
                <div class="swiper-slide">
                  <img src="${ damfn.getAssetLink( item.image )! }}">
                </div>
              </#items>
            </div>

            <div class="swiper-button-next swiper-button-white"></div>
            <div class="swiper-button-prev swiper-button-white"></div>
          </div>
        </#list>
        <#list cmsfn.children( content.images )>
          <div class="swiper-container swiper-container-gallery-thumbs">
            <div class="swiper-wrapper">
              <#items as item>
                <div class="swiper-slide" style="background-image: url(${ damfn.getAssetLink( item.image )! }); background-position: center ${ item.position }"></div>
              </#items>
            </div>
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
