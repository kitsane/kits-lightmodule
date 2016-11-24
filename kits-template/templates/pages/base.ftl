<#ftl>
<#assign current_page = cmsfn.page( content )! >
<#assign root_page = cmsfn.root( current_page, "mgnl:page" )!current_page! >

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

    <@cms.page />
  </head>

  <body<#if content.background?has_content> class="${ content.background }-top"</#if>>
    <header class="container">
      <div class="row">
        <div class="col-xs-12 col-md-2">
          <a href="${ cmsfn.link( root_page) }">
            <#if content.background == 'child'>
              <img src="${ ctx.contextPath }/.resources/kits-template/webresources/images/kits_kita_logo.svg" alt="brand" width="150" height="63">
            <#else>
              <img src="${ ctx.contextPath }/.resources/kits-template/webresources/images/kits_school_logo.svg" alt="brand" width="150" height="63">
            </#if>
          </a>
        </div>

        <div class="col-md-4">
          <div class="claim">
            <a href="#" class="hidden--tablet">
              Zweisprachige Tagesschule<br>
              Bilingual Dayschool
            </a>
          </div>
        </div>

        <div class="col-md-4">
          <div class="claim">
            <a href="#" class="hidden--tablet">
              Kindertagesstätte<br>
              Daycare Center
            </a>
          </div>
        </div>
      </div>
    </header>

    <#assign open_sub_page = current_page>

    <nav class="nav--bordered">
      <div class="container">
        <div class="row">
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
      </div>
    </nav>

    <nav class="nav--small">
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

    <#assign background = ''>
    <#if content.background?has_content>
      <#assign background = 'background--${ content.background! }'>
    </#if>

    <main role="main"<#if background?has_content> class="${ background }"</#if>>
      <section class="container">
        <div class="row">
          <@cms.area name="main" />
        </div>
      </section>
    </main>

    <@cms.area name="footer" />
  </body>
</html>
