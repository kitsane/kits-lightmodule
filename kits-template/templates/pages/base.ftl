<#ftl>
<#assign current_page = cmsfn.page( content )! >
<#assign root_page = cmsfn.root( current_page, "mgnl:page" )!current_page! >

<!doctype html>
<html lang="${ cmsfn.language() }">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <title>${ current_page.title!root_page.title!"" }</title>
    <meta name="description" content="${ current_page.meta_description!root_page.meta_description!"" }">

    <link href="${ ctx.contextPath }/.resources/kits-template/webresources/css/main.css" rel="stylesheet">
    <script src="${ ctx.contextPath }/.resources/kits-template/webresources/js/main.js"></script>

    <@cms.page />
  </head>
  <body>
    <header>
      <a href="${ cmsfn.link( root_page) }">
        <img src="${ ctx.contextPath }/.resources/kits-template/webresources/images/kits_school_logo.svg" alt="brand" width="150" height="63">
      </a>

      <a href="#" class="hidden--tablet">
        Zweisprachige Tagesschule<br>
        Bilingual Dayschool
      </a>

      <a href="#" class="hidden--tablet">
        Kindertagesstätte<br>
        Daycare Center
      </a>
    </header>

    <#assign open_sub_page = current_page>

    <nav class="nav--bordered">
      <#list cmsfn.children( root_page )>
        <ul>
          <#items as item >
            <#if cmsfn.children( item )?seq_contains(current_page)>
                <#assign open_sub_page = item>
            </#if>
            <li><a href="${ cmsfn.link( item ) }"<#if item == current_page || cmsfn.children( item )?seq_contains(current_page)> class="nav--active"</#if>>${ item.title! }</a></li>
          </#items >
        </ul>
      </#list >
    </nav>

    <nav class="nav--small">
        <#if open_sub_page != root_page>
            <#list cmsfn.children( open_sub_page )>
                <ul>
                    <#items as item>
                        <li><a href="${ cmsfn.link( item ) }"<#if item == current_page> class="nav--active"</#if>>${ item.title! }</a></li>
                    </#items>
                </ul>
            </#list>
        </#if>
    </nav>

    <main role="main">
        <section class="container<#if cmsfn.editMode> container-block</#if>">
            <@cms.area name="main" />
        </section>
    </main>

    <@cms.area name="footer" />
  </body>
</html>
