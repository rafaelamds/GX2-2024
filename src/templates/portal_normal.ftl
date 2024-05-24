<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key=" lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>
		${html_title}
	</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"]
		page=top_head_include />
</head>

<body class="${css_class}">
	<@liferay_ui["quick-access"]
		contentId="#main-content" />
	<@liferay_util["include"]
		page=body_top_include />
	<@liferay.control_menu />
	<div class="position-relative" id="wrapper">
		<header id="banner" role="banner">
			<div id="heading">
				<div aria-level="1" class="site-title" role="heading">
					<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments=" ${site_name}" key="go-to-x" />">
					<img class="logo-imagem" alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
					</a>
					<div class="autofit-col mr-2 user-icon-acess">
						<@liferay.user_personal_bar />
					</div>
					<#if show_site_name>
						<span class="site-name" title="<@liferay.language_format arguments=" ${site_name}" key="go-to-x" />">
						</span>
					</#if>
				</div>
			</div>
			<#if has_navigation && is_setup_complete>
				<#include "${full_templates_path}/navigation.ftl" />
			</#if>
		</header>
		<section id="content">
			<h2 class="hide-accessible sr-only" role="heading" aria-level="1">
				${htmlUtil.escape(the_title)}
			</h2>
			<#if selectable>
				<@liferay_util["include"]
					page=content_include />
				<#else>
					${portletDisplay.recycle()}
					${portletDisplay.setTitle(the_title)}
					<@liferay_theme["wrap-portlet"]
						page="portlet.ftl">
						<@liferay_util["include"]
							page=content_include />
						</@>
			</#if>
		</section>
		<footer class="footer-shiseido" id="footer" role="contentinfo">
			<p class="powered-by">
				Freque Grátis em qualquer compra. Amostras grátis e devoluções com todos os pedidos.
			</p><br>
			<p class="redes-sociais">Junte-se à Comunidade Shiseido</p>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<div class="nav_bar_redes" id="icone">
				<ul>
					<li><a target="_blank" href="https://www.facebook.com/ShiseidoUSA/"><span class="sr-only">Facebook</span><i
								class="fa fa-facebook" aria-hidden="true"></i></a></li>
					<li><a target="_blank" href="https://twitter.com/i/flow/login?redirect_after_login=%2FSHISEIDO_USA"><span
								class="sr-only">Twitter</span><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
					<li><a target="_blank" href="https://www.youtube.com/user/shiseido"><span class="sr-only">Youtube</span><i
								class="fa fa-youtube" aria-hidden="true"></i></a></li>
					<li><a target="_blank" href="https://www.instagram.com/shiseido/"><span class="sr-only">Instagram</span><i class="fa fa-instagram" aria-hidden="true"></a></i></li>
				</ul>
			</div>
		</footer>
	</div>
	<@liferay_util["include"]
		page=body_bottom_include />
	<@liferay_util["include"]
		page=bottom_include />
</body>

</html>