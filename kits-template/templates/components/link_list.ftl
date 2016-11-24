<#include "../common/helpers.ftl">

  <article class="component col-xs-12 col-md-6">
      <h1>
          ${ content.title! }
      </h1>
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
