<#include "../common/helpers.ftl">

<footer>
  <nav>
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
  </nav>
  <div class="component">
      ${ cmsfn.decode(content).contact_informations! }
  </div>
</footer>