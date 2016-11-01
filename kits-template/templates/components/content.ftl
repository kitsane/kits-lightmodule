<#assign image = damfn.getAssetLink( content.image )! >

<article class="component component--full">
    <h1>
        ${ content.title! }
    </h1>
    <p class="text--large">
        ${ content.introduction! }
    </p>
    <#if image?has_content >
        <div class="component__image" style="background-image: url(${ image });"></div>
    </#if >
    <div class="text-columns">
        ${ cmsfn.decode(content).text! }
    </div>
</article>
