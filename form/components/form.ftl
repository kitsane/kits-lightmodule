[#assign divIDPrefix = def.parameters.divIDPrefix!]
[#assign divClass = def.parameters.divClass!"form"]

[#if divIDPrefix?has_content]
    [#assign divID = ' id="${divIDPrefix}-${content.@id}"']
[/#if]

[#if actionResult == "go-to-first-page"]
    <div class="text">
        ${i18n.get("form.user.errorMessage.go-to-first-page", [cmsfn.link("website", model.view.firstPage)])}
    </div><!-- end text -->

[#elseif actionResult == "success"]
    <div class="text success">
        <h1>${model.view.successTitle!i18n['form.default.successTitle']}</h1>
        <p>${model.view.successMessage!}</p>
    </div><!-- end text success -->

[#elseif actionResult == "session-expired"]
    [#if content.formTitle?has_content]
        <h1>${content.formTitle}</h1>
    [/#if]

    <div class="text error">
        ${i18n.get("form.user.errorMessage.session-expired", [cmsfn.link("website", model.view.firstPage)])}
    </div><!-- end text error -->

[#elseif actionResult == "failure"]
    [#if content.formTitle?has_content]
        <h1>${content.formTitle}</h1>
    [/#if]

    <div class="text error">
        <ul>
            <li>${model.view.errorMessage}</li>
        </ul>
    </div><!-- end text error -->

[#else]

    [#if content.formTitle?has_content]
      <div class="col-xs-12">
        <h1>${content.formTitle}</h1>
      </div>
    [/#if]

    [#if content.formText?has_content]
      <div class="col-xs-12">
        ${cmsfn.decode(content).formText!}
      </div>
    [/#if]

    [#if model.view.validationErrors?size > 0]
      <div class="col-xs-12">

        <div id="formErrorsDisplay" class="text error">
            <h1>${model.view.errorTitle!i18n['form.default.errorTitle']}</h1>
            <ul>
                [#assign keys = model.view.validationErrors?keys]
                [#list keys as key]
                    <li>
                        <a href="#${key}_label">${model.view.validationErrors[key]!}</a>
                    </li>
                [/#list]
            </ul>
        </div><!-- end text error -->
      </div>
    [/#if]

        <form id="${content.formName?default("form0")}" method="post" action="" enctype="${def.parameters.formEnctype?default("multipart/form-data")}" >
            <div class="form-item-hidden">
                <input type="hidden" name="mgnlModelExecutionUUID" value="${content.@id}" />
                <input type="hidden" name="field" value="" />
                [#if model.formState?has_content]
                    <input type="hidden" name="mgnlFormToken" value="${model.formState.token!}" />
                [/#if]
            </div><!-- end form-item-hidden -->
            [#if cmsfn.editMode]
              <div class="row-block"
                [@cms.area name="fieldsets"/]
              </div>
            [#else]
              [@cms.area name="fieldsets"/]
            [/#if]
        </form>
[/#if]
