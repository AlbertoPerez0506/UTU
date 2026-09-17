 
/* ============================================================
   components/header.js — Template y lógica del header UTU
   ============================================================
   Este archivo expone en window.UTU.components.header:
     · html()  → string HTML (header + mobile menu)
     · init()  → activa la lógica del menú móvil
   Es consumido por js/components.js.
   ============================================================ */

(function () {
    'use strict';

    /* --------------------------------------------------------
       Rutas relativas preparadas para las páginas internas.
       Al reutilizar el header en /pages/**, js/components.js
       calcula la base correcta (ver atributo data-base en <html>).
       -------------------------------------------------------- */
    const NAV = [
        { label: 'Universidad',      href: 'pages/universidad/bienvenida.html' },
        { label: 'Identidad',        href: 'pages/identidad/himno.html' },
        { label: 'Oferta educativa', href: 'pages/oferta-educativa/index.html' },
        { label: 'Comunidad',        href: 'pages/comunidad/directorio.html' },
        { label: 'Servicios',        href: 'pages/servicios/calificaciones.html' },
        { label: 'Participación',    href: 'pages/participacion/quejas-sugerencias.html' }
    ];

    /* --------------------------------------------------------
       HTML — Header + Panel móvil
       -------------------------------------------------------- */
    function renderHeader() {
        const navItems = NAV.map(item => `
                <li>
                    <a class="nav__link" href="${item.href}">${item.label}</a>
                </li>`).join('');

        const navItemsMobile = NAV.map(item => `
                <li>
                    <a class="mobile-menu__link" href="${item.href}">${item.label}</a>
                </li>`).join('');

        return `
<!-- ============================================================
     HEADER INSTITUCIONAL UTU
     ============================================================ -->
<header class="site-header" data-header>
    <div class="site-header__inner">

        <!-- Logotipo (relación 5:2 conservada) -->
        <a class="site-header__brand" href="./" aria-label="Universidad Tecnológica del Usumacinta — Inicio">
            <img
                class="site-header__logo"
                src="assets/images/branding/logo-utu.png"
                alt="Universidad Tecnológica del Usumacinta"
                width="2000" height="800"
                decoding="async"
                data-img-fallback="Logotipo UTU">
        </a>

        <!-- Navegación de escritorio -->
        <nav class="site-header__nav" aria-label="Navegación principal">
            <ul class="nav__list">${navItems}
            </ul>
        </nav>

        <!-- Acciones (solo escritorio) -->
        <div class="site-header__actions">
            <a class="btn btn--primary btn--sm" href="pages/oferta-educativa/index.html">
                Únete Ya
            </a>
        </div>

        <!-- Botón hamburguesa (solo móvil / tablet) -->
        <button
            type="button"
            class="site-header__toggle"
            data-menu-toggle
            aria-expanded="false"
            aria-controls="mobile-menu"
            aria-label="Abrir menú de navegación">
            <svg class="icon" aria-hidden="true"><use href="#i-menu"></use></svg>
        </button>

    </div>
</header>

<!-- ============================================================
     MENÚ MÓVIL — Panel lateral deslizante
     ============================================================ -->
<div
    class="mobile-menu"
    id="mobile-menu"
    data-mobile-menu
    aria-hidden="true"
    role="dialog"
    aria-modal="true"
    aria-label="Menú de navegación principal">

    <div class="mobile-menu__backdrop" data-menu-close></div>

    <div class="mobile-menu__panel">

        <div class="mobile-menu__head">
            <img
                class="mobile-menu__logo"
                src="assets/images/branding/logo-utu.png"
                alt="Universidad Tecnológica del Usumacinta"
                width="2000" height="800"
                decoding="async">
            <button
                type="button"
                class="mobile-menu__close"
                data-menu-close
                aria-label="Cerrar menú">
                <svg class="icon" aria-hidden="true"><use href="#i-close"></use></svg>
            </button>
        </div>

        <nav class="mobile-menu__nav" aria-label="Navegación móvil">
            <ul>${navItemsMobile}
            </ul>
        </nav>

        <div class="mobile-menu__cta">
            <a class="btn btn--primary" href="pages/oferta-educativa/index.html">
                Únete Ya
                <svg class="icon btn__icon" aria-hidden="true"><use href="#i-arrow-right"></use></svg>
            </a>
        </div>

    </div>
</div>`;
    }

    /* --------------------------------------------------------
       Lógica del menú móvil
       -------------------------------------------------------- */
    function initMobileMenu() {
        const toggle = document.querySelector('[data-menu-toggle]');
        const menu   = document.querySelector('[data-mobile-menu]');
        if (!toggle || !menu) return;

        const closeTriggers = menu.querySelectorAll('[data-menu-close]');
        const menuLinks     = menu.querySelectorAll('a[href]');
        const FOCUSABLE     = 'a[href], button:not([disabled]), [tabindex]:not([tabindex="-1"])';

        let lastFocused = null;

        function open() {
            lastFocused = document.activeElement;
            menu.classList.add('is-open');
            menu.setAttribute('aria-hidden', 'false');
            menu.removeAttribute('inert');
            toggle.setAttribute('aria-expanded', 'true');
            document.body.classList.add('menu-open');

            const first = menu.querySelector(FOCUSABLE);
            if (first) {
                // Pequeño retraso para que la transición termine antes del focus
                window.setTimeout(() => first.focus({ preventScroll: true }), 80);
            }
        }

        function close() {
            menu.classList.remove('is-open');
            menu.setAttribute('aria-hidden', 'true');
            menu.setAttribute('inert', '');
            toggle.setAttribute('aria-expanded', 'false');
            document.body.classList.remove('menu-open');

            if (lastFocused && typeof lastFocused.focus === 'function') {
                lastFocused.focus({ preventScroll: true });
            } else {
                toggle.focus({ preventScroll: true });
            }
        }

        // Estado inicial: inerte cuando está cerrado
        if (!menu.classList.contains('is-open')) {
            menu.setAttribute('inert', '');
        }

        toggle.addEventListener('click', () => {
            menu.classList.contains('is-open') ? close() : open();
        });

        closeTriggers.forEach(el => el.addEventListener('click', close));
        menuLinks.forEach(el => el.addEventListener('click', close));

        // Escape + focus trap
        document.addEventListener('keydown', (event) => {
            if (!menu.classList.contains('is-open')) return;

            if (event.key === 'Escape') {
                event.preventDefault();
                close();
                return;
            }

            if (event.key !== 'Tab') return;

            const focusables = Array.from(menu.querySelectorAll(FOCUSABLE))
                .filter(el => el.offsetParent !== null);
            if (!focusables.length) return;

            const first = focusables[0];
            const last  = focusables[focusables.length - 1];

            if (event.shiftKey && document.activeElement === first) {
                event.preventDefault();
                last.focus();
            } else if (!event.shiftKey && document.activeElement === last) {
                event.preventDefault();
                first.focus();
            }
        });

        // Cerrar el menú si la ventana pasa a tamaño escritorio
        const mq = window.matchMedia('(min-width: 1024px)');
        const onBreakpoint = (e) => {
            if (e.matches && menu.classList.contains('is-open')) close();
        };
        mq.addEventListener?.('change', onBreakpoint);
    }

    /* --------------------------------------------------------
       Registro en el namespace global
       -------------------------------------------------------- */
    window.UTU = window.UTU || {};
    window.UTU.components = window.UTU.components || {};

    window.UTU.components.header = {
        html: renderHeader,
        init: initMobileMenu
    };
})();