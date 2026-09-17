/* ============================================================
   js/components.js
   ------------------------------------------------------------
   · Inyecta un SVG sprite con todos los iconos del sitio.
   · Monta cada [data-component="..."] con su HTML y su init().
   · Ajusta rutas relativas si la página está en /pages/**.
   · Emite el evento "utu:components-ready" al finalizar.
   ============================================================ */

(function () {
    'use strict';

    /* --------------------------------------------------------
       SVG Sprite — Todos los iconos usados en el sitio
       -------------------------------------------------------- */
    const SVG_SPRITE = `
<svg xmlns="http://www.w3.org/2000/svg"
     style="position:absolute;width:0;height:0;overflow:hidden"
     aria-hidden="true" focusable="false">

    <!-- Navegación -->
    <symbol id="i-menu" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M3 6h18M3 12h18M3 18h18"/>
    </symbol>
    <symbol id="i-close" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M18 6L6 18M6 6l12 12"/>
    </symbol>
    <symbol id="i-arrow-right" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M5 12h14M13 5l7 7-7 7"/>
    </symbol>

    <!-- Feature / pilares -->
    <symbol id="i-practice" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 2 3 7l9 5 9-5-9-5z"/>
        <path d="M3 12l9 5 9-5"/>
        <path d="M3 17l9 5 9-5"/>
    </symbol>
    <symbol id="i-theory" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M4 4h10a3 3 0 0 1 3 3v13H7a3 3 0 0 0-3 3V4z"/>
        <path d="M17 7a3 3 0 0 1 3 3v13"/>
    </symbol>
    <symbol id="i-link" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"/>
        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"/>
    </symbol>
    <symbol id="i-users" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
        <circle cx="9" cy="7" r="4"/>
        <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
        <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
    </symbol>
    <symbol id="i-certificate" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="8" r="6"/>
        <path d="M15.477 12.89 17 22l-5-3-5 3 1.523-9.11"/>
    </symbol>
    <symbol id="i-briefcase" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <rect x="2" y="7" width="20" height="14" rx="2"/>
        <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/>
    </symbol>
    <symbol id="i-check" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M20 6 9 17l-5-5"/>
    </symbol>
    <symbol id="i-snow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 2v20M2 12h20M4.93 4.93l14.14 14.14M19.07 4.93 4.93 19.07"/>
        <path d="m9 4 3 2 3-2M9 20l3-2 3 2M4 9l2 3-2 3M20 9l-2 3 2 3"/>
    </symbol>
    <symbol id="i-globe" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="12" r="10"/>
        <path d="M2 12h20"/>
        <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>
    </symbol>
    <symbol id="i-trophy" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M6 9H4a2 2 0 0 1-2-2V6h4"/>
        <path d="M18 9h2a2 2 0 0 0 2-2V6h-4"/>
        <path d="M6 6h12v5a6 6 0 0 1-12 0z"/>
        <path d="M9 21h6M12 17v4"/>
    </symbol>
    <symbol id="i-sparkle" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 3v4M12 17v4M3 12h4M17 12h4"/>
        <path d="m5.5 5.5 2.5 2.5M16 16l2.5 2.5M5.5 18.5 8 16M16 8l2.5-2.5"/>
        <circle cx="12" cy="12" r="2.5"/>
    </symbol>

    <!-- Redes sociales (fill) -->
    <symbol id="i-facebook" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/>
    </symbol>
    <symbol id="i-instagram" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <rect x="2" y="2" width="20" height="20" rx="5" ry="5"/>
        <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/>
        <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"/>
    </symbol>
    <symbol id="i-x" viewBox="0 0 24 24" fill="currentColor">
        <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
    </symbol>
    <symbol id="i-youtube" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z"/>
        <polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02"/>
    </symbol>

</svg>`.trim();

    /* --------------------------------------------------------
       Base del proyecto — se lee de <html data-base="...">
       Permite que el mismo header/footer funcione desde
       index.html (base "./") y desde pages/** (base "../../").
       -------------------------------------------------------- */
    function getBase() {
        const attr = document.documentElement.getAttribute('data-base');
        if (attr) return attr.endsWith('/') ? attr : attr + '/';
        return './';
    }

    /* Reescribe hrefs relativos que empiezan por "pages/" o "assets/"
       para que apunten a la base correcta desde subcarpetas. */
    function fixRelativePaths(root) {
        const base = getBase();
        if (base === './') return; // ya es la raíz

        root.querySelectorAll('[href], [src]').forEach(el => {
            ['href', 'src'].forEach(attr => {
                const value = el.getAttribute(attr);
                if (!value) return;
                if (
                    value.startsWith('pages/') ||
                    value.startsWith('assets/') ||
                    value.startsWith('css/')   ||
                    value.startsWith('js/')
                ) {
                    el.setAttribute(attr, base + value);
                }
            });
        });
    }

    /* --------------------------------------------------------
       Montaje de un componente
       -------------------------------------------------------- */
    function mountComponent(placeholder) {
        const name = placeholder.getAttribute('data-component');
        const component = window.UTU?.components?.[name];
        if (!component) {
            // Fallback silencioso: dejar el placeholder intacto
            console.warn(`[UTU] Componente "${name}" no encontrado.`);
            return;
        }

        // Contenedor temporal para parsear el HTML del componente
        const template = document.createElement('template');
        template.innerHTML = component.html().trim();

        // Ajustar rutas relativas antes de insertar en el DOM
        fixRelativePaths(template.content);

        // Reemplazar el placeholder
        placeholder.replaceWith(template.content);

        // init después de insertar
        if (typeof component.init === 'function') {
            try {
                component.init();
            } catch (err) {
                console.error(`[UTU] Error inicializando "${name}":`, err);
            }
        }
    }

    /* --------------------------------------------------------
       Boot
       -------------------------------------------------------- */
    function boot() {
        // 1. Inyectar el sprite de iconos (una sola vez)
        if (!document.getElementById('utu-svg-sprite')) {
            const sprite = document.createElement('div');
            sprite.id = 'utu-svg-sprite';
            sprite.setAttribute('aria-hidden', 'true');
            sprite.style.cssText = 'position:absolute;width:0;height:0;overflow:hidden';
            sprite.innerHTML = SVG_SPRITE;
            document.body.insertBefore(sprite, document.body.firstChild);
        }

        // 2. Montar todos los componentes presentes
        document.querySelectorAll('[data-component]').forEach(mountComponent);

        // 3. Notificar al resto del ecosistema
        document.dispatchEvent(new CustomEvent('utu:components-ready', { bubbles: true }));
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', boot, { once: true });
    } else {
        boot();
    }
})();