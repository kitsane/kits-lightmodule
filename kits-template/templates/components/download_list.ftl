<article class="component">
    <h1>
        ${ content.title! }
    </h1>
    <#if ( content.downloads )?has_content>
        <#list cmsfn.children( content.downloads )>
            <ul class="icon__list">
                <#items as download>
                    <li>
                        <a href="${ damfn.getAssetLink( download.download_target )! }">
                            <div class="icon__list--download"></div>
                            ${ download.download_label! }
                        </a>
                    </li>
                </#items>
            </ul>
        </#list>
    </#if>
</article>
