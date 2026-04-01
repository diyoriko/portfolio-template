#!/bin/bash
# Portfolio Template — Setup Script
# Replaces placeholder values with your own across all files.
#
# Usage:
#   chmod +x setup.sh
#   ./setup.sh
#
# Based on diyor.design portfolio template.

set -euo pipefail

echo ""
echo "  Portfolio Template Setup"
echo "  ========================"
echo ""

# --- Collect info ---

read -rp "Your name (e.g. Alex Johnson): " NAME
read -rp "Your name in Russian (or same if N/A): " NAME_RU
read -rp "Your job title in English (e.g. Product Designer): " JOB
read -rp "Your job title in Russian (e.g. Продуктовый дизайнер): " JOB_RU
read -rp "Your domain (e.g. alexjohnson.design): " DOMAIN
read -rp "Your email: " EMAIL
read -rp "Telegram username (without @): " TELEGRAM
read -rp "Instagram username: " INSTAGRAM
read -rp "LinkedIn username: " LINKEDIN
read -rp "GoatCounter subdomain (e.g. alexj): " GOATCOUNTER
read -rp "Location in English (e.g. Based in Berlin): " LOCATION
read -rp "Location in Russian (e.g. Живу в Берлине): " LOCATION_RU

echo ""
echo "Applying changes..."

# --- Helper: replace in all HTML, CSS, JS, JSON, XML, TXT files ---
replace_all() {
  local old="$1"
  local new="$2"
  find . -type f \( -name "*.html" -o -name "*.css" -o -name "*.js" -o -name "*.json" -o -name "*.xml" -o -name "*.txt" -o -name "CNAME" \) \
    -not -path "./.git/*" \
    -not -path "./node_modules/*" \
    -exec sed -i '' "s|${old}|${new}|g" {} +
}

# --- Apply replacements ---

# Domain & URLs
replace_all "example.com" "$DOMAIN"
replace_all "https://example.com" "https://$DOMAIN"

# Name
replace_all "Jane Smith" "$NAME"
if [ "$NAME" != "$NAME_RU" ]; then
  # Only replace Russian-specific contexts if names differ
  echo "Note: Update Russian name manually in about.html if needed."
fi

# Job title
replace_all "Product Designer" "$JOB"
replace_all "Продуктовый дизайнер" "$JOB_RU"

# Contact info
replace_all "hello@example.com" "$EMAIL"
replace_all "janesmith" "$TELEGRAM" # handles telegram, instagram, linkedin usernames

# If Instagram/LinkedIn differ from Telegram, fix them
if [ "$INSTAGRAM" != "$TELEGRAM" ]; then
  find . -type f -name "*.html" -exec sed -i '' "s|instagram.com/${TELEGRAM}|instagram.com/${INSTAGRAM}|g" {} +
fi
if [ "$LINKEDIN" != "$TELEGRAM" ]; then
  find . -type f -name "*.html" -exec sed -i '' "s|linkedin.com/in/${TELEGRAM}|linkedin.com/in/${LINKEDIN}|g" {} +
fi

# GoatCounter
replace_all "YOURSITE.goatcounter.com" "${GOATCOUNTER}.goatcounter.com"

# Location
replace_all "Working remotely" "$LOCATION"
replace_all "Работаю удалённо" "$LOCATION_RU"

# CNAME
echo "$DOMAIN" > CNAME

# Update config.json with actual values
cat > config.json << EOF
{
  "name": "$NAME",
  "name_ru": "$NAME_RU",
  "job": "$JOB",
  "job_ru": "$JOB_RU",
  "domain": "$DOMAIN",
  "url": "https://$DOMAIN",
  "email": "$EMAIL",
  "telegram": "$TELEGRAM",
  "instagram": "$INSTAGRAM",
  "linkedin": "$LINKEDIN",
  "goatcounter": "$GOATCOUNTER",
  "location": "$LOCATION",
  "location_ru": "$LOCATION_RU",
  "accent_color": "#F8401C",
  "og_image": "assets/img/og-image.png"
}
EOF

echo ""
echo "Done! Your portfolio is configured for $DOMAIN"
echo ""
echo "Next steps:"
echo "  1. Replace placeholder images in assets/img/"
echo "  2. Edit case studies in projects/ and en/projects/"
echo "  3. Update about page text in about.html and en/about.html"
echo "  4. git init && git add . && git commit -m 'Initial portfolio'"
echo "  5. Push to GitHub and enable GitHub Pages"
echo ""
