<#include "../common/helpers.ftl">

<#assign image = damfn.getAssetLink( content.image )! >
<article class="component">
    <h1>
        ${ content.title! }
    </h1>

    <#if image?has_content >
        <div class="component__image" style="background-image: url(${ image });"></div>
    </#if >
    <p>
        ${ content.text! }
    </p>

    <a href="${ link_by_path( content.linklink_target! ) }">
        ${ content.linklink_label! }
    </a>
</article>
