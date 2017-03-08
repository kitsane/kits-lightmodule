<article class="component component-slider col-xs-12">
    <#if content.images?has_content >
      <#if content.images?size gt 1>
        <#list cmsfn.children( content.images )>
          <div class="swiper-container swiper-container-normal">
            <div class="swiper-wrapper">
              <#items as item>
                <div class="swiper-slide" style="background-image: url(${ damfn.getAssetLink( item.image )! }); background-position: center ${ item.position }"></div>
              </#items>
            </div>

            <div class="swiper-pagination"></div>

            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          </div>
        </#list>
      <#else>
        <div class="component__image" style="background-image: url(${ damfn.getAssetLink( content.images?first )! });"></div>
      </#if >
    </#if >

    <p class="text--large">
      ${ cmsfn.decode(content).text! }
    </p>
  </article>
