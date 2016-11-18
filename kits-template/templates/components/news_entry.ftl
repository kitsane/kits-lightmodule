<#include "../common/helpers.ftl">
<#assign image = damfn.getAssetLink( content.image )! >

<article class="component component--full m-b-l">
    <div class="component">
        <#if image?has_content >
            <a href="${ image }" class="component__image--link" target="_blank">
              <img src="${ image }" class="component__image component__image--inline">
            </a>
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
