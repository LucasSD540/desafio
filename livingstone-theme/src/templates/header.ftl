<@liferay.control_menu />
<header
  id="my-custom-header"
  style="
    <#if is_first_parent>
      position: absolute;
      box-shadow: none;
    <#else>
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      background-color: #fff;
      margin-bottom: 80px;
    </#if>
    z-index: 10;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 12px;
    transition: background-color 0.3s ease, color 0.3s ease;
    top: <#if theme_display.isSignedIn()>56<#else>0</#if>px;
    ">
  <div id="meu-header" style="
    width: 100%;
    max-width: 1248px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
  ">
    <div style="display: flex; align-items: center;" aria-level="1" role="meu-header">
      <a
        href="${site_default_url}"
        style="
          display: flex;
          align-items: center;
          text-decoration: none;
          color: #fff;
          transition: color 0.3s ease;
        ">
        <img
          src="${site_logo}"
          alt="${logo_description}"
          height="${site_logo_height}"
          width="${site_logo_width}"
          style="width: 48px; height: 48px; margin-right: 16px;" />
        <span style="font-size: 24px;">Livingstone Hotels & Resorts</span>
      </a>
    </div>
    <div style="display: flex; align-items: center; gap: 16px;">
      <a href="${site_default_url}/inicio/" style="font-size: 24px; <#if is_first_parent> color: #fff;<#else>color: #000;</#if> text-decoration: none;">Início</a>
      <a href="${site_default_url}/contato/" style="font-size: 24px; <#if is_first_parent> color: #fff;<#else>color: #000;</#if> text-decoration: none;">Reserve já</a>
      <a href="${site_default_url}/noticias/" style="font-size: 24px; <#if is_first_parent> color: #fff;<#else>color: #000;</#if> text-decoration: none;">Notícias</a>
        <#if !theme_display.isSignedIn()>
          <a class="text-btn" href="${theme_display.getURLSignIn()}"
            style="font-size: 24px; text-decoration: none; background-color: #b5833a; color: #fff; padding: 6px 12px; border-radius: 4px;">
            Entrar
          </a>
          <#else>
            <a class="text-btn" href="http://localhost:8080/c/portal/logout"
              style="font-size: 24px; text-decoration: none; background-color: #b5833a; color: #fff; padding: 6px 12px; border-radius: 4px;">
              Sair
            </a>
        </#if>
    </div>
  </div>
</header>
<script>
const header = document.querySelector('#my-custom-header');
window.addEventListener('scroll', function() {
  if (window.scrollY > 50) {
    header.style.backgroundColor = '#fff';
    header.style.boxShadow = '0 2px 5px rgba(0,0,0,0.1)';
    header.querySelectorAll('a').forEach(a => {
      a.style.color = '#000';
    });
    header.querySelector('span').style.color = '#000';
  } else {
    header.style.backgroundColor = 'transparent';
    header.style.boxShadow = 'none';
    header.querySelectorAll('a').forEach(a => {
      a.style.color = '#fff';
    });
    header.querySelector('span').style.color = '#fff';
  }
});
const textButton = document.querySelector("text-btn");
textButton.addEventListener('mouseenter', () => {
  textButton.style.color = '#fff'
});

document.querySelectorAll('#my-custom-header div a').forEach(a => {
  a.addEventListener('mouseenter', () => {
    a.style.color = '#b5833a';
  });
  a.addEventListener('mouseleave', () => {
    a.style.color = window.scrollY > 50 ? '#000' : '#fff';
  });
});
</script>