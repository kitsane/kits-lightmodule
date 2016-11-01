<#function link_by_path element>
  <#assign link = ''>
  <#if element?has_content>
    <#assign link = cmsfn.link( cmsfn.contentByPath( element ) )>
  </#if>
  <#return link>
</#function>
