# Backlog — Portfolio Template

Status: `[ ]` todo · `[~]` in progress · `[x]` done · `[—]` cancelled

---

## Sprint 1 — Code Review Fixes (2026-04-02)

- [x] Fix `.text-dim` contrast `rgba(0.4)` → `rgba(0.55)` for WCAG AAA (4.5:1)
- [x] Add `loading="lazy"` to all case study images (RU + EN)
- [x] Fix lightbox focus trapping — Tab stays in modal, `aria-modal` added
- [x] Replace hardcoded colors in JS with CSS variable references (terminal, cursor trail, badge)
- [x] Scope global `observer` variable next to `initScrollReveal`
- [x] Add 16ms throttle to cursor trail mousemove (404 page)
- [x] Convert PNG thumbnails to WebP + `<picture>` fallback
- [x] Add `manifest.json` + `<link rel="manifest">` to all pages
- [x] Add `CONTRIBUTING.md`
- [x] Add GitHub issue templates (bug report, feature request)
- [x] Rebuild `script.min.js` + `styles.min.css`
- [x] Vanilla badge: fix dark mode background (was always white)

---

## Sprint 2 — Completed (2026-04-02)

- [x] **README: update structure section** — added `manifest.json`, `CONTRIBUTING.md`, `.github/`
- [x] **README: fix customization note** — removed "search for #F8401C in script.js", pointed to config.json
- [x] **setup.sh: handle manifest.json** — replaces theme_color with accent
- [—] **Google Fonts SRI** — not feasible, Google serves different CSS per User-Agent; SRI hashes break
- [x] **Lighthouse scores in README** — updated with real scores (90/92/81/100)
- [x] **Live Demo deployment** — deployed to https://portfolio-template-demo-463.netlify.app
- [x] **README: Live Demo link** — updated to point to Netlify demo, not diyor.design
- [x] **Contact form integration guide** — Formspree + Netlify Forms examples in README
- [x] **i18n guide** — step-by-step for adding new languages in README
- [x] **Blog section template** — `writing.html` + `en/writing.html` with CSS (writing-list, writing-item)
- [x] **Terminal discoverability** — `~` hint appears in vanilla badge on hover
- [x] **Nav active state** — auto-detect from URL (initNavActive)
- [x] Final rebuild `script.min.js` (19KB) + `styles.min.css` (22KB)

---

## Blocked / Waiting

- [ ] **README preview image broken** — GitHub account flagged, image rendering blocked. Waiting for reinstatement (ticket submitted 2026-04-02)
- [ ] **Shields.io badges "repo not found"** — same cause as above
- [ ] **awesome-list PRs** — Evavic44/portfolio-ideas#651, guilyx/awesome-github-pages-portfolios#12 — waiting for merge

---

## Ideas (unplanned)

- [ ] Animated GIF/video demo for README (biggest star driver per competitor analysis)
- [ ] GitHub Actions auto-setup workflow
- [ ] Individual blog post page template

---

## Notes

- Template repo: `github.com/diyoriko/portfolio-template`
- Production portfolio: `github.com/diyoriko/portfolio` (separate repo, 735MB)
- Demo: `portfolio-template-demo-463.netlify.app` (Netlify, no-build deploy)
- After editing `script.js` or `styles.css`, always rebuild: `npx terser script.js -o script.min.js -c -m && npx csso styles.css -o styles.min.css`
