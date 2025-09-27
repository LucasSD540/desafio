<!DOCTYPE html>

<#include init />

<html
	class="${root_css_class}"
	dir="<@liferay.language key='lang.dir' />"
	lang="${w3c_language_id}"
>

	<head>
		<title>${is_first_parent?then(company_name, "${the_title} - ${company_name}")}</title>
		
		<meta content="initial-scale=1.0, width=device-width" name="viewport" />
		
		<@liferay_util["include"] page=top_head_include />
		
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-solid-straight/css/uicons-solid-straight.css'>
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
	</head>

	<body class="${css_class}">
		<@liferay_util["include"] page=body_top_include />
		
		<div id="wrapper" class="d-flex flex-column min-vh-100">
			<#include "${full_templates_path}/header.ftl" />
			
			<main class="d-flex flex-column flex-fill container-fluid" id="content">
				<#if selectable>
					<@liferay_util["include"] page=content_include />
				<#else>
					${portletDisplay.recycle()}
					
					${portletDisplay.setTitle(the_title)}
					
					<@liferay_theme["wrap-portlet"] page="portlet.ftl">
						<@liferay_util["include"] page=content_include />
					</@>
				</#if>
			</main>
			
			<#include "${full_templates_path}/footer.ftl" />
		</div>

		<@liferay_util["include"] page=body_bottom_include />
		<@liferay_util["include"] page=bottom_include />
		
		<script src="${htmlUtil.escape(portalUtil.getStaticResourceURL(request, '${javascript_folder}/main.js'))}"></script>
	</body>
</html>