<#assign image_1 = damfn.getAssetLink( content.image_1! )! >

<figure class="col-xs-6 col-md-3 space-small">
    <#if image_1?has_content >
        <div class="component__image component__image--portrait" style="background-image: url(${ image_1 });"></div>
    </#if >
    <p>
        ${ cmsfn.decode(content).text_1! }
    </p>
</figure>

<#assign image_2 = damfn.getAssetLink( content.image_2! )! >

<figure class="col-xs-6 col-md-3 space-small">
    <#if image_2?has_content >
        <div class="component__image component__image--portrait" style="background-image: url(${ image_2 });"></div>
    </#if >
    <p>
        ${ cmsfn.decode(content).text_2! }
    </p>
</figure>

<#assign image_3 = damfn.getAssetLink( content.image_3! )! >

<figure class="col-xs-6 col-md-3 space-small">
    <#if image_3?has_content >
        <div class="component__image component__image--portrait" style="background-image: url(${ image_3 });"></div>
    </#if >
    <p>
        ${ cmsfn.decode(content).text_3! }
    </p>
</figure>

<#assign image_4 = damfn.getAssetLink( content.image_4! )! >

<figure class="col-xs-6 col-md-3 space-small">
    <#if image_4?has_content >
        <div class="component__image component__image--portrait" style="background-image: url(${ image_4 });"></div>
    </#if >
    <p>
        ${ cmsfn.decode(content).text_4! }
    </p>
</figure>
