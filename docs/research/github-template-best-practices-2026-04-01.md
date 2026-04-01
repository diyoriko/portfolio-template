# Portfolio Template GitHub Best Practices Research
Date: 2026-04-01

## 1. Top HTML/CSS/JS Templates by Stars

| Template | Stars | Key Differentiator |
|---|---|---|
| Dopefolio | 3.7k | GIF demo in README, Lighthouse scores screenshot, SCSS theming, CSS Tricks featured |
| CommunityPro/portfolio-html | 648 | CONTRIBUTING.md, issue templates, 8-section customization guide, Netlify demo |
| developer-portfolio (yashraj) | 96 | **Auto-setup GitHub Action** creates personalized config.json on repo creation, dark mode, zero-code JSON config |

### What they have that we're missing
- **Animated GIF demo** in README (Dopefolio's biggest star driver)
- **Dark mode** with toggle and persistent preference
- **CONTRIBUTING.md** + issue templates (CommunityPro)
- **GitHub Action auto-setup** that pre-fills config on `Use this template` (yashraj)
- **Lighthouse score screenshot** as social proof
- **"good first issue" labels** to attract contributors

### What we have that they DON'T
- Bilingual support (unique differentiator)
- config.json + setup.sh (better than most)
- Terminal easter egg, grid overlay
- Print stylesheet
- GoatCounter integration

## 2. README Best Practices for Star-worthy Templates

Must-haves (from 14k-star Best-README-Template + Dopefolio analysis):
1. **Hero screenshot or GIF** as first thing after title
2. **Live demo link** prominently at top
3. **Badges**: license, stars, forks, PRs welcome
4. **One-command quickstart** (we have this)
5. **Table of contents** for long READMEs
6. **Lighthouse/performance scores** screenshot
7. **"Deploy to Vercel/Netlify" one-click button**
8. **Contributing section** or CONTRIBUTING.md

## 3. What Makes Templates Go Viral

### Platforms & Expected Impact (from ScrapeGraphAI 20k+ stars journey)
- **Hacker News**: 1,200 stars in 24 hours (biggest single-day spike)
- **Twitter/X threads**: 800 stars over a week
- **Dev.to / blog posts**: 500 stars in one day
- **Conference talks**: 2,000 stars over a month
- **Reddit** (r/webdev, r/web_design, r/SideProject): steady traffic

### Tactical Playbook
1. First 100 stars: ask personal network directly (spreadsheet of contacts)
2. Get on **GitHub Trending** page (github.com/trending) — triggers snowball
3. Write blog post about the PROBLEM, mention tool at end
4. Add "good first issue" labels — gets listed on goodfirstissue.dev
5. Weekly updates (even minor) — signals active maintenance
6. Public roadmap via GitHub Projects
7. Respond to every issue within 24 hours
8. Launch imperfect, iterate with community feedback

### Title/Naming Strategy
- Name should be memorable and searchable ("Dopefolio" > "portfolio-html")
- Description should lead with benefit: "Blazing Fast Multipage Portfolio Template"
- Use power words: "zero dependencies", "one-click deploy", "blazing fast"

## 4. Common Complaints (from GitHub Issues Analysis)

### devportfolio (4.8k stars) top issues:
- Dark mode requested repeatedly (Issue #246 and many duplicates)
- Contact form not working / no form integration
- Hard to customize colors (buried in SCSS)
- No blog/writing section
- Broken on Safari/iOS

### Dopefolio (3.7k stars) top issues:
- Spam PRs dominate (Hacktoberfest problem)
- Docker setup requested
- Font files missing
- Experience page requested
- No CONTRIBUTING.md = chaotic PRs

### Universal pain points:
1. **Dark mode** — #1 most requested feature across all templates
2. **Config-driven personalization** — users don't want to edit 10+ HTML files
3. **Contact form** — where do messages go?
4. **Blog/writing section** — designers want to write too
5. **One-click deploy** — Vercel/Netlify/GitHub Pages buttons in README

## 5. Template Discovery Channels

### Where people find templates (ranked by volume):
1. **GitHub Topics page**: `portfolio-template` (primary discovery)
2. **Google search**: "portfolio template github html css"
3. **GitHub Trending**: biggest single spike source
4. **Curated awesome lists** (submit to these):
   - [Evavic44/portfolio-ideas](https://github.com/Evavic44/portfolio-ideas) — **5.9k stars**, table format, accepts PRs
   - [guilyx/awesome-github-pages-portfolios](https://github.com/guilyx/awesome-github-pages-portfolios) — **398 stars**, accepts PRs
   - [emmabostian/developer-portfolios](https://github.com/emmabostian/developer-portfolios) — inspiration list
5. **Reddit**: r/webdev, r/web_design, r/SideProject
6. **Dev.to**: tutorial-style posts perform best
7. **Product Hunt**: for polished launches

### Critical GitHub Topics to add to repo:
`portfolio-template`, `portfolio-website`, `personal-portfolio`, `html-portfolio`, `portfolio-website-html-css`, `github-pages`, `portfolio`, `developer-portfolio`, `portfolio-template-free`, `simple-portfolio`

## Sources
- https://github.com/topics/portfolio-template
- https://github.com/rammcodes/Dopefolio
- https://github.com/CommunityPro/portfolio-html
- https://github.com/yashrajnayak/developer-portfolio
- https://scrapegraphai.com/blog/gh-stars
- https://blog.tooljet.com/12-ways-to-get-more-github-stars-for-your-open-source-projects/
- https://github.com/othneildrew/Best-README-Template
- https://github.com/Evavic44/portfolio-ideas
- https://github.com/guilyx/awesome-github-pages-portfolios
