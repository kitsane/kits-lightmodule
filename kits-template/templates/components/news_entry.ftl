<#include "../common/helpers.ftl">
<#assign image = damfn.getAssetLink( content.image )! >

<article class="component component--full">
    <div class="component">
        <#if image?has_content >
            <div class="component__image" style="background-image: url(${ image });"></div>
        </#if >
    </div>
    <div class="component">
        <h1>
            ${ content.title! }
        </h1>
        <p>
            ${ content.text! }
        </p>

        <a href="${ link_by_path( content.link_target! ) }">
            ${ content.link_label! }
        </a>
    </div>
</article>
