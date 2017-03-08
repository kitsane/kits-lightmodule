<#ftl>
<#include "../common/helpers.ftl">

<#assign current_page = cmsfn.page( content )! >
<#assign root_page = cmsfn.root( current_page, "mgnl:page" )!current_page! >

<#assign template_style = content.background>
<#if template_style == 'none'>
  <#assign template_style = ''>
</#if>

<!doctype html>
<html lang="${ cmsfn.language() }">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="${ ctx.contextPath }/.resources/kits-template/webresources/images/favicon.png">

    <title>${ current_page.title!root_page.title!"" }</title>
    <meta name="description" content="${ current_page.meta_description!root_page.meta_description!"" }">

    <link href="${ ctx.contextPath }/.resources/kits-template/webresources/css/main.css" rel="stylesheet">
    <script src="${ ctx.contextPath }/.resources/kits-template/webresources/js/main.js"></script>

    <#if root_page.google_analytics_code?has_content && cmsfn.publicInstance>
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', '${ root_page.google_analytics_code }', 'auto');
            ga('send', 'pageview');
        </script>
    </#if>


    <@cms.page />
  </head>

  <body<#if template_style?has_content> class="${ template_style }-top"</#if>>
    <div class="flex-wrapper">
      <header class="container">
        <div class="row">
          <div class="col-xs-12 col-md-2">
            <a href="${ cmsfn.link( root_page) }">
              <#if template_style == 'child'>
                <img src="${ ctx.contextPath }/.resources/kits-template/webresources/images/kits_kita_logo.svg" alt="brand" width="150" height="63">
              <#else>
                <img src="${ ctx.contextPath }/.resources/kits-template/webresources/images/kits_school_logo.svg" alt="brand" width="150" height="63">
              </#if>
            </a>
          </div>

          <#if root_page.slogan_left?has_content>
            <div class="col-md-4 hidden--tablet">
              <div class="claim<#if template_style == "lined"> active</#if>">
                  <a href="${ link_by_path( root_page.slogan_left_link ) }" class="hidden--tablet">
                    ${ root_page.slogan_left }
                  </a>
              </div>
            </div>
          </#if>

          <#if root_page.slogan_right?has_content>
            <div class="col-md-4 hidden--tablet">
              <div class="claim<#if template_style == "child"> active</#if>">
                  <a href="${ link_by_path( root_page.slogan_right_link ) }" class="hidden--tablet green">
                    ${ root_page.slogan_right }
                  </a>
              </div>
            </div>
          </#if>
          <div class="col-md-2 hidden--tablet">
            <#assign localizedLinks = cmsfn.localizedLinks()! >
            <#if localizedLinks?has_content >
              <#assign languages = localizedLinks?keys >
              <ul class="language-switcher">
                <#list languages as language>
                  <li <#if cmsfn.isCurrentLocale(language)> class="nav--active"</#if>>
                    <a href="${ localizedLinks[ language ] }">
                      ${ language?upper_case }
                    </a>
                  </li>
                  <#sep>
                    <li>
                      /
                    </li>
                  </#sep>
                </#list>
              </ul>
            </#if>
          </div>
          <div class="visible--tablet">
            <button class="button__toggle">☰</button>
          </div>
        </div>
      </header>
    </div>

    <#assign open_sub_page = current_page>

    <div class="container">
      <nav class="nav--bordered">
        <div class="row hidden--tablet">
          <div class="col-xs-12">
            <#list cmsfn.children( root_page, 'mgnl:page' )>
              <ul>
                <#items as item >
                  <#if !item.hidden_in_navigation!false>
                    <#if cmsfn.children( item, 'mgnl:page' )?seq_contains(current_page)>
                        <#assign open_sub_page = item>
                    </#if>
                    <li>
                      <a href="${ cmsfn.link( item ) }"<#if item == current_page || cmsfn.children( item, 'mgnl:page' )?seq_contains(current_page)> class="nav--active"</#if>>${ item.title! }</a>
                    </li>
                  </#if>
                </#items >
              </ul>
            </#list >
          </div>
        </div>
      </nav>
    </div>

    <nav class="nav--small hidden--tablet">
      <div class="container">
        <div class="row">
          <div class="col-xs-12">
            <#if open_sub_page != root_page>
              <#list cmsfn.children( open_sub_page, 'mgnl:page' )>
                <ul>
                  <#items as item>
                    <#if !item.hidden_in_navigation!false>
                      <li>
                        <a href="${ cmsfn.link( item ) }"<#if item == current_page> class="nav--active"</#if>>${ item.title! }</a>
                      </li>
                    </#if>
                  </#items>
                </ul>
              </#list>
            </#if>
          </div>
        </div>
      </div>
    </nav>

    <div class="nav__mobile">
      <button class="button__toggle">×</button>
      <#list cmsfn.children( root_page, 'mgnl:page' )>
        <ul>
          <#items as item >
            <#if !item.hidden_in_navigation!false>
              <li>
                <a href="${ cmsfn.link( item ) }"<#if item == current_page> class="active"</#if>>${ item.title! }</a>
                <#if cmsfn.children(item)?has_content>
                  <#list cmsfn.children( item, 'mgnl:page' )>
                    <ul>
                      <#items as item >
                        <#if !item.hidden_in_navigation!false>
                          <li>
                            <a href="${ cmsfn.link( item ) }"<#if item == current_page> class="active"</#if>>${ item.title! }</a>
                          </li>
                        </#if>
                      </#items >
                    </ul>
                  </#list >
                </#if>
              </li>
            </#if>
          </#items >
        </ul>
      </#list >
      <#assign localizedLinks = cmsfn.localizedLinks()! >
      <#if localizedLinks?has_content >
        <#assign languages = localizedLinks?keys >
        <ul class="language-switcher">
          <#list languages as language>
            <li <#if cmsfn.isCurrentLocale(language)> class="nav--active"</#if>>
              <a href="${ localizedLinks[ language ] }">
                ${ language?upper_case }
              </a>
            </li>
            <#sep>
              <li>
                /
              </li>
            </#sep>
          </#list>
        </ul>
      </#if>
    </div>
    <main role="main"<#if template_style?has_content> class="background--${ template_style }"</#if>>
      <section class="container">
        <div class="row<#if cmsfn.editMode> row-block</#if>">
          <@cms.area name="main" />
        </div>
      </section>
    </main>

    <div class="container">
      <@cms.area name="footer" />
    </div>

  </body>
</html>
