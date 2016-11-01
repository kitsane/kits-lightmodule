<#assign image = damfn.getAssetLink( content.image )! >
<article class="component component--full">
    <#if image?has_content >
        <div class="component__image" style="background-image: url(${ image });"></div>
    </#if >
    <p class="text--large">
        ${ content.text! }
    </p>
</article>
