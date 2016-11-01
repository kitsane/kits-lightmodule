<article class="component component--full">
    <#if content.images?has_content >
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
    </#if >

    <p class="text--large">
        ${ content.text! }
    </p>
</article>
