 
/* ============================================================
   components/footer.js — Template y lógica del footer UTU
   ============================================================ */

(function () {
    'use strict';

    /* --------------------------------------------------------
       Grupos de enlaces del footer
       -------------------------------------------------------- */
    const GROUPS = [
        {
            title: 'Universidad',
            links: [
                { label: 'Bienvenida',        href: 'pages/universidad/bienvenida.html' },
                { label: 'Historia',          href: 'pages/universidad/historia.html' },
                { label: 'Misión y visión',   href: 'pages/universidad/mision-vision.html' },
                { label: 'Himno',             href: 'pages/identidad/himno.html' }
            ]
        },
        {
            title: 'Académico',
            links: [
                { label: 'Oferta educativa',    href: 'pages/oferta-educativa/index.html' },
                { label: 'Calendario escolar',  href: 'pages/servicios/calendario-escolar.html' },
                { label: 'Calificaciones',      href: 'pages/servicios/calificaciones.html' }
            ]
        },
        {
            title: 'Comunidad',
            links: [
                { label: 'Directorio',     href: 'pages/comunidad/directorio.html' },
                { label: 'Ubicación',      href: 'pages/comunidad/ubicacion.html' },
                { label: 'Paraescolares',  href: 'pages/comunidad/paraescolares.html' },
                { label: 'Proyectos',      href: 'pages/comunidad/proyectos.html' },
                { label: 'Quejas y sugerencias', href: 'pages/participacion/quejas-sugerencias.html' }
            ]
        }
    ];

    /* --------------------------------------------------------
       Redes sociales — TODO: sustituir por URLs oficiales
       -------------------------------------------------------- */
    const SOCIAL = [
        { icon: 'i-facebook',  label: 'Facebook de la UTU',  href: '#' },
        { icon: 'i-instagram', label: 'Instagram de la UTU', href: '#' },
        { icon: 'i-x',         label: 'X (Twitter) de la UTU', href: '#' },
        { icon: 'i-youtube',   label: 'YouTube de la UTU',   href: '#' }
    ];

    /* --------------------------------------------------------
       HTML del footer
       -------------------------------------------------------- */
    function renderFooter() {
        const groupsHTML = GROUPS.map(group => `
            <div class="site-footer__col">
                <h3 class="site-footer__title">${group.title}</h3>
                <ul class="site-footer__list">
                    ${group.links.map(link => `
                        <li>
                            <a class="site-footer__link" href="${link.href}">${link.label}</a>
                        </li>`).join('')}
                </ul>
            </div>`).join('');

        const socialHTML = SOCIAL.map(item => `
            <a class="site-footer__social-link"
               href="${item.href}"
               aria-label="${item.label}"
               rel="noopener">
                <svg aria-hidden="true"><use href="#${item.icon}"></use></svg>
            </a>`).join('');

        return `
<!-- ============================================================
     FOOTER INSTITUCIONAL UTU
     ============================================================ -->
<footer class="site-footer" role="contentinfo">
    <div class="container">

        <div class="site-footer__grid">

            <!-- Marca + dirección -->
            <div class="site-footer__brand">
                <img
                    class="site-footer__logo"
                    src="assets/images/branding/logo-utu.png"
                    alt="Universidad Tecnológica del Usumacinta"
                    width="2000" height="800"
                    loading="lazy"
                    decoding="async"
                    data-img-fallback="Logotipo UTU">

                <p class="site-footer__about">
                    Institución de educación superior pública en Emiliano Zapata, Tabasco.
                    Formación con orientación práctica, vinculación con el sector productivo
                    y dos estadías profesionales.
                </p>

                <address class="site-footer__address">
                    <strong>Dirección</strong>
                    Libramiento Glorieta Emiliano Zapata–Tenosique s/n<br>
                    Col. Las Lomas, C.P. 86980<br>
                    Emiliano Zapata, Tabasco, México
                </address>

                <div class="site-footer__social" aria-label="Redes sociales oficiales">
                    ${socialHTML}
                </div>
            </div>

            <!-- Columnas de enlaces -->
            ${groupsHTML}

            <!-- Contacto / accesos -->
            <div class="site-footer__col">
                <h3 class="site-footer__title">Contacto</h3>
                <p class="site-footer__about">
                    Teléfonos, correos y horarios oficiales se publicarán
                    conforme a la información institucional vigente.
                </p>
                <ul class="site-footer__list">
                    <li><a class="site-footer__link" href="pages/comunidad/ubicacion.html">Ubicación y mapa</a></li>
                    <li><a class="site-footer__link" href="pages/participacion/quejas-sugerencias.html">Buzón de quejas y sugerencias</a></li>
                </ul>
            </div>

        </div>

        <!-- Barra inferior -->
        <div class="site-footer__bottom">
            <p>
                © <span data-year>2026</span>
                Universidad Tecnológica del Usumacinta.
                Todos los derechos reservados.
            </p>
            <ul class="site-footer__legal">
                <!-- TODO: crear páginas legales cuando estén aprobadas -->
                <li><a href="#">Aviso de privacidad</a></li>
                <li><a href="#">Términos de uso</a></li>
            </ul>
        </div>

    </div>
</footer>`;
    }

    /* --------------------------------------------------------
       Init del footer (actualmente sin lógica propia;
       el año se actualiza desde js/app.js)
       -------------------------------------------------------- */
    function initFooter() {
        /* Espacio reservado para futuras interacciones del footer
           (por ejemplo, newsletter o selectores). */
    }

    /* --------------------------------------------------------
       Registro
       -------------------------------------------------------- */
    window.UTU = window.UTU || {};
    window.UTU.components = window.UTU.components || {};

    window.UTU.components.footer = {
        html: renderFooter,
        init: initFooter
    };
})();