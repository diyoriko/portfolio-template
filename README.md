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
  --accent: #F8401C;      /* Accent color (links, hover) */
}
```

### Fonts

The template uses system fonts by default. To use custom fonts:

1. Add your font files to `assets/fonts/`
2. Add `@font-face` declarations to `styles.css`
3. Update `--font-sans` and `--font-mono` variables

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

### Analytics

Replace `YOURSITE` in the GoatCounter script tag, or run `setup.sh` which handles this automatically.

Sign up at [goatcounter.com](https://www.goatcounter.com/) (free, no cookies, GDPR-friendly).

### Rebuilding Minified Files

After editing `styles.css` or `script.js`:

```bash
npx csso styles.css -o styles.min.css
npx terser script.js -o script.min.js --compress --mangle
```

## Grid System

- 12-column grid, 1156px max width, 20px column gap
- Side padding: 48px (desktop), 24px (tablet/mobile)
- Text column: 764px centered
- Press `Shift+G` in the browser to visualize the grid

## License

MIT
