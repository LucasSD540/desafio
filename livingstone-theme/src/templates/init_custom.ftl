<#--
  Este arquivo permite que você substitua e defina novas variáveis do FreeMarker.
-->

<#--  VARIÁVEIS GLOBAIS  -->
<#assign css_class = css_class + is_first_parent?then(' home-page',' internal-page') />
<#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "borderless"}) />
<#assign companyId = getterUtil.getLong(layout.companyId) />
<#assign groupId = getterUtil.getLong(layout.groupId) />
<#assign companyClassName = themeDisplay.getCompany().getModelClassName() />
<#assign companyClassPk = themeDisplay.getCompany().getCompanyId() />

<#--  VALORES DEFAULT -->
<#assign legal_name = "Procuradoria-Geral do Distrito Federal" />
<#assign address = ["SAM Bloco I Ed. Sede – Asa Norte/DF"] />
<#assign phones = ["(61) 3325-3318"] />

<#--  SUBSCREVENDO VALORES -->
<#if themeDisplay.getCompany().getLegalName()?has_content>
  <#assign legal_name = themeDisplay.getCompany().getLegalName() />
</#if>

<#if serviceLocator??>
  <#assign AddressLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.AddressLocalService") />
  <#assign PhoneLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.PhoneLocalService") />  
  <#assign EmailAddressLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.EmailAddressLocalService") />  

  <#assign addresses = AddressLocalService.getAddresses(companyId, companyClassName, companyClassPk) />
  <#assign phones = PhoneLocalService.getPhones(companyId, companyClassName, companyClassPk) />
  <#assign EmailAddress = EmailAddressLocalService.getEmailAddresses(companyId, companyClassName, companyClassPk) />

  <#if phones?has_content>
    <#assign phones = phones?map(item -> item.getNumber()) />
  </#if>    
</#if>