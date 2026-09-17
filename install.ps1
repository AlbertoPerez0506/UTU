# =============================================================
#  UTU — Generador de archivos base
#  Pega esto en PowerShell. Crea/sobrescribe 9 archivos.
# =============================================================

Set-Location -Path "C:\Users\ivana\Downloads\UTU"

function Save-Utf8NoBom {
    param([string]$Path, [string]$Text)
    $full = Join-Path (Get-Location).Path $Path
    $dir  = Split-Path -Parent $full
    if ($dir -and -not (Test-Path -LiteralPath $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    $enc = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($full, $Text, $enc)
    Write-Host "  OK  $Path" -ForegroundColor Green
}

# ================= index.html =================
Save-Utf8NoBom 'index.html' @'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Universidad Tecnológica del Usumacinta | Excelencia que transforma tu futuro</title>
    <meta name="description" content="Portal oficial de la Universidad Tecnológica del Usumacinta. Formación tecnológica de vanguardia con modelo 60/40, doble titulación y compromiso social y regional.">

    <!-- Open Graph -->
    <meta property="og:type" content="website">
    <meta property="og:title" content="Universidad Tecnológica del Usumacinta">
    <meta property="og:description" content="Excelencia que transforma tu futuro. Formación tecnológica de vanguardia con compromiso social y regional.">
    <meta property="og:locale" content="es_MX">

    <!-- Estilos (rutas absolutas desde la raíz del sitio) -->
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/variables.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/components/header.css">
    <link rel="stylesheet" href="/css/components/footer.css">

    <link rel="icon" type="image/svg+xml" href="/assets/logos/favicon.svg">
</head>
<body>

<!-- =============================================================
     HEADER  (contenido espejo de components/header.html)
     ============================================================= -->
<header class="site-header" data-header>
    <div class="site-header__inner">

        <!-- Brand -->
        <a href="/index.html" class="brand" aria-label="Universidad Tecnológica del Usumacinta — Inicio">
            <span class="brand__mark" aria-hidden="true">
                <svg viewBox="0 0 40 40" width="36" height="36" role="img">
                    <defs>
                        <linearGradient id="brandGrad" x1="0" y1="0" x2="1" y2="1">
                            <stop offset="0%"  stop-color="#30348C"/>
                            <stop offset="60%" stop-color="#303E8C"/>
                            <stop offset="100%" stop-color="#30BF97"/>
                        </linearGradient>
                    </defs>
                    <rect x="2" y="2" width="36" height="36" rx="11" fill="url(#brandGrad)"/>
                    <path d="M11 26 L20 12 L29 26 M14.5 22 H25.5"
                          fill="none" stroke="#FFFFFF" stroke-width="2.2"
                          stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </span>
            <span class="brand__text">
                <span class="brand__title">Universidad Tecnológica</span>
                <span class="brand__subtitle">del Usumacinta</span>
            </span>
        </a>

        <!-- Navegación principal -->
        <nav class="nav" aria-label="Navegación principal" data-nav>
            <ul class="nav__list">

                <!-- Universidad -->
                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Universidad</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/universidad/bienvenida.html" role="menuitem">Bienvenida</a></li>
                            <li><a href="/pages/universidad/historia.html" role="menuitem">Historia</a></li>
                            <li><a href="/pages/universidad/mision-vision.html" role="menuitem">Misión y Visión</a></li>
                        </ul>
                    </div>
                </li>

                <!-- Identidad -->
                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Identidad</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/identidad/himno.html" role="menuitem">Himno UTU</a></li>
                        </ul>
                    </div>
                </li>

                <!-- Oferta educativa -->
                <li class="nav__item">
                    <a href="/pages/oferta-educativa/index.html" class="nav__trigger nav__trigger--link">Oferta Educativa</a>
                </li>

                <!-- Comunidad -->
                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Comunidad</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/comunidad/directorio.html" role="menuitem">Directorio</a></li>
                            <li><a href="/pages/comunidad/ubicacion.html" role="menuitem">Ubicación</a></li>
                            <li><a href="/pages/comunidad/paraescolares.html" role="menuitem">Paraescolares</a></li>
                            <li><a href="/pages/comunidad/proyectos.html" role="menuitem">Proyectos</a></li>
                        </ul>
                    </div>
                </li>

                <!-- Servicios -->
                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Servicios</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/servicios/calificaciones.html" role="menuitem">Calificaciones</a></li>
                            <li><a href="/pages/servicios/calendario-escolar.html" role="menuitem">Calendario Escolar</a></li>
                        </ul>
                    </div>
                </li>

                <!-- Participación -->
                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Participación</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/participacion/quejas-sugerencias.html" role="menuitem">Quejas y Sugerencias</a></li>
                        </ul>
                    </div>
                </li>

            </ul>
        </nav>

        <!-- Acciones -->
        <div class="site-header__actions">
            <a href="/pages/servicios/calificaciones.html" class="btn btn--ghost btn--sm">Calificaciones</a>
            <a href="/pages/oferta-educativa/index.html" class="btn btn--primary btn--sm">Oferta Educativa</a>

            <button type="button" class="menu-toggle" aria-label="Abrir menú" aria-expanded="false" aria-controls="site-nav-mobile" data-menu-toggle>
                <span class="menu-toggle__bar"></span>
                <span class="menu-toggle__bar"></span>
            </button>
        </div>
    </div>
</header>

<main id="main">

    <!-- =========================================================
         HERO
         ========================================================= -->
    <section class="hero" aria-labelledby="hero-title">
        <div class="hero__bg" aria-hidden="true">
            <div class="hero__orb hero__orb--blue"></div>
            <div class="hero__orb hero__orb--green"></div>
            <div class="hero__grid"></div>
        </div>

        <div class="container hero__inner">
            <div class="hero__content">
                <span class="hero__eyebrow">
                    <span class="hero__eyebrow-dot" aria-hidden="true"></span>
                    Universidad Tecnológica del Usumacinta
                </span>

                <h1 class="hero__title" id="hero-title">
                    Excelencia que
                    <span class="hero__title-accent">transforma tu futuro</span>
                </h1>

                <p class="hero__subtitle">
                    Formación tecnológica de vanguardia con compromiso social y regional.
                </p>

                <div class="hero__actions">
                    <a href="/pages/oferta-educativa/index.html" class="btn btn--primary btn--lg">
                        Explora nuestras carreras
                        <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </a>
                    <a href="/pages/universidad/bienvenida.html" class="btn btn--outline btn--lg">
                        Conoce la universidad
                    </a>
                </div>

                <dl class="hero__stats" aria-label="Datos institucionales destacados">
                    <div class="hero__stat">
                        <dt>Modelo</dt>
                        <dd>60 / 40</dd>
                    </div>
                    <div class="hero__stat">
                        <dt>Duración</dt>
                        <dd>3 años 4 meses</dd>
                    </div>
                    <div class="hero__stat">
                        <dt>Titulación</dt>
                        <dd>Doble</dd>
                    </div>
                </dl>
            </div>
        </div>
    </section>

    <!-- =========================================================
         CARRUSEL — Espacio reservado
         ========================================================= -->
    <section class="carousel-space" aria-labelledby="carousel-space-title">
        <div class="container">
            <article class="carousel-space__frame">
                <header class="carousel-space__header">
                    <span class="carousel-space__badge">
                        <span class="carousel-space__badge-dot" aria-hidden="true"></span>
                        Espacio reservado
                    </span>
                    <h2 class="carousel-space__title" id="carousel-space-title">
                        Carrusel Institucional
                    </h2>
                    <p class="carousel-space__text">
                        Aquí se mostrarán noticias, eventos, convocatorias y banners destacados de la universidad.
                    </p>
                </header>

                <div class="carousel-space__placeholder" aria-hidden="true">
                    <div class="carousel-space__placeholder-glow"></div>
                    <div class="carousel-space__placeholder-lines">
                        <span></span><span></span><span></span>
                    </div>
                </div>

                <div class="carousel-space__indicators" aria-hidden="true">
                    <span class="is-active"></span><span></span><span></span><span></span>
                </div>
            </article>
        </div>
    </section>

    <!-- =========================================================
         BIENVENIDA
         ========================================================= -->
    <section class="section section--welcome" aria-labelledby="welcome-title">
        <div class="container">
            <div class="welcome">
                <div class="welcome__content reveal">
                    <span class="section-eyebrow">Bienvenida</span>
                    <h2 class="section-title" id="welcome-title">
                        Una universidad tecnológica con visión de futuro
                    </h2>
                    <p class="section-lead">
                        Formación tecnológica de vanguardia con compromiso social y regional.
                        Un modelo educativo único que prepara a nuestros estudiantes para
                        los retos del futuro profesional.
                    </p>

                    <!-- TODO: Insertar mensaje institucional de bienvenida oficial. -->
                    <p class="welcome__placeholder-note">
                        Contenido institucional de bienvenida pendiente de publicación.
                    </p>

                    <div class="welcome__actions">
                        <a href="/pages/universidad/bienvenida.html" class="btn btn--ghost">
                            Leer mensaje completo
                            <svg width="14" height="14" viewBox="0 0 16 16" aria-hidden="true"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                        </a>
                    </div>
                </div>

                <div class="welcome__media reveal">
                    <div class="media-frame media-frame--tall">
                        <div class="media-frame__glow"></div>
                        <!-- TODO: Insertar fotografía institucional de la universidad. -->
                        <div class="media-frame__empty">
                            <span class="media-frame__empty-label">Imagen institucional</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =========================================================
         RECTOR — Sección reservada (no hay datos en el origen)
         ========================================================= -->
    <section class="section section--rector" aria-labelledby="rector-title">
        <div class="container">
            <article class="rector">
                <figure class="rector__media reveal">
                    <div class="media-frame media-frame--portrait">
                        <!-- TODO: Insertar fotografía oficial del Rector(a). -->
                        <div class="media-frame__empty">
                            <span class="media-frame__empty-label">Fotografía del Rector</span>
                        </div>
                    </div>
                </figure>

                <div class="rector__content reveal">
                    <span class="section-eyebrow">Mensaje del Rector</span>
                    <h2 class="section-title" id="rector-title">
                        Mensaje institucional
                    </h2>

                    <p class="rector__name" aria-label="Cargo pendiente de publicación">
                        <!-- TODO: Insertar nombre y cargo oficial del Rector(a). -->
                        Nombre del Rector(a)
                        <span class="rector__role">Rector(a) · Universidad Tecnológica del Usumacinta</span>
                    </p>

                    <p class="section-lead">
                        Este espacio está reservado para el mensaje oficial del Rector de la
                        Universidad Tecnológica del Usumacinta.
                    </p>
                </div>
            </article>
        </div>
    </section>

    <!-- =========================================================
         HISTORIA / IDENTIDAD
         ========================================================= -->
    <section class="section section--history" aria-labelledby="history-title">
        <div class="container">
            <header class="section-head reveal">
                <span class="section-eyebrow">Nuestra historia</span>
                <h2 class="section-title" id="history-title">
                    Identidad institucional
                </h2>
                <p class="section-lead">
                    Trayectoria, momentos y logros que han construido la identidad de la
                    Universidad Tecnológica del Usumacinta.
                </p>
            </header>

            <!-- Estado elegante: contenido pendiente de publicación -->
            <div class="section-empty reveal" role="status">
                <span class="section-empty__icon" aria-hidden="true">
                    <svg width="22" height="22" viewBox="0 0 24 24"><path d="M12 3v18M3 12h18" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/></svg>
                </span>
                <p class="section-empty__text">
                    Línea del tiempo institucional en preparación.
                </p>
            </div>
        </div>
    </section>

    <!-- =========================================================
         MISIÓN Y VISIÓN
         ========================================================= -->
    <section class="section section--mv" aria-labelledby="mv-title">
        <div class="container">
            <header class="section-head reveal">
                <span class="section-eyebrow">Lo que nos define</span>
                <h2 class="section-title" id="mv-title">Misión y Visión</h2>
            </header>

            <div class="mv-grid">
                <article class="mv-card reveal">
                    <span class="mv-card__label">Misión</span>
                    <h3 class="mv-card__title">Nuestra misión</h3>
                    <!-- TODO: Insertar misión institucional oficial. -->
                    <p class="mv-card__text">
                        Contenido institucional pendiente de publicación.
                    </p>
                </article>

                <article class="mv-card reveal">
                    <span class="mv-card__label mv-card__label--green">Visión</span>
                    <h3 class="mv-card__title">Nuestra visión</h3>
                    <!-- TODO: Insertar visión institucional oficial. -->
                    <p class="mv-card__text">
                        Contenido institucional pendiente de publicación.
                    </p>
                </article>
            </div>
        </div>
    </section>

    <!-- =========================================================
         DIFERENCIADORES — Contenido real del HTML fuente
         ========================================================= -->
    <section class="section section--why" aria-labelledby="why-title">
        <div class="container">
            <header class="section-head reveal">
                <span class="section-eyebrow">Ventajas competitivas</span>
                <h2 class="section-title" id="why-title">
                    ¿Por qué elegir <span class="text-accent">UT Usumacinta</span>?
                </h2>
                <p class="section-lead">
                    Un modelo educativo único que te prepara para los retos del futuro profesional.
                </p>
            </header>

            <div class="why-grid">
                <article class="why-card reveal">
                    <span class="why-card__number">01</span>
                    <h3 class="why-card__title">Modelo 60 / 40</h3>
                    <p class="why-card__text">
                        <strong>60% práctico — 40% teórico:</strong> aprendizaje basado en
                        competencias con énfasis en aplicación real desde el primer día.
                    </p>
                    <dl class="why-card__stats">
                        <div><dt>Retención</dt><dd>+80%</dd></div>
                        <div><dt>Eficiencia</dt><dd>2×</dd></div>
                    </dl>
                </article>

                <article class="why-card reveal">
                    <span class="why-card__number">02</span>
                    <h3 class="why-card__title">3 años + 4 meses</h3>
                    <p class="why-card__text">
                        <strong>Duración optimizada:</strong> formación intensiva que te permite
                        insertarte al mercado laboral rápidamente sin sacrificar calidad educativa.
                    </p>
                    <dl class="why-card__stats">
                        <div><dt>Meses total</dt><dd>40</dd></div>
                        <div><dt>Títulos</dt><dd>2</dd></div>
                    </dl>
                </article>

                <article class="why-card reveal">
                    <span class="why-card__number">03</span>
                    <h3 class="why-card__title">Doble titulación</h3>
                    <p class="why-card__text">
                        <strong>TSU + Ingeniería / Licenciatura:</strong> obtén dos títulos
                        oficiales que amplían tus oportunidades laborales y de crecimiento profesional.
                    </p>
                    <dl class="why-card__stats">
                        <div><dt>Reconocido</dt><dd>100%</dd></div>
                        <div><dt>Oportunidades</dt><dd>2×</dd></div>
                    </dl>
                </article>
            </div>
        </div>
    </section>

    <!-- =========================================================
         ACCESOS RÁPIDOS
         ========================================================= -->
    <section class="section section--access" aria-labelledby="access-title">
        <div class="container">
            <header class="section-head reveal">
                <span class="section-eyebrow">Accesos rápidos</span>
                <h2 class="section-title" id="access-title">
                    Explora el portal
                </h2>
                <p class="section-lead">
                    Accede directamente a las secciones más consultadas del portal institucional.
                </p>
            </header>

            <div class="access-grid">
                <a class="access-card reveal" href="/pages/comunidad/directorio.html">
                    <span class="access-card__icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" width="22" height="22"><path d="M4 6h16M4 12h16M4 18h10" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/></svg>
                    </span>
                    <span class="access-card__body">
                        <span class="access-card__title">Directorio</span>
                        <span class="access-card__text">Contactos y áreas institucionales</span>
                    </span>
                    <span class="access-card__arrow" aria-hidden="true">
                        <svg width="16" height="16" viewBox="0 0 16 16"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </span>
                </a>

                <a class="access-card reveal" href="/pages/comunidad/ubicacion.html">
                    <span class="access-card__icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" width="22" height="22"><path d="M12 21s7-6.2 7-11a7 7 0 1 0-14 0c0 4.8 7 11 7 11Z" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/><circle cx="12" cy="10" r="2.4" fill="none" stroke="currentColor" stroke-width="1.7"/></svg>
                    </span>
                    <span class="access-card__body">
                        <span class="access-card__title">Ubicación</span>
                        <span class="access-card__text">Cómo llegar al campus</span>
                    </span>
                    <span class="access-card__arrow" aria-hidden="true">
                        <svg width="16" height="16" viewBox="0 0 16 16"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </span>
                </a>

                <a class="access-card reveal" href="/pages/comunidad/paraescolares.html">
                    <span class="access-card__icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" width="22" height="22"><circle cx="9" cy="9" r="3" fill="none" stroke="currentColor" stroke-width="1.7"/><path d="M3 20c0-3 3-5 6-5s6 2 6 5M16 8.5a3 3 0 1 1 0 5.8M14 20c0-2.2 1.4-3.6 3-4.2" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/></svg>
                    </span>
                    <span class="access-card__body">
                        <span class="access-card__title">Paraescolares</span>
                        <span class="access-card__text">Actividades culturales y deportivas</span>
                    </span>
                    <span class="access-card__arrow" aria-hidden="true">
                        <svg width="16" height="16" viewBox="0 0 16 16"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </span>
                </a>

                <a class="access-card reveal" href="/pages/comunidad/proyectos.html">
                    <span class="access-card__icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" width="22" height="22"><path d="M4 7h7l1.5 2H20v9a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1Z" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/></svg>
                    </span>
                    <span class="access-card__body">
                        <span class="access-card__title">Proyectos</span>
                        <span class="access-card__text">Investigación y vinculación</span>
                    </span>
                    <span class="access-card__arrow" aria-hidden="true">
                        <svg width="16" height="16" viewBox="0 0 16 16"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </span>
                </a>

                <a class="access-card reveal" href="/pages/servicios/calificaciones.html">
                    <span class="access-card__icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" width="22" height="22"><path d="M5 4h11l3 3v13H5Z" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/><path d="M8 9h8M8 13h8M8 17h5" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/></svg>
                    </span>
                    <span class="access-card__body">
                        <span class="access-card__title">Calificaciones</span>
                        <span class="access-card__text">Consulta tu historial académico</span>
                    </span>
                    <span class="access-card__arrow" aria-hidden="true">
                        <svg width="16" height="16" viewBox="0 0 16 16"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </span>
                </a>

                <a class="access-card reveal" href="/pages/servicios/calendario-escolar.html">
                    <span class="access-card__icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" width="22" height="22"><rect x="4" y="5" width="16" height="15" rx="2" fill="none" stroke="currentColor" stroke-width="1.7"/><path d="M4 10h16M9 3v4M15 3v4" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/></svg>
                    </span>
                    <span class="access-card__body">
                        <span class="access-card__title">Calendario Escolar</span>
                        <span class="access-card__text">Fechas y periodos oficiales</span>
                    </span>
                    <span class="access-card__arrow" aria-hidden="true">
                        <svg width="16" height="16" viewBox="0 0 16 16"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </span>
                </a>

                <a class="access-card reveal" href="/pages/participacion/quejas-sugerencias.html">
                    <span class="access-card__icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" width="22" height="22"><path d="M4 6a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H9l-5 4Z" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/></svg>
                    </span>
                    <span class="access-card__body">
                        <span class="access-card__title">Quejas y Sugerencias</span>
                        <span class="access-card__text">Canal oficial de participación</span>
                    </span>
                    <span class="access-card__arrow" aria-hidden="true">
                        <svg width="16" height="16" viewBox="0 0 16 16"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </span>
                </a>

                <a class="access-card reveal" href="/pages/identidad/himno.html">
                    <span class="access-card__icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" width="22" height="22"><path d="M9 18V6l10-2v12" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/><circle cx="7" cy="18" r="2.4" fill="none" stroke="currentColor" stroke-width="1.7"/><circle cx="17" cy="16" r="2.4" fill="none" stroke="currentColor" stroke-width="1.7"/></svg>
                    </span>
                    <span class="access-card__body">
                        <span class="access-card__title">Himno UTU</span>
                        <span class="access-card__text">Identidad y símbolos institucionales</span>
                    </span>
                    <span class="access-card__arrow" aria-hidden="true">
                        <svg width="16" height="16" viewBox="0 0 16 16"><path d="M3 8h10M9 4l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </span>
                </a>
            </div>
        </div>
    </section>

</main>

<!-- =============================================================
     FOOTER  (contenido espejo de components/footer.html)
     ============================================================= -->
<footer class="site-footer" aria-labelledby="footer-brand">
    <div class="container">
        <div class="site-footer__grid">

            <!-- Marca -->
            <div class="site-footer__brand">
                <a href="/index.html" class="brand brand--footer" aria-label="Universidad Tecnológica del Usumacinta — Inicio">
                    <span class="brand__mark" aria-hidden="true">
                        <svg viewBox="0 0 40 40" width="34" height="34" role="img">
                            <defs>
                                <linearGradient id="brandGradFooter" x1="0" y1="0" x2="1" y2="1">
                                    <stop offset="0%"  stop-color="#30BF97"/>
                                    <stop offset="60%" stop-color="#303E8C"/>
                                    <stop offset="100%" stop-color="#30348C"/>
                                </linearGradient>
                            </defs>
                            <rect x="2" y="2" width="36" height="36" rx="11" fill="url(#brandGradFooter)"/>
                            <path d="M11 26 L20 12 L29 26 M14.5 22 H25.5"
                                  fill="none" stroke="#FFFFFF" stroke-width="2.2"
                                  stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </span>
                    <span class="brand__text">
                        <span class="brand__title" id="footer-brand">Universidad Tecnológica</span>
                        <span class="brand__subtitle">del Usumacinta</span>
                    </span>
                </a>

                <p class="site-footer__tagline">
                    Excelencia que transforma tu futuro. Formación tecnológica de vanguardia
                    con compromiso social y regional.
                </p>
            </div>

            <!-- Universidad -->
            <nav class="site-footer__col" aria-label="Universidad">
                <h3 class="site-footer__heading">Universidad</h3>
                <ul class="site-footer__list">
                    <li><a href="/pages/universidad/bienvenida.html">Bienvenida</a></li>
                    <li><a href="/pages/universidad/historia.html">Historia</a></li>
                    <li><a href="/pages/universidad/mision-vision.html">Misión y Visión</a></li>
                    <li><a href="/pages/identidad/himno.html">Himno UTU</a></li>
                </ul>
            </nav>

            <!-- Comunidad -->
            <nav class="site-footer__col" aria-label="Comunidad">
                <h3 class="site-footer__heading">Comunidad</h3>
                <ul class="site-footer__list">
                    <li><a href="/pages/comunidad/directorio.html">Directorio</a></li>
                    <li><a href="/pages/comunidad/ubicacion.html">Ubicación</a></li>
                    <li><a href="/pages/comunidad/paraescolares.html">Paraescolares</a></li>
                    <li><a href="/pages/comunidad/proyectos.html">Proyectos</a></li>
                </ul>
            </nav>

            <!-- Servicios -->
            <nav class="site-footer__col" aria-label="Servicios">
                <h3 class="site-footer__heading">Servicios</h3>
                <ul class="site-footer__list">
                    <li><a href="/pages/servicios/calificaciones.html">Calificaciones</a></li>
                    <li><a href="/pages/servicios/calendario-escolar.html">Calendario Escolar</a></li>
                    <li><a href="/pages/participacion/quejas-sugerencias.html">Quejas y Sugerencias</a></li>
                    <li><a href="/pages/oferta-educativa/index.html">Oferta Educativa</a></li>
                </ul>
            </nav>

            <!-- Contacto — estructura reservada, no se inventa información -->
            <div class="site-footer__col site-footer__col--contact">
                <h3 class="site-footer__heading">Contacto</h3>
                <!-- TODO: Insertar dirección, teléfonos y correos institucionales oficiales. -->
                <ul class="site-footer__list site-footer__list--muted">
                    <li>Información de contacto institucional pendiente de publicación.</li>
                </ul>
            </div>
        </div>

        <div class="site-footer__bottom">
            <p class="site-footer__copy">
                © <span data-current-year>2026</span> Universidad Tecnológica del Usumacinta. Todos los derechos reservados.
            </p>
            <ul class="site-footer__legal">
                <li><a href="/pages/participacion/quejas-sugerencias.html">Quejas y Sugerencias</a></li>
                <li><a href="/pages/comunidad/directorio.html">Directorio</a></li>
            </ul>
        </div>
    </div>
</footer>

<script src="/js/app.js" defer></script>
</body>
</html>
'@

# ================= components/header.html =================
Save-Utf8NoBom 'components\header.html' @'
<!-- =============================================================
     HEADER INSTITUCIONAL — Universidad Tecnológica del Usumacinta
     Rutas absolutas desde la raíz del sitio.
     ============================================================= -->
<header class="site-header" data-header>
    <div class="site-header__inner">

        <!-- Brand -->
        <a href="/index.html" class="brand" aria-label="Universidad Tecnológica del Usumacinta — Inicio">
            <span class="brand__mark" aria-hidden="true">
                <svg viewBox="0 0 40 40" width="36" height="36" role="img">
                    <defs>
                        <linearGradient id="brandGrad" x1="0" y1="0" x2="1" y2="1">
                            <stop offset="0%"  stop-color="#30348C"/>
                            <stop offset="60%" stop-color="#303E8C"/>
                            <stop offset="100%" stop-color="#30BF97"/>
                        </linearGradient>
                    </defs>
                    <rect x="2" y="2" width="36" height="36" rx="11" fill="url(#brandGrad)"/>
                    <path d="M11 26 L20 12 L29 26 M14.5 22 H25.5"
                          fill="none" stroke="#FFFFFF" stroke-width="2.2"
                          stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </span>
            <span class="brand__text">
                <span class="brand__title">Universidad Tecnológica</span>
                <span class="brand__subtitle">del Usumacinta</span>
            </span>
        </a>

        <!-- Navegación principal -->
        <nav class="nav" aria-label="Navegación principal" data-nav>
            <ul class="nav__list">

                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Universidad</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/universidad/bienvenida.html" role="menuitem">Bienvenida</a></li>
                            <li><a href="/pages/universidad/historia.html" role="menuitem">Historia</a></li>
                            <li><a href="/pages/universidad/mision-vision.html" role="menuitem">Misión y Visión</a></li>
                        </ul>
                    </div>
                </li>

                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Identidad</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/identidad/himno.html" role="menuitem">Himno UTU</a></li>
                        </ul>
                    </div>
                </li>

                <li class="nav__item">
                    <a href="/pages/oferta-educativa/index.html" class="nav__trigger nav__trigger--link">Oferta Educativa</a>
                </li>

                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Comunidad</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/comunidad/directorio.html" role="menuitem">Directorio</a></li>
                            <li><a href="/pages/comunidad/ubicacion.html" role="menuitem">Ubicación</a></li>
                            <li><a href="/pages/comunidad/paraescolares.html" role="menuitem">Paraescolares</a></li>
                            <li><a href="/pages/comunidad/proyectos.html" role="menuitem">Proyectos</a></li>
                        </ul>
                    </div>
                </li>

                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Servicios</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/servicios/calificaciones.html" role="menuitem">Calificaciones</a></li>
                            <li><a href="/pages/servicios/calendario-escolar.html" role="menuitem">Calendario Escolar</a></li>
                        </ul>
                    </div>
                </li>

                <li class="nav__item" data-dropdown-item>
                    <button type="button" class="nav__trigger" aria-expanded="false" aria-haspopup="true" data-dropdown-trigger>
                        <span>Participación</span>
                        <svg class="nav__chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true"><path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="nav__panel" data-dropdown-panel role="menu">
                        <ul class="nav__panel-list">
                            <li><a href="/pages/participacion/quejas-sugerencias.html" role="menuitem">Quejas y Sugerencias</a></li>
                        </ul>
                    </div>
                </li>

            </ul>
        </nav>

        <!-- Acciones -->
        <div class="site-header__actions">
            <a href="/pages/servicios/calificaciones.html" class="btn btn--ghost btn--sm">Calificaciones</a>
            <a href="/pages/oferta-educativa/index.html" class="btn btn--primary btn--sm">Oferta Educativa</a>

            <button type="button" class="menu-toggle" aria-label="Abrir menú" aria-expanded="false" aria-controls="site-nav-mobile" data-menu-toggle>
                <span class="menu-toggle__bar"></span>
                <span class="menu-toggle__bar"></span>
            </button>
        </div>
    </div>
</header>
'@

# ================= components/footer.html =================
Save-Utf8NoBom 'components\footer.html' @'
<!-- =============================================================
     FOOTER INSTITUCIONAL — Universidad Tecnológica del Usumacinta
     Rutas absolutas desde la raíz del sitio.
     ============================================================= -->
<footer class="site-footer" aria-labelledby="footer-brand">
    <div class="container">
        <div class="site-footer__grid">

            <div class="site-footer__brand">
                <a href="/index.html" class="brand brand--footer" aria-label="Universidad Tecnológica del Usumacinta — Inicio">
                    <span class="brand__mark" aria-hidden="true">
                        <svg viewBox="0 0 40 40" width="34" height="34" role="img">
                            <defs>
                                <linearGradient id="brandGradFooter" x1="0" y1="0" x2="1" y2="1">
                                    <stop offset="0%"  stop-color="#30BF97"/>
                                    <stop offset="60%" stop-color="#303E8C"/>
                                    <stop offset="100%" stop-color="#30348C"/>
                                </linearGradient>
                            </defs>
                            <rect x="2" y="2" width="36" height="36" rx="11" fill="url(#brandGradFooter)"/>
                            <path d="M11 26 L20 12 L29 26 M14.5 22 H25.5"
                                  fill="none" stroke="#FFFFFF" stroke-width="2.2"
                                  stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </span>
                    <span class="brand__text">
                        <span class="brand__title" id="footer-brand">Universidad Tecnológica</span>
                        <span class="brand__subtitle">del Usumacinta</span>
                    </span>
                </a>

                <p class="site-footer__tagline">
                    Excelencia que transforma tu futuro. Formación tecnológica de vanguardia
                    con compromiso social y regional.
                </p>
            </div>

            <nav class="site-footer__col" aria-label="Universidad">
                <h3 class="site-footer__heading">Universidad</h3>
                <ul class="site-footer__list">
                    <li><a href="/pages/universidad/bienvenida.html">Bienvenida</a></li>
                    <li><a href="/pages/universidad/historia.html">Historia</a></li>
                    <li><a href="/pages/universidad/mision-vision.html">Misión y Visión</a></li>
                    <li><a href="/pages/identidad/himno.html">Himno UTU</a></li>
                </ul>
            </nav>

            <nav class="site-footer__col" aria-label="Comunidad">
                <h3 class="site-footer__heading">Comunidad</h3>
                <ul class="site-footer__list">
                    <li><a href="/pages/comunidad/directorio.html">Directorio</a></li>
                    <li><a href="/pages/comunidad/ubicacion.html">Ubicación</a></li>
                    <li><a href="/pages/comunidad/paraescolares.html">Paraescolares</a></li>
                    <li><a href="/pages/comunidad/proyectos.html">Proyectos</a></li>
                </ul>
            </nav>

            <nav class="site-footer__col" aria-label="Servicios">
                <h3 class="site-footer__heading">Servicios</h3>
                <ul class="site-footer__list">
                    <li><a href="/pages/servicios/calificaciones.html">Calificaciones</a></li>
                    <li><a href="/pages/servicios/calendario-escolar.html">Calendario Escolar</a></li>
                    <li><a href="/pages/participacion/quejas-sugerencias.html">Quejas y Sugerencias</a></li>
                    <li><a href="/pages/oferta-educativa/index.html">Oferta Educativa</a></li>
                </ul>
            </nav>

            <div class="site-footer__col site-footer__col--contact">
                <h3 class="site-footer__heading">Contacto</h3>
                <!-- TODO: Insertar dirección, teléfonos y correos institucionales oficiales. -->
                <ul class="site-footer__list site-footer__list--muted">
                    <li>Información de contacto institucional pendiente de publicación.</li>
                </ul>
            </div>
        </div>

        <div class="site-footer__bottom">
            <p class="site-footer__copy">
                © <span data-current-year>2026</span> Universidad Tecnológica del Usumacinta. Todos los derechos reservados.
            </p>
            <ul class="site-footer__legal">
                <li><a href="/pages/participacion/quejas-sugerencias.html">Quejas y Sugerencias</a></li>
                <li><a href="/pages/comunidad/directorio.html">Directorio</a></li>
            </ul>
        </div>
    </div>
</footer>
'@

# ================= css/reset.css =================
Save-Utf8NoBom 'css\reset.css' @'
/* =============================================================
   RESET — Base mínima moderna
   ============================================================= */

*,
*::before,
*::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

html {
    -webkit-text-size-adjust: 100%;
    text-size-adjust: 100%;
    scroll-behavior: smooth;
    -webkit-tap-highlight-color: transparent;
}

body {
    min-height: 100vh;
    line-height: 1.55;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-rendering: optimizeLegibility;
}

img,
picture,
video,
canvas,
svg {
    display: block;
    max-width: 100%;
    height: auto;
}

input,
button,
textarea,
select {
    font: inherit;
    color: inherit;
}

button {
    background: none;
    border: 0;
    cursor: pointer;
}

a {
    color: inherit;
    text-decoration: none;
}

ul,
ol {
    list-style: none;
}

h1, h2, h3, h4, h5, h6 {
    font-weight: inherit;
    line-height: 1.15;
    text-wrap: balance;
}

p {
    text-wrap: pretty;
}

:focus-visible {
    outline: 2px solid var(--utu-green-primary, #30BF97);
    outline-offset: 3px;
    border-radius: 6px;
}

@media (prefers-reduced-motion: reduce) {
    *,
    *::before,
    *::after {
        animation-duration: 0.01ms !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0.01ms !important;
        scroll-behavior: auto !important;
    }
}
'@

# ================= css/variables.css =================
Save-Utf8NoBom 'css\variables.css' @'
/* =============================================================
   VARIABLES — Sistema de diseño institucional UTU
   Modifica este archivo para reajustar toda la identidad visual.
   ============================================================= */

:root {
    /* ---------- Identidad institucional UTU ---------- */
    --utu-blue-primary:    #30348C;
    --utu-blue-secondary:  #303E8C;
    --utu-green-primary:   #30BF97;
    --utu-green-secondary: #2DA683;
    --utu-surface-light:   #F2F2F2;

    /* ---------- Neutrales y superficies ---------- */
    --utu-white:          #FFFFFF;
    --utu-ink:            #0F1226;
    --utu-ink-soft:       #232741;
    --utu-text:           #1C2039;
    --utu-text-muted:     #565B77;
    --utu-text-subtle:    #8A90A8;
    --utu-line:           rgba(15, 18, 38, 0.08);
    --utu-line-strong:    rgba(15, 18, 38, 0.14);
    --utu-surface:        #FFFFFF;
    --utu-surface-soft:   #F8F9FC;
    --utu-surface-muted:  #EEF0F6;

    /* ---------- Derivados institucionales ---------- */
    --utu-blue-tint:      rgba(48, 52, 140, 0.06);
    --utu-blue-tint-2:    rgba(48, 62, 140, 0.10);
    --utu-green-tint:     rgba(48, 191, 151, 0.08);
    --utu-green-tint-2:   rgba(45, 166, 131, 0.14);

    /* ---------- Gradientes institucionales ---------- */
    --utu-gradient-brand:
        linear-gradient(135deg, var(--utu-blue-primary) 0%,
                                var(--utu-blue-secondary) 55%,
                                var(--utu-green-secondary) 130%);

    --utu-gradient-hero:
        radial-gradient(120% 100% at 12% 0%, rgba(48, 191, 151, 0.18) 0%, transparent 55%),
        radial-gradient(120% 100% at 100% 100%, rgba(48, 52, 140, 0.22) 0%, transparent 60%),
        linear-gradient(180deg, #F8F9FC 0%, #EEF1F8 100%);

    --utu-gradient-accent:
        linear-gradient(135deg, var(--utu-green-primary) 0%,
                                var(--utu-green-secondary) 100%);

    --utu-gradient-glass:
        linear-gradient(180deg, rgba(255,255,255,0.82) 0%,
                                rgba(255,255,255,0.68) 100%);

    /* ---------- Tipografía ---------- */
    --font-sans: -apple-system, BlinkMacSystemFont, "SF Pro Display",
                 "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    --font-display: var(--font-sans);
    --font-mono: ui-monospace, SFMono-Regular, "SF Mono", Menlo, Consolas, monospace;

    --fs-12: 0.75rem;
    --fs-13: 0.8125rem;
    --fs-14: 0.875rem;
    --fs-16: 1rem;
    --fs-18: 1.125rem;
    --fs-20: 1.25rem;
    --fs-24: 1.5rem;
    --fs-30: 1.875rem;
    --fs-38: 2.375rem;
    --fs-48: 3rem;
    --fs-60: 3.75rem;

    /* ---------- Espaciado ---------- */
    --space-1:  0.25rem;
    --space-2:  0.5rem;
    --space-3:  0.75rem;
    --space-4:  1rem;
    --space-5:  1.25rem;
    --space-6:  1.5rem;
    --space-8:  2rem;
    --space-10: 2.5rem;
    --space-12: 3rem;
    --space-16: 4rem;
    --space-20: 5rem;
    --space-24: 6rem;
    --space-32: 8rem;

    /* ---------- Radios ---------- */
    --radius-xs:   6px;
    --radius-sm:   10px;
    --radius-md:   14px;
    --radius-lg:   20px;
    --radius-xl:   28px;
    --radius-2xl:  36px;
    --radius-full: 999px;

    /* ---------- Sombras ---------- */
    --shadow-xs: 0 1px 2px rgba(15, 18, 38, 0.04);
    --shadow-sm: 0 1px 3px rgba(15, 18, 38, 0.05), 0 1px 2px rgba(15, 18, 38, 0.03);
    --shadow-md: 0 8px 24px -12px rgba(15, 18, 38, 0.14), 0 2px 6px rgba(15, 18, 38, 0.04);
    --shadow-lg: 0 20px 40px -20px rgba(15, 18, 38, 0.18), 0 4px 12px rgba(15, 18, 38, 0.05);
    --shadow-xl: 0 32px 64px -32px rgba(48, 52, 140, 0.24), 0 8px 20px rgba(15, 18, 38, 0.06);
    --shadow-glass: 0 1px 0 rgba(15, 18, 38, 0.04), 0 8px 32px -16px rgba(15, 18, 38, 0.12);

    /* ---------- Transiciones ---------- */
    --ease-out:    cubic-bezier(0.22, 1, 0.36, 1);
    --ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);
    --dur-150: 150ms;
    --dur-200: 200ms;
    --dur-300: 300ms;
    --dur-400: 400ms;
    --dur-500: 500ms;

    /* ---------- Layout ---------- */
    --container-max:    1280px;
    --container-wide:   1440px;
    --container-pad:    clamp(1.1rem, 4vw, 2rem);
    --header-h:         76px;
    --header-h-mobile:  64px;
}
'@

# ================= css/main.css =================
Save-Utf8NoBom 'css\main.css' @'
/* =============================================================
   MAIN — Base, tipografía, layout y secciones del home
   ============================================================= */

/* ---------- Base ---------- */
html, body {
    background-color: var(--utu-surface);
    color: var(--utu-text);
    font-family: var(--font-sans);
    font-size: var(--fs-16);
}

body {
    overflow-x: hidden;
}

main {
    display: block;
}

/* ---------- Container ---------- */
.container {
    width: 100%;
    max-width: var(--container-max);
    margin-inline: auto;
    padding-inline: var(--container-pad);
}

/* ---------- Tipografía ---------- */
h1, h2, h3, h4 {
    font-family: var(--font-display);
    color: var(--utu-ink);
    letter-spacing: -0.02em;
    font-weight: 700;
}

p {
    color: var(--utu-text-muted);
}

.text-accent {
    background: var(--utu-gradient-accent);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

/* ---------- Botones ---------- */
.btn {
    --btn-bg: var(--utu-surface);
    --btn-fg: var(--utu-text);
    --btn-border: var(--utu-line-strong);

    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: var(--space-2);
    padding: 0.75rem 1.25rem;
    border-radius: var(--radius-full);
    border: 1px solid var(--btn-border);
    background: var(--btn-bg);
    color: var(--btn-fg);
    font-weight: 600;
    font-size: var(--fs-14);
    letter-spacing: -0.005em;
    line-height: 1;
    cursor: pointer;
    transition:
        transform var(--dur-200) var(--ease-out),
        box-shadow var(--dur-200) var(--ease-out),
        background-color var(--dur-200) var(--ease-out),
        color var(--dur-200) var(--ease-out),
        border-color var(--dur-200) var(--ease-out);
    white-space: nowrap;
    user-select: none;
}

.btn:hover {
    transform: translateY(-1px);
    box-shadow: var(--shadow-md);
}

.btn:active {
    transform: translateY(0);
    box-shadow: var(--shadow-sm);
}

.btn--sm {
    padding: 0.55rem 0.95rem;
    font-size: var(--fs-13);
}

.btn--lg {
    padding: 0.95rem 1.5rem;
    font-size: var(--fs-16);
}

.btn--primary {
    --btn-bg: var(--utu-blue-primary);
    --btn-fg: #fff;
    --btn-border: transparent;
    background: var(--utu-gradient-brand);
    box-shadow: 0 8px 24px -12px rgba(48, 52, 140, 0.55);
}

.btn--primary:hover {
    box-shadow: 0 16px 32px -14px rgba(48, 52, 140, 0.55);
}

.btn--outline {
    --btn-bg: rgba(255, 255, 255, 0.55);
    --btn-fg: var(--utu-ink);
    --btn-border: rgba(15, 18, 38, 0.14);
    backdrop-filter: saturate(180%) blur(14px);
    -webkit-backdrop-filter: saturate(180%) blur(14px);
}

.btn--ghost {
    --btn-bg: transparent;
    --btn-fg: var(--utu-blue-primary);
    --btn-border: transparent;
    padding-inline: 0.85rem;
}

.btn--ghost:hover {
    background: var(--utu-blue-tint);
    box-shadow: none;
    transform: none;
}

/* ============================================================
   HERO
   ============================================================ */
.hero {
    position: relative;
    isolation: isolate;
    margin-top: calc(var(--header-h) * -1);
    padding-top: calc(var(--header-h) + clamp(3rem, 8vw, 6rem));
    padding-bottom: clamp(4rem, 10vw, 7rem);
    min-height: min(92vh, 880px);
    display: flex;
    align-items: center;
    background: var(--utu-gradient-hero);
    overflow: hidden;
}

.hero__bg {
    position: absolute;
    inset: 0;
    z-index: -1;
    pointer-events: none;
}

.hero__orb {
    position: absolute;
    border-radius: 50%;
    filter: blur(70px);
    opacity: 0.55;
}

.hero__orb--blue {
    width: 520px;
    height: 520px;
    top: -160px;
    left: -120px;
    background: radial-gradient(circle, rgba(48, 52, 140, 0.55), transparent 65%);
}

.hero__orb--green {
    width: 620px;
    height: 620px;
    bottom: -220px;
    right: -180px;
    background: radial-gradient(circle, rgba(48, 191, 151, 0.45), transparent 65%);
}

.hero__grid {
    position: absolute;
    inset: 0;
    background-image:
        linear-gradient(to right, rgba(15, 18, 38, 0.045) 1px, transparent 1px),
        linear-gradient(to bottom, rgba(15, 18, 38, 0.045) 1px, transparent 1px);
    background-size: 56px 56px;
    mask-image: radial-gradient(120% 90% at 50% 0%, #000 30%, transparent 80%);
    -webkit-mask-image: radial-gradient(120% 90% at 50% 0%, #000 30%, transparent 80%);
    opacity: 0.5;
}

.hero__inner {
    position: relative;
    width: 100%;
}

.hero__content {
    max-width: 760px;
    animation: heroIn 0.9s var(--ease-out) both;
}

@keyframes heroIn {
    from { opacity: 0; transform: translateY(18px); }
    to   { opacity: 1; transform: translateY(0); }
}

.hero__eyebrow {
    display: inline-flex;
    align-items: center;
    gap: 0.55rem;
    padding: 0.45rem 0.9rem;
    border-radius: var(--radius-full);
    background: rgba(255, 255, 255, 0.7);
    border: 1px solid rgba(15, 18, 38, 0.08);
    backdrop-filter: saturate(180%) blur(12px);
    -webkit-backdrop-filter: saturate(180%) blur(12px);
    color: var(--utu-blue-primary);
    font-size: var(--fs-13);
    font-weight: 600;
    letter-spacing: 0.01em;
}

.hero__eyebrow-dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: var(--utu-gradient-accent);
    box-shadow: 0 0 0 4px rgba(48, 191, 151, 0.15);
}

.hero__title {
    margin-top: var(--space-6);
    font-size: clamp(2.25rem, 5.6vw, 4.25rem);
    line-height: 1.03;
    letter-spacing: -0.035em;
    font-weight: 800;
    color: var(--utu-ink);
}

.hero__title-accent {
    display: block;
    background: var(--utu-gradient-brand);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.hero__subtitle {
    margin-top: var(--space-6);
    max-width: 620px;
    font-size: clamp(1rem, 1.4vw, 1.15rem);
    line-height: 1.6;
    color: var(--utu-text-muted);
}

.hero__actions {
    margin-top: var(--space-8);
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-3);
}

.hero__stats {
    margin-top: clamp(2.5rem, 6vw, 4rem);
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: var(--space-4);
    max-width: 560px;
    padding-top: var(--space-6);
    border-top: 1px solid var(--utu-line);
}

.hero__stat dt {
    font-size: var(--fs-12);
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.09em;
    color: var(--utu-text-subtle);
}

.hero__stat dd {
    margin-top: 0.35rem;
    font-size: clamp(1.1rem, 1.6vw, 1.35rem);
    font-weight: 700;
    color: var(--utu-ink);
    letter-spacing: -0.02em;
}

/* ============================================================
   CARRUSEL — Espacio reservado
   ============================================================ */
.carousel-space {
    padding-block: clamp(3rem, 7vw, 5rem);
    background: linear-gradient(180deg, #EEF1F8 0%, #F8F9FC 100%);
}

.carousel-space__frame {
    position: relative;
    padding: clamp(1.5rem, 4vw, 3rem);
    border-radius: var(--radius-2xl);
    background:
        linear-gradient(180deg, rgba(255,255,255,0.92) 0%, rgba(255,255,255,0.75) 100%);
    border: 1px solid var(--utu-line);
    box-shadow: var(--shadow-glass);
    overflow: hidden;
}

.carousel-space__frame::before {
    content: "";
    position: absolute;
    inset: 0;
    border-radius: inherit;
    padding: 1px;
    background: linear-gradient(135deg,
        rgba(48, 52, 140, 0.20),
        rgba(48, 191, 151, 0.18) 60%,
        transparent 90%);
    -webkit-mask: linear-gradient(#000 0 0) content-box, linear-gradient(#000 0 0);
    -webkit-mask-composite: xor;
            mask-composite: exclude;
    pointer-events: none;
}

.carousel-space__header {
    position: relative;
    max-width: 620px;
}

.carousel-space__badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.35rem 0.75rem;
    border-radius: var(--radius-full);
    background: var(--utu-blue-tint);
    color: var(--utu-blue-primary);
    font-size: var(--fs-12);
    font-weight: 600;
    letter-spacing: 0.02em;
    text-transform: uppercase;
}

.carousel-space__badge-dot {
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: var(--utu-green-primary);
    box-shadow: 0 0 0 3px rgba(48, 191, 151, 0.18);
}

.carousel-space__title {
    margin-top: var(--space-4);
    font-size: clamp(1.5rem, 2.4vw, 2rem);
    letter-spacing: -0.025em;
}

.carousel-space__text {
    margin-top: var(--space-3);
    color: var(--utu-text-muted);
    font-size: var(--fs-16);
    max-width: 520px;
}

.carousel-space__placeholder {
    position: relative;
    margin-top: var(--space-8);
    aspect-ratio: 16 / 7;
    border-radius: var(--radius-xl);
    background:
        radial-gradient(120% 120% at 10% 10%, rgba(48, 191, 151, 0.14), transparent 55%),
        radial-gradient(120% 120% at 100% 100%, rgba(48, 52, 140, 0.16), transparent 55%),
        linear-gradient(180deg, #F4F6FB 0%, #EAEEF7 100%);
    border: 1px solid var(--utu-line);
    overflow: hidden;
}

.carousel-space__placeholder-glow {
    position: absolute;
    inset: -30% -20%;
    background: conic-gradient(from 90deg,
        rgba(48, 191, 151, 0) 0deg,
        rgba(48, 191, 151, 0.18) 90deg,
        rgba(48, 52, 140, 0.20) 220deg,
        rgba(48, 191, 151, 0) 360deg);
    filter: blur(60px);
    animation: carouselSpin 18s linear infinite;
}

@keyframes carouselSpin {
    to { transform: rotate(360deg); }
}

.carousel-space__placeholder-lines {
    position: absolute;
    left: 8%;
    right: 8%;
    bottom: 14%;
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.carousel-space__placeholder-lines span {
    display: block;
    height: 10px;
    border-radius: 999px;
    background: rgba(48, 52, 140, 0.14);
}

.carousel-space__placeholder-lines span:nth-child(1) { width: 42%; }
.carousel-space__placeholder-lines span:nth-child(2) { width: 68%; background: rgba(48, 191, 151, 0.22); }
.carousel-space__placeholder-lines span:nth-child(3) { width: 54%; }

.carousel-space__indicators {
    margin-top: var(--space-6);
    display: flex;
    gap: 8px;
    justify-content: center;
}

.carousel-space__indicators span {
    width: 26px;
    height: 4px;
    border-radius: 999px;
    background: rgba(15, 18, 38, 0.12);
    transition: background var(--dur-300) var(--ease-out),
                width var(--dur-300) var(--ease-out);
}

.carousel-space__indicators .is-active {
    width: 42px;
    background: var(--utu-gradient-accent);
}

/* ============================================================
   SECCIONES GENÉRICAS
   ============================================================ */
.section {
    padding-block: clamp(4rem, 9vw, 7rem);
}

.section-head {
    max-width: 720px;
    margin-bottom: clamp(2.5rem, 5vw, 4rem);
}

.section-eyebrow {
    display: inline-block;
    font-size: var(--fs-12);
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.14em;
    color: var(--utu-green-secondary);
    margin-bottom: var(--space-4);
}

.section-title {
    font-size: clamp(1.85rem, 3.6vw, 2.75rem);
    letter-spacing: -0.03em;
    line-height: 1.1;
}

.section-lead {
    margin-top: var(--space-5);
    font-size: clamp(1rem, 1.2vw, 1.125rem);
    color: var(--utu-text-muted);
    line-height: 1.65;
}

/* ---------- Estado vacío elegante ---------- */
.section-empty {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: var(--space-4);
    padding: clamp(2.5rem, 6vw, 4rem);
    border-radius: var(--radius-xl);
    border: 1px dashed var(--utu-line-strong);
    background: linear-gradient(180deg, #FBFCFF, #F5F7FC);
    color: var(--utu-text-subtle);
    text-align: center;
}

.section-empty__icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: var(--utu-blue-tint);
    color: var(--utu-blue-primary);
}

.section-empty__text {
    color: var(--utu-text-muted);
    font-size: var(--fs-14);
}

/* ============================================================
   MEDIA FRAMES
   ============================================================ */
.media-frame {
    position: relative;
    width: 100%;
    border-radius: var(--radius-2xl);
    background:
        radial-gradient(120% 120% at 10% 10%, rgba(48, 191, 151, 0.16), transparent 55%),
        radial-gradient(120% 120% at 100% 100%, rgba(48, 52, 140, 0.22), transparent 55%),
        linear-gradient(180deg, #F4F6FB, #E7EBF5);
    border: 1px solid var(--utu-line);
    overflow: hidden;
    box-shadow: var(--shadow-glass);
}

.media-frame--tall { aspect-ratio: 4 / 5; }
.media-frame--portrait { aspect-ratio: 3 / 4; }

.media-frame__glow {
    position: absolute;
    inset: -40%;
    background: conic-gradient(from 180deg,
        rgba(48, 191, 151, 0) 0deg,
        rgba(48, 191, 151, 0.22) 120deg,
        rgba(48, 52, 140, 0.26) 260deg,
        rgba(48, 191, 151, 0) 360deg);
    filter: blur(50px);
    animation: carouselSpin 22s linear infinite;
    opacity: 0.7;
}

.media-frame__empty {
    position: absolute;
    inset: 0;
    display: flex;
    align-items: flex-end;
    justify-content: flex-start;
    padding: var(--space-6);
}

.media-frame__empty-label {
    padding: 0.4rem 0.75rem;
    font-size: var(--fs-12);
    font-weight: 600;
    letter-spacing: 0.02em;
    color: var(--utu-blue-primary);
    background: rgba(255, 255, 255, 0.85);
    border: 1px solid rgba(48, 52, 140, 0.15);
    border-radius: var(--radius-full);
    backdrop-filter: saturate(180%) blur(10px);
    -webkit-backdrop-filter: saturate(180%) blur(10px);
}

/* ============================================================
   WELCOME
   ============================================================ */
.section--welcome {
    background: var(--utu-surface);
}

.welcome {
    display: grid;
    grid-template-columns: 1.05fr 0.95fr;
    gap: clamp(2rem, 6vw, 5rem);
    align-items: center;
}

.welcome__content {
    max-width: 560px;
}

.welcome__placeholder-note {
    margin-top: var(--space-5);
    padding: var(--space-4) var(--space-5);
    border-left: 3px solid var(--utu-green-primary);
    background: var(--utu-green-tint);
    color: var(--utu-text-muted);
    border-radius: 0 var(--radius-md) var(--radius-md) 0;
    font-size: var(--fs-14);
}

.welcome__actions {
    margin-top: var(--space-8);
}

/* ============================================================
   RECTOR
   ============================================================ */
.section--rector {
    background: linear-gradient(180deg, #F8F9FC 0%, #EEF1F8 100%);
}

.rector {
    display: grid;
    grid-template-columns: minmax(240px, 340px) 1fr;
    gap: clamp(2rem, 5vw, 4.5rem);
    align-items: center;
}

.rector__name {
    margin-top: var(--space-5);
    font-size: var(--fs-20);
    font-weight: 700;
    color: var(--utu-ink);
    display: flex;
    flex-direction: column;
    gap: 0.25rem;
}

.rector__role {
    font-size: var(--fs-14);
    font-weight: 500;
    color: var(--utu-text-muted);
    letter-spacing: 0.01em;
}

/* ============================================================
   HISTORIA
   ============================================================ */
.section--history {
    background: var(--utu-surface);
}

/* ============================================================
   MISIÓN Y VISIÓN
   ============================================================ */
.section--mv {
    background: linear-gradient(180deg, #EEF1F8 0%, #F8F9FC 100%);
}

.mv-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: clamp(1.25rem, 3vw, 2rem);
}

.mv-card {
    position: relative;
    padding: clamp(1.75rem, 3.5vw, 2.75rem);
    border-radius: var(--radius-2xl);
    background: var(--utu-surface);
    border: 1px solid var(--utu-line);
    box-shadow: var(--shadow-sm);
    transition: transform var(--dur-300) var(--ease-out),
                box-shadow var(--dur-300) var(--ease-out);
    overflow: hidden;
}

.mv-card::before {
    content: "";
    position: absolute;
    inset: 0;
    background:
        radial-gradient(120% 120% at 100% 0%, rgba(48, 52, 140, 0.06), transparent 60%);
    pointer-events: none;
}

.mv-card:hover {
    transform: translateY(-3px);
    box-shadow: var(--shadow-lg);
}

.mv-card__label {
    display: inline-block;
    padding: 0.35rem 0.75rem;
    border-radius: var(--radius-full);
    background: var(--utu-blue-tint);
    color: var(--utu-blue-primary);
    font-size: var(--fs-12);
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.10em;
}

.mv-card__label--green {
    background: var(--utu-green-tint);
    color: var(--utu-green-secondary);
}

.mv-card__title {
    margin-top: var(--space-5);
    font-size: clamp(1.25rem, 2vw, 1.6rem);
    letter-spacing: -0.02em;
}

.mv-card__text {
    margin-top: var(--space-4);
    color: var(--utu-text-muted);
    line-height: 1.65;
}

/* ============================================================
   WHY / DIFERENCIADORES
   ============================================================ */
.section--why {
    background: var(--utu-surface);
}

.why-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: clamp(1.25rem, 3vw, 2rem);
}

.why-card {
    position: relative;
    padding: clamp(1.75rem, 3vw, 2.5rem);
    border-radius: var(--radius-2xl);
    background: linear-gradient(180deg, #FFFFFF 0%, #FAFBFE 100%);
    border: 1px solid var(--utu-line);
    box-shadow: var(--shadow-sm);
    transition: transform var(--dur-300) var(--ease-out),
                box-shadow var(--dur-300) var(--ease-out),
                border-color var(--dur-300) var(--ease-out);
    overflow: hidden;
}

.why-card::after {
    content: "";
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 3px;
    background: var(--utu-gradient-accent);
    opacity: 0;
    transition: opacity var(--dur-300) var(--ease-out);
}

.why-card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-lg);
    border-color: rgba(48, 52, 140, 0.14);
}

.why-card:hover::after {
    opacity: 1;
}

.why-card__number {
    display: inline-block;
    font-family: var(--font-mono);
    font-size: var(--fs-12);
    letter-spacing: 0.10em;
    color: var(--utu-text-subtle);
}

.why-card__title {
    margin-top: var(--space-4);
    font-size: clamp(1.15rem, 1.8vw, 1.4rem);
    letter-spacing: -0.02em;
    color: var(--utu-ink);
}

.why-card__text {
    margin-top: var(--space-3);
    color: var(--utu-text-muted);
    font-size: var(--fs-14);
    line-height: 1.65;
}

.why-card__text strong {
    color: var(--utu-ink);
    font-weight: 600;
}

.why-card__stats {
    margin-top: var(--space-6);
    padding-top: var(--space-5);
    border-top: 1px solid var(--utu-line);
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: var(--space-4);
}

.why-card__stats dt {
    font-size: var(--fs-12);
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: var(--utu-text-subtle);
    font-weight: 600;
}

.why-card__stats dd {
    margin-top: 0.25rem;
    font-size: var(--fs-20);
    font-weight: 800;
    letter-spacing: -0.02em;
    color: var(--utu-blue-primary);
}

/* ============================================================
   ACCESOS RÁPIDOS
   ============================================================ */
.section--access {
    background: linear-gradient(180deg, #EEF1F8 0%, #F8F9FC 100%);
}

.access-grid {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: clamp(0.85rem, 1.6vw, 1.15rem);
}

.access-card {
    position: relative;
    display: flex;
    align-items: center;
    gap: var(--space-4);
    padding: 1.15rem 1.25rem;
    border-radius: var(--radius-lg);
    background: rgba(255, 255, 255, 0.9);
    border: 1px solid var(--utu-line);
    box-shadow: var(--shadow-xs);
    transition: transform var(--dur-200) var(--ease-out),
                box-shadow var(--dur-200) var(--ease-out),
                border-color var(--dur-200) var(--ease-out),
                background-color var(--dur-200) var(--ease-out);
}

.access-card:hover {
    transform: translateY(-2px);
    border-color: rgba(48, 52, 140, 0.16);
    box-shadow: var(--shadow-md);
    background: #FFFFFF;
}

.access-card:focus-visible {
    outline: 2px solid var(--utu-green-primary);
    outline-offset: 3px;
}

.access-card__icon {
    flex-shrink: 0;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 42px;
    height: 42px;
    border-radius: 12px;
    background: var(--utu-blue-tint);
    color: var(--utu-blue-primary);
    transition: background var(--dur-200) var(--ease-out),
                color var(--dur-200) var(--ease-out);
}

.access-card:hover .access-card__icon {
    background: var(--utu-gradient-accent);
    color: #fff;
}

.access-card__body {
    display: flex;
    flex-direction: column;
    min-width: 0;
    flex: 1;
}

.access-card__title {
    font-size: var(--fs-14);
    font-weight: 700;
    color: var(--utu-ink);
    letter-spacing: -0.01em;
}

.access-card__text {
    margin-top: 0.15rem;
    font-size: var(--fs-12);
    color: var(--utu-text-muted);
    line-height: 1.4;
}

.access-card__arrow {
    flex-shrink: 0;
    color: var(--utu-text-subtle);
    transition: transform var(--dur-200) var(--ease-out),
                color var(--dur-200) var(--ease-out);
}

.access-card:hover .access-card__arrow {
    transform: translateX(2px);
    color: var(--utu-green-secondary);
}

/* ============================================================
   REVEAL — Animación de entrada suave
   ============================================================ */
.reveal {
    opacity: 0;
    transform: translateY(16px);
    transition: opacity 0.7s var(--ease-out),
                transform 0.7s var(--ease-out);
    will-change: opacity, transform;
}

.reveal.is-visible {
    opacity: 1;
    transform: none;
}

/* ============================================================
   RESPONSIVE
   ============================================================ */

/* ---------- Tablets horizontales / laptops pequeñas ---------- */
@media (max-width: 1100px) {
    .access-grid {
        grid-template-columns: repeat(3, minmax(0, 1fr));
    }
}

/* ---------- Tablets verticales ---------- */
@media (max-width: 900px) {
    .welcome {
        grid-template-columns: 1fr;
    }

    .welcome__content {
        max-width: none;
    }

    .welcome__media {
        order: -1;
    }

    .media-frame--tall {
        aspect-ratio: 16 / 10;
    }

    .why-grid {
        grid-template-columns: 1fr;
    }

    .mv-grid {
        grid-template-columns: 1fr;
    }

    .rector {
        grid-template-columns: 1fr;
        text-align: left;
    }

    .media-frame--portrait {
        aspect-ratio: 4 / 3;
        max-width: 420px;
    }

    .access-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }
}

/* ---------- Móviles ---------- */
@media (max-width: 640px) {
    .hero {
        min-height: auto;
        padding-top: calc(var(--header-h-mobile) + 3rem);
        padding-bottom: 4rem;
    }

    .hero__stats {
        grid-template-columns: 1fr 1fr 1fr;
        gap: var(--space-3);
    }

    .hero__actions .btn {
        width: 100%;
        justify-content: center;
    }

    .access-grid {
        grid-template-columns: 1fr;
    }

    .carousel-space__placeholder {
        aspect-ratio: 4 / 3;
    }

    .carousel-space__frame {
        padding: 1.25rem;
    }
}

/* ---------- Móviles pequeños ---------- */
@media (max-width: 380px) {
    .hero__stats {
        grid-template-columns: 1fr;
        gap: var(--space-3);
    }
    .hero__stat {
        padding-bottom: var(--space-3);
        border-bottom: 1px solid var(--utu-line);
    }
    .hero__stat:last-child {
        border-bottom: 0;
        padding-bottom: 0;
    }
}
'@

# ================= css/components/header.css =================
Save-Utf8NoBom 'css\components\header.css' @'
/* =============================================================
   HEADER — Navegación institucional UTU
   ============================================================= */

.site-header {
    position: sticky;
    top: 0;
    z-index: 100;
    width: 100%;
    height: var(--header-h);
    background: transparent;
    transition:
        background-color var(--dur-300) var(--ease-out),
        box-shadow var(--dur-300) var(--ease-out),
        backdrop-filter var(--dur-300) var(--ease-out),
        border-color var(--dur-300) var(--ease-out);
    border-bottom: 1px solid transparent;
}

/* Estado al hacer scroll — vidrio institucional sutil */
.site-header.is-scrolled {
    background: rgba(255, 255, 255, 0.72);
    backdrop-filter: saturate(180%) blur(20px);
    -webkit-backdrop-filter: saturate(180%) blur(20px);
    border-bottom-color: var(--utu-line);
    box-shadow: 0 1px 0 rgba(15, 18, 38, 0.03),
                0 12px 32px -22px rgba(15, 18, 38, 0.18);
}

.site-header__inner {
    display: flex;
    align-items: center;
    gap: var(--space-6);
    height: 100%;
    width: 100%;
    max-width: var(--container-wide);
    margin-inline: auto;
    padding-inline: var(--container-pad);
}

/* ---------- Marca ---------- */
.brand {
    display: inline-flex;
    align-items: center;
    gap: 0.75rem;
    flex-shrink: 0;
    transition: opacity var(--dur-200) var(--ease-out);
}

.brand:hover {
    opacity: 0.88;
}

.brand__mark {
    display: inline-flex;
    filter: drop-shadow(0 6px 14px rgba(48, 52, 140, 0.22));
}

.brand__text {
    display: flex;
    flex-direction: column;
    line-height: 1.05;
}

.brand__title {
    font-size: var(--fs-14);
    font-weight: 700;
    letter-spacing: -0.015em;
    color: var(--utu-ink);
}

.brand__subtitle {
    font-size: var(--fs-12);
    font-weight: 500;
    color: var(--utu-text-muted);
    letter-spacing: 0.005em;
}

/* ---------- Navegación ---------- */
.nav {
    flex: 1;
    display: flex;
    justify-content: center;
}

.nav__list {
    display: flex;
    align-items: center;
    gap: 0.15rem;
}

.nav__item {
    position: relative;
}

.nav__trigger {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    padding: 0.55rem 0.85rem;
    font-size: var(--fs-14);
    font-weight: 500;
    color: var(--utu-text);
    border-radius: var(--radius-full);
    transition:
        background-color var(--dur-200) var(--ease-out),
        color var(--dur-200) var(--ease-out);
    white-space: nowrap;
}

.nav__trigger:hover,
.nav__trigger[aria-expanded="true"] {
    background: rgba(15, 18, 38, 0.05);
    color: var(--utu-blue-primary);
}

.nav__trigger--link {
    text-decoration: none;
}

.nav__chevron {
    transition: transform var(--dur-200) var(--ease-out);
    opacity: 0.7;
}

.nav__trigger[aria-expanded="true"] .nav__chevron {
    transform: rotate(180deg);
}

/* ---------- Dropdown (panel) ---------- */
.nav__panel {
    position: absolute;
    top: calc(100% + 8px);
    left: 50%;
    min-width: 220px;
    padding: 0.5rem;
    border-radius: var(--radius-lg);
    background: rgba(255, 255, 255, 0.92);
    border: 1px solid var(--utu-line);
    box-shadow: var(--shadow-lg);
    backdrop-filter: saturate(180%) blur(24px);
    -webkit-backdrop-filter: saturate(180%) blur(24px);
    opacity: 0;
    transform: translate(-50%, -6px);
    pointer-events: none;
    transition:
        opacity var(--dur-200) var(--ease-out),
        transform var(--dur-200) var(--ease-out);
}

.nav__item.is-open .nav__panel {
    opacity: 1;
    transform: translate(-50%, 0);
    pointer-events: auto;
}

.nav__panel-list {
    display: flex;
    flex-direction: column;
    gap: 2px;
}

.nav__panel-list a {
    display: block;
    padding: 0.55rem 0.75rem;
    border-radius: var(--radius-sm);
    font-size: var(--fs-14);
    font-weight: 500;
    color: var(--utu-text);
    transition: background-color var(--dur-150) var(--ease-out),
                color var(--dur-150) var(--ease-out);
}

.nav__panel-list a:hover,
.nav__panel-list a:focus-visible {
    background: var(--utu-blue-tint);
    color: var(--utu-blue-primary);
}

/* ---------- Acciones del header ---------- */
.site-header__actions {
    display: flex;
    align-items: center;
    gap: var(--space-2);
    flex-shrink: 0;
}

/* ---------- Botón hamburguesa ---------- */
.menu-toggle {
    display: none;
    width: 42px;
    height: 42px;
    border-radius: 12px;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    gap: 5px;
    background: rgba(15, 18, 38, 0.04);
    transition: background-color var(--dur-200) var(--ease-out);
}

.menu-toggle:hover {
    background: rgba(15, 18, 38, 0.07);
}

.menu-toggle__bar {
    display: block;
    width: 18px;
    height: 1.8px;
    border-radius: 2px;
    background: var(--utu-ink);
    transition: transform var(--dur-300) var(--ease-out),
                opacity var(--dur-200) var(--ease-out);
}

/* =============================================================
   RESPONSIVE HEADER
   ============================================================= */

/* ---------- Ocultar acciones secundarias en tablets ---------- */
@media (max-width: 1180px) {
    .site-header__actions .btn--ghost {
        display: none;
    }
}

@media (max-width: 1023px) {
    .site-header {
        height: var(--header-h-mobile);
    }

    .menu-toggle {
        display: inline-flex;
    }

    /* Panel deslizante del menú principal */
    .nav {
        position: fixed;
        inset: var(--header-h-mobile) 0 0 0;
        background: rgba(255, 255, 255, 0.96);
        backdrop-filter: saturate(180%) blur(24px);
        -webkit-backdrop-filter: saturate(180%) blur(24px);
        padding: 1.5rem var(--container-pad) 3rem;
        overflow-y: auto;
        transform: translateY(-8px);
        opacity: 0;
        pointer-events: none;
        transition:
            opacity var(--dur-300) var(--ease-out),
            transform var(--dur-300) var(--ease-out);
        justify-content: flex-start;
        z-index: 90;
    }

    .site-header.is-open .nav {
        opacity: 1;
        transform: translateY(0);
        pointer-events: auto;
    }

    .nav__list {
        flex-direction: column;
        align-items: stretch;
        gap: 0.25rem;
        width: 100%;
    }

    .nav__item {
        width: 100%;
        border-bottom: 1px solid var(--utu-line);
    }

    .nav__item:last-child {
        border-bottom: 0;
    }

    .nav__trigger {
        display: flex;
        justify-content: space-between;
        width: 100%;
        padding: 1rem 0.25rem;
        font-size: var(--fs-16);
        font-weight: 600;
        border-radius: 0;
        background: transparent;
        color: var(--utu-ink);
    }

    .nav__trigger:hover,
    .nav__trigger[aria-expanded="true"] {
        background: transparent;
        color: var(--utu-blue-primary);
    }

    /* Paneles colapsables dentro del menú móvil */
    .nav__panel {
        position: static;
        transform: none;
        opacity: 1;
        pointer-events: auto;
        background: transparent;
        border: 0;
        box-shadow: none;
        padding: 0 0 0.5rem 0.25rem;
        max-height: 0;
        overflow: hidden;
        transition: max-height var(--dur-400) var(--ease-out),
                    opacity var(--dur-300) var(--ease-out);
    }

    .nav__item.is-open .nav__panel {
        max-height: 400px;
        transform: none;
        opacity: 1;
    }

    .nav__panel-list a {
        padding: 0.7rem 0.5rem;
        font-size: var(--fs-15, 0.9375rem);
        color: var(--utu-text-muted);
    }

    /* Ícono hamburguesa → X */
    .site-header.is-open .menu-toggle__bar:nth-child(1) {
        transform: translateY(3.4px) rotate(45deg);
    }

    .site-header.is-open .menu-toggle__bar:nth-child(2) {
        transform: translateY(-3.4px) rotate(-45deg);
    }
}

/* ---------- Móviles pequeños ---------- */
@media (max-width: 480px) {
    .brand__title {
        font-size: 0.8125rem;
    }

    .brand__subtitle {
        font-size: 0.6875rem;
    }

    .site-header__actions .btn--primary {
        display: none;
    }
}
'@

# ================= css/components/footer.css =================
Save-Utf8NoBom 'css\components\footer.css' @'
/* =============================================================
   FOOTER — Cierre institucional UTU
   ============================================================= */

.site-footer {
    position: relative;
    background:
        radial-gradient(120% 100% at 15% 0%, rgba(48, 191, 151, 0.10) 0%, transparent 55%),
        radial-gradient(120% 100% at 100% 100%, rgba(48, 62, 140, 0.28) 0%, transparent 60%),
        linear-gradient(180deg, #1A1E44 0%, #141735 100%);
    color: rgba(255, 255, 255, 0.82);
    padding-top: clamp(3rem, 6vw, 5rem);
    padding-bottom: var(--space-8);
    overflow: hidden;
}

.site-footer::before {
    content: "";
    position: absolute;
    inset: 0;
    background-image:
        linear-gradient(to right, rgba(255, 255, 255, 0.035) 1px, transparent 1px),
        linear-gradient(to bottom, rgba(255, 255, 255, 0.035) 1px, transparent 1px);
    background-size: 72px 72px;
    mask-image: radial-gradient(120% 90% at 50% 0%, #000 20%, transparent 80%);
    -webkit-mask-image: radial-gradient(120% 90% at 50% 0%, #000 20%, transparent 80%);
    pointer-events: none;
    opacity: 0.7;
}

.site-footer > .container {
    position: relative;
}

/* ---------- Grid ---------- */
.site-footer__grid {
    display: grid;
    grid-template-columns: 1.6fr repeat(3, 1fr) 1.2fr;
    gap: clamp(1.75rem, 4vw, 3.5rem);
    padding-bottom: clamp(2.5rem, 5vw, 4rem);
    border-bottom: 1px solid rgba(255, 255, 255, 0.10);
}

/* ---------- Marca ---------- */
.site-footer__brand {
    max-width: 340px;
}

.brand--footer .brand__title {
    color: #FFFFFF;
}

.brand--footer .brand__subtitle {
    color: rgba(255, 255, 255, 0.65);
}

.site-footer__tagline {
    margin-top: var(--space-5);
    font-size: var(--fs-14);
    line-height: 1.65;
    color: rgba(255, 255, 255, 0.62);
}

/* ---------- Columnas ---------- */
.site-footer__col {
    min-width: 0;
}

.site-footer__heading {
    font-size: var(--fs-12);
    text-transform: uppercase;
    letter-spacing: 0.14em;
    font-weight: 700;
    color: rgba(255, 255, 255, 0.55);
    margin-bottom: var(--space-5);
}

.site-footer__list {
    display: flex;
    flex-direction: column;
    gap: 0.65rem;
}

.site-footer__list a {
    font-size: var(--fs-14);
    color: rgba(255, 255, 255, 0.82);
    transition: color var(--dur-200) var(--ease-out),
                transform var(--dur-200) var(--ease-out);
    display: inline-block;
    width: fit-content;
}

.site-footer__list a:hover {
    color: var(--utu-green-primary);
    transform: translateX(2px);
}

.site-footer__list--muted li {
    font-size: var(--fs-13);
    color: rgba(255, 255, 255, 0.55);
    line-height: 1.6;
}

/* ---------- Bottom ---------- */
.site-footer__bottom {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: var(--space-4);
    padding-top: var(--space-6);
    flex-wrap: wrap;
}

.site-footer__copy {
    font-size: var(--fs-13);
    color: rgba(255, 255, 255, 0.55);
    margin: 0;
}

.site-footer__legal {
    display: flex;
    gap: var(--space-6);
    flex-wrap: wrap;
}

.site-footer__legal a {
    font-size: var(--fs-13);
    color: rgba(255, 255, 255, 0.72);
    transition: color var(--dur-200) var(--ease-out);
}

.site-footer__legal a:hover {
    color: var(--utu-green-primary);
}

/* =============================================================
   RESPONSIVE FOOTER
   ============================================================= */

@media (max-width: 1100px) {
    .site-footer__grid {
        grid-template-columns: 1.4fr repeat(2, 1fr);
    }

    .site-footer__brand {
        grid-column: 1 / -1;
        max-width: 520px;
    }

    .site-footer__col--contact {
        grid-column: 1 / -1;
    }
}

@media (max-width: 700px) {
    .site-footer__grid {
        grid-template-columns: 1fr 1fr;
        gap: var(--space-8) var(--space-6);
    }

    .site-footer__brand {
        grid-column: 1 / -1;
    }

    .site-footer__col--contact {
        grid-column: 1 / -1;
    }

    .site-footer__bottom {
        flex-direction: column;
        align-items: flex-start;
        text-align: left;
    }
}

@media (max-width: 420px) {
    .site-footer__grid {
        grid-template-columns: 1fr;
    }
}
'@

# ================= js/app.js =================
Save-Utf8NoBom 'js\app.js' @'
/* =============================================================
   APP — Microinteracciones visuales para el portal UTU
   - Sticky header con estado en scroll
   - Menú móvil accesible
   - Dropdowns (desktop y móvil)
   - Reveal on scroll
   - Año dinámico en el footer
   No contiene navegación dinámica ni router.
   ============================================================= */

(function () {
    'use strict';

    const header      = document.querySelector('[data-header]');
    const menuToggle  = document.querySelector('[data-menu-toggle]');
    const dropdowns   = document.querySelectorAll('[data-dropdown-item]');
    const reveals     = document.querySelectorAll('.reveal');
    const yearEls     = document.querySelectorAll('[data-current-year]');
    const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    /* -----------------------------------------------------------
       Header — estado al hacer scroll
       ----------------------------------------------------------- */
    if (header) {
        const setScrolled = () => {
            header.classList.toggle('is-scrolled', window.scrollY > 8);
        };
        setScrolled();
        window.addEventListener('scroll', setScrolled, { passive: true });
    }

    /* -----------------------------------------------------------
       Menú móvil
       ----------------------------------------------------------- */
    if (menuToggle && header) {
        const setMenu = (open) => {
            header.classList.toggle('is-open', open);
            menuToggle.setAttribute('aria-expanded', String(open));
            menuToggle.setAttribute('aria-label', open ? 'Cerrar menú' : 'Abrir menú');
            document.documentElement.style.overflow = open ? 'hidden' : '';
        };

        menuToggle.addEventListener('click', () => {
            const isOpen = header.classList.contains('is-open');
            setMenu(!isOpen);
        });

        // Cerrar con ESC
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && header.classList.contains('is-open')) {
                setMenu(false);
                menuToggle.focus();
            }
        });

        // Cerrar al pasar a desktop
        window.addEventListener('resize', () => {
            if (window.innerWidth > 1023 && header.classList.contains('is-open')) {
                setMenu(false);
            }
        });
    }

    /* -----------------------------------------------------------
       Dropdowns
       ----------------------------------------------------------- */
    const closeAllDropdowns = (except) => {
        dropdowns.forEach((item) => {
            if (item === except) return;
            item.classList.remove('is-open');
            const trigger = item.querySelector('[data-dropdown-trigger]');
            if (trigger) trigger.setAttribute('aria-expanded', 'false');
        });
    };

    dropdowns.forEach((item) => {
        const trigger = item.querySelector('[data-dropdown-trigger]');
        if (!trigger) return;

        trigger.addEventListener('click', (e) => {
            e.preventDefault();
            const isOpen = item.classList.contains('is-open');
            closeAllDropdowns(item);
            item.classList.toggle('is-open', !isOpen);
            trigger.setAttribute('aria-expanded', String(!isOpen));
        });
    });

    // Cerrar dropdown al hacer click fuera (solo desktop)
    document.addEventListener('click', (e) => {
        if (window.innerWidth < 1024) return;
        if (!e.target.closest('[data-dropdown-item]')) {
            closeAllDropdowns(null);
        }
    });

    /* -----------------------------------------------------------
       Reveal on scroll
       ----------------------------------------------------------- */
    if ('IntersectionObserver' in window && reveals.length && !prefersReduced) {
        const io = new IntersectionObserver((entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('is-visible');
                    io.unobserve(entry.target);
                }
            });
        }, {
            rootMargin: '0px 0px -8% 0px',
            threshold: 0.05
        });

        reveals.forEach((el) => io.observe(el));
    } else {
        // Fallback: mostrar todo
        reveals.forEach((el) => el.classList.add('is-visible'));
    }

    /* -----------------------------------------------------------
       Año dinámico en el footer
       ----------------------------------------------------------- */
    if (yearEls.length) {
        const y = String(new Date().getFullYear());
        yearEls.forEach((el) => { el.textContent = y; });
    }
})();
'@

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  ARCHIVOS BASE UTU GENERADOS CORRECTAMENTE" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""
Get-ChildItem -Recurse -File -Include index.html,header.html,footer.html,reset.css,variables.css,main.css,app.js | Select-Object FullName