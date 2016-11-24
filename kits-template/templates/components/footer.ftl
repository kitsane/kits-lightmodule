<#include "../common/helpers.ftl">

<footer class="container<#if cmsfn.page(content).background?has_content> ${ cmsfn.page(content).background }-bottom</#if>">
  <div class="component row">
    <div class="col-md-3 col-xs-12 space-small">
        ${ cmsfn.decode(content).contact_informations_left! }
    </div>
    <div class="offset-md-3 col-md-3 col-xs-12 space-small">
      ${ cmsfn.decode(content).contact_informations_right_middle! }
    </div>
    <div class="col-md-3 col-xs-12 space-small">
      ${ cmsfn.decode(content).contact_informations_right! }
    </div>
  </div>
</footer>
