<#include "../common/helpers.ftl">
<#assign image = damfn.getAssetLink( content.image )! >

<article class="component col-xs-12 col-md-6">
        <#if image?has_content >
            <a href="${ image }" class="component__image--link" target="_blank">
              <img src="${ image }" class="component__image component__image--inline">
            </a>
        </#if >
      </article>

      <article class="component col-xs-12 col-md-6">
        <h1>
            ${ content.title! }
        </h1>
        <p>
            ${ content.text! }
        </p>

        <#if ( content.links )?has_content>
            <#list cmsfn.children( content.links )>
                <ul>
                    <#items as link>
                        <li>
                            <a href="${ link_by_path( link.link_target! ) }">
                                ${ link.link_label! }
                            </a>
                        </li>
                    </#items>
                </ul>
            </#list>
        </#if>
</article>
