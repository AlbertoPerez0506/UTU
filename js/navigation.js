 
/* ============================================================
   js/navigation.js
   ------------------------------------------------------------
   Comportamientos de navegación global:
     · Estado del header (transparente sobre hero / sólido al scroll)
     · Enlace activo según la URL actual
     · Cierre del menú móvil al redimensionar (respaldo)
   ============================================================ */

(function () {
    'use strict';

    /* --------------------------------------------------------
       Estado del header
       -------------------------------------------------------- */
    function initHeaderState() {
        const header = document.querySelector('[data-header]');
        if (!header) return;

        // ¿La página tiene hero con overlay?
        const hasHero = !!document.querySelector('[data-header-overlay]');
        if (hasHero) header.classList.add('is-overlay');

        const SCROLL_THRESHOLD = 12;

        const apply = () => {
            const scrolled = window.scrollY > SCROLL_THRESHOLD;
            header.classList.toggle('is-scrolled', scrolled);
        };

        // Estado inicial y suscripción pasiva
        apply();
        window.addEventListener('scroll', apply, { passive: true });

        // Reaplicar al cambiar de tamaño (por si entra/sale de breakpoints)
        window.addEventListener('resize', apply, { passive: true });
    }

    /* --------------------------------------------------------
       Enlace activo
       -------------------------------------------------------- */
    function initActiveLinks() {
        const current = window.location.pathname.replace(/\/+$/, '') || '/';

        document.querySelectorAll('.nav__link, .mobile-menu__link').forEach(link => {
            const href = link.getAttribute('href');
            if (!href || href.startsWith('#') || href.startsWith('http')) return;

            let target;
            try {
                target = new URL(href, window.location.origin).pathname.replace(/\/+$/, '') || '/';
            } catch {
                return;
            }

            if (target === current) {
                link.classList.add('is-active');
                link.setAttribute('aria-current', 'page');
            }
        });
    }

    /* --------------------------------------------------------
       Respaldo: cerrar menú al pasar a desktop
       (el componente header ya lo maneja, pero por si acaso)
       -------------------------------------------------------- */
    function initResizeGuard() {
        const mq = window.matchMedia('(min-width: 1024px)');
        mq.addEventListener?.('change', (e) => {
            if (!e.matches) return;
            const menu = document.querySelector('[data-mobile-menu].is-open');
            if (menu) {
                menu.classList.remove('is-open');
                menu.setAttribute('aria-hidden', 'true');
                menu.setAttribute('inert', '');
                document.body.classList.remove('menu-open');
                const toggle = document.querySelector('[data-menu-toggle]');
                toggle?.setAttribute('aria-expanded', 'false');
            }
        });
    }

    /* --------------------------------------------------------
       Boot
       -------------------------------------------------------- */
    function boot() {
        initHeaderState();
        initActiveLinks();
        initResizeGuard();
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', boot, { once: true });
    } else {
        boot();
    }
})();