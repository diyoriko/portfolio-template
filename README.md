# Portfolio Template

A clean, minimal, bilingual (RU/EN) portfolio template for designers. Based on [diyor.design](https://diyor.design).

**Demo:** [diyor.design](https://diyor.design)

## Features

- **Zero dependencies** — vanilla HTML, CSS, JavaScript
- **Bilingual** — Russian and English with language switcher
- **Responsive** — mobile-first, works on all screen sizes
- **Case study template** — structured sections with numbered headings, stats, image grids
- **Scroll reveal** — subtle entrance animations
- **Lightbox** — click-to-zoom on case study images
- **Terminal easter egg** — press `~` for a secret terminal
- **Design system overlay** — press `Shift+G` to see the 12-column grid
- **GoatCounter analytics** — privacy-friendly, cookie-free
- **SEO ready** — meta tags, Open Graph, structured data, sitemap
- **Print stylesheet** — clean printable version of the about page
- **Accessible** — ARIA attributes, keyboard navigation, reduced motion support
- **GitHub Pages ready** — just push to main

## Quick Start

```bash
# 1. Clone the template
git clone https://github.com/YOUR_USERNAME/portfolio-template.git my-portfolio
cd my-portfolio

# 2. Run the setup script
chmod +x setup.sh
./setup.sh

# 3. Open in browser
open index.html

# 4. Deploy to GitHub Pages
git init
git add .
git commit -m "Initial portfolio"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_USERNAME.github.io.git
git push -u origin main
```

Then go to **Settings > Pages** and set source to `main` branch.

## Structure

```
.
├── index.html              # Home page (RU)
├── about.html              # About page (RU)
├── 404.html                # 404 error page
├── projects/
│   └── example.html        # Case study (RU)
├── en/
│   ├── index.html          # Home page (EN)
│   ├── about.html          # About page (EN)
│   └── projects/
│       └── example.html    # Case study (EN)
├── assets/
│   └── img/                # Project thumbnails and OG image
├── styles.css              # Full CSS source
├── styles.min.css          # Minified CSS
├── script.js               # Full JS source
├── script.min.js           # Minified JS
├── config.json             # Template configuration
├── setup.sh                # Interactive setup script
├── sitemap.xml             # Sitemap
├── robots.txt              # Robots
├── CNAME                   # Custom domain
├── favicon.svg             # Favicon
└── README.md
```

## Customization

### Colors

Edit CSS variables in `styles.css`:

```css
:root {
  --bg: #ffffff;          /* Background */
  --text: #222222;        /* Text color */
  --text-dim: #999999;    /* Secondary text */
  --accent: #F8401C;      /* Accent color (links, hover, buttons) */
  --line: #000000;        /* Borders and dividers */
  --selection-bg: #F8401C; /* Text selection highlight */
}
```

Also update the accent color in:
- `favicon.svg` — the circle fill color
- `script.js` — terminal cursor color and hover effects (search for `#F8401C`)

### Fonts

The template uses [Inter](https://fonts.google.com/specimen/Inter) + [DM Mono](https://fonts.google.com/specimen/DM+Mono) from Google Fonts. To change:

1. Pick fonts at [fonts.google.com](https://fonts.google.com)
2. Replace the `<link href="https://fonts.googleapis.com/...">` in all HTML files
3. Update `--font-sans` and `--font-mono` in `styles.css`

Or use local font files:

1. Add `.woff2` files to `assets/fonts/`
2. Add `@font-face` declarations to `styles.css`
3. Remove the Google Fonts `<link>` from HTML files

### Adding Projects

1. Duplicate `projects/example.html` (and `en/projects/example.html`)
2. Update content, images, and meta tags
3. Add a project card to `index.html` (and `en/index.html`)
4. Add the URL to `sitemap.xml`

### Case Study Sections

Case studies use a consistent structure:

```html
<section class="case-section">
  <span class="case-section-num">1</span>
  <h2 class="case-section-title">SECTION TITLE</h2>
  <p>Section content...</p>
</section>
```

Available components: `.case-stats`, `.case-img-full`, `.case-img-row`, `.case-quote`, `.case-separator`, `.case-nav`.

### Spacing

Key spacing variables in `styles.css`:

```css
--content-max: 1156px;    /* Max content width */
--content-pad: 48px;      /* Side padding (24px on mobile) */
--radius-sm: 10px;        /* Border radius */
```

### Analytics

Replace `YOURSITE` in the GoatCounter script tag, or run `setup.sh` which handles this automatically.

Sign up at [goatcounter.com](https://www.goatcounter.com/) (free, no cookies, GDPR-friendly).

To use a different analytics provider, replace the GoatCounter `<script>` tag in all HTML files.

### Custom Domain

1. Update `CNAME` with your domain
2. In GitHub repo: **Settings > Pages > Custom domain**
3. Set up DNS: CNAME record pointing to `YOUR_USERNAME.github.io`

### Removing Bilingual Support

If you only need one language:

1. Delete the `en/` folder (or root RU files)
2. Remove the language switcher from `<nav>` in all pages
3. Remove `hreflang` `<link>` tags from `<head>`

### Favicon

Replace `favicon.svg` with your own. The default is an accent-colored circle with "P". For best compatibility, also add a `favicon.ico` (32x32 PNG).

### OG Images

Replace `assets/img/og-image.png` (1200x630) for social media previews. Each project page can have its own OG image — update the `og:image` meta tag.

### Rebuilding Minified Files

After editing `styles.css` or `script.js`:

```bash
npx csso styles.css -o styles.min.css
npx terser script.js -o script.min.js --compress --mangle
```

HTML files load `.min.css` and `.min.js` — always rebuild after changes.

## Grid System

- 12-column grid, 1156px max width, 20px column gap
- Side padding: 48px (desktop), 24px (tablet/mobile)
- Text column: 764px centered
- Breakpoints: 900px (tablet), 480px (mobile)
- Press `Shift+G` in the browser to visualize the grid

## Browser Support

All modern browsers (Chrome, Firefox, Safari, Edge). No IE11 support.

## License

MIT — use freely for personal and commercial projects.
