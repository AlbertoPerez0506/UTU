/* ============================================================
   js/app.js
   ------------------------------------------------------------
   Inicialización general del sitio:
     · Scroll Reveal con IntersectionObserver
     · Año dinámico en el footer
     · Fallback visual para imágenes no disponibles
     · Marca <html> como listo
   ============================================================ */

(function () {
    'use strict';

    /* --------------------------------------------------------
       Scroll Reveal
       -------------------------------------------------------- */
    function initReveal() {
        const targets = document.querySelectorAll('.reveal, [data-ratio]');
        if (!targets.length) return;

        const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

        // Sin soporte o con reduce-motion → mostrar todo de inmediato
        if (!('IntersectionObserver' in window) || reduceMotion) {
            targets.forEach(el => el.classList.add('is-visible'));
            return;
        }

        const observer = new IntersectionObserver((entries, obs) => {
            entries.forEach(entry => {
                if (!entry.isIntersecting) return;

                const el = entry.target;

                // Delay opcional definido por el autor en data-reveal-delay
                const delay = el.getAttribute('data-reveal-delay');
                if (delay && !el.style.getPropertyValue('--reveal-delay')) {
                    el.style.setProperty('--reveal-delay', `${delay}ms`);
                }

                el.classList.add('is-visible');
                obs.unobserve(el);
            });
        }, {
            rootMargin: '0px 0px -8% 0px',
            threshold: 0.12
        });

        targets.forEach(el => observer.observe(el));
    }

    /* --------------------------------------------------------
       Año dinámico
       -------------------------------------------------------- */
    function initYear() {
        const year = new Date().getFullYear();
        document.querySelectorAll('[data-year]').forEach(el => {
            el.textContent = year;
        });
    }

    /* --------------------------------------------------------
       Fallback de imágenes
       Si una imagen no carga, se marca el contenedor para
       mostrar el fondo definido en CSS sin romper la maquetación.
       -------------------------------------------------------- */
    function initImageFallback() {
        const images = document.querySelectorAll('img[data-img-fallback]');
        images.forEach(img => {
            img.addEventListener('error', () => {
                img.classList.add('img--missing');
                img.setAttribute('aria-label',
                    img.getAttribute('data-img-fallback') || 'Imagen no disponible');
            }, { once: true });
        });
    }

    /* --------------------------------------------------------
       Marca de listo
       -------------------------------------------------------- */
    function markReady() {
        document.documentElement.classList.add('is-ready');
    }

    /* --------------------------------------------------------
       Boot — se ejecuta después de componentes listos
       -------------------------------------------------------- */
    function boot() {
        initReveal();
        initYear();
        initImageFallback();
        markReady();
    }

    // Si el header/footer aún no se han montado (poco probable por orden
    // de <script defer>), esperamos al evento; si ya están, arrancamos.
    if (window.UTU && window.UTU.components) {
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', boot, { once: true });
        } else {
            boot();
        }
    } else {
        document.addEventListener('utu:components-ready', boot, { once: true });
    }
})();