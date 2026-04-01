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

ask() {
  local prompt="$1"
  local default="$2"
  local result=""
  while [ -z "$result" ]; do
    read -rp "$prompt" result
    if [ -z "$result" ] && [ -n "$default" ]; then
      result="$default"
      echo "  Using default: $result"
    elif [ -z "$result" ]; then
      echo "  This field is required. Please try again."
    fi
  done
  echo "$result"
}

NAME=$(ask "Your name (e.g. Alex Johnson): " "")
NAME_RU=$(ask "Your name in Russian (or same if N/A): " "$NAME")
JOB=$(ask "Your job title in English (e.g. Product Designer): " "Product Designer")
JOB_RU=$(ask "Your job title in Russian (e.g. Продуктовый дизайнер): " "Продуктовый дизайнер")
DOMAIN=$(ask "Your domain (e.g. alexjohnson.design): " "")
EMAIL=$(ask "Your email: " "")
TELEGRAM=$(ask "Telegram username (without @): " "")
INSTAGRAM=$(ask "Instagram username: " "$TELEGRAM")
LINKEDIN=$(ask "LinkedIn username: " "$TELEGRAM")
GOATCOUNTER=$(ask "GoatCounter subdomain (e.g. alexj): " "")
LOCATION=$(ask "Location in English (e.g. Based in Berlin): " "Working remotely")
LOCATION_RU=$(ask "Location in Russian (e.g. Живу в Берлине): " "Работаю удалённо")

echo ""
echo "Applying changes..."

# --- Helper: replace in all HTML, CSS, JS, JSON, XML, TXT files ---
replace_all() {
  local old="$1"
  local new="$2"
  local escaped_old=$(printf '%s\n' "$old" | sed -e 's/[]\/$*.^[]/\\&/g')
  local escaped_new=$(printf '%s\n' "$new" | sed -e 's/[\/&]/\\&/g')
  find . -type f \( -name "*.html" -o -name "*.css" -o -name "*.js" -o -name "*.json" -o -name "*.xml" -o -name "*.txt" -o -name "CNAME" \) \
    -not -path "./.git/*" \
    -not -path "./node_modules/*" \
    -exec sed -i '' "s|${escaped_old}|${escaped_new}|g" {} +
}

# --- Apply replacements ---

# Domain & URLs
replace_all "example.com" "$DOMAIN"
replace_all "https://example.com" "https://$DOMAIN"

# Name (replace EN first, then if RU differs, replace in RU-specific files)
replace_all "Jane Smith" "$NAME"
if [ "$NAME_RU" != "$NAME" ]; then
  # Replace name in Russian pages with RU name
  find . -type f \( -name "*.html" -o -name "*.js" \) \
    -not -path "./en/*" -not -path "./.git/*" \
    -exec sed -i '' "s|${NAME}|${NAME_RU}|g" {} +
  echo "  ✓ Russian name applied"
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

# Update favicon with first letter of name
INITIAL=$(echo "$NAME" | cut -c1 | tr '[:lower:]' '[:upper:]')
cat > favicon.svg << FAVICON
<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48">
  <circle cx="24" cy="24" r="22" fill="#F8401C"/>
  <text x="24" y="32" text-anchor="middle" font-family="system-ui, sans-serif" font-size="24" font-weight="600" fill="white">${INITIAL}</text>
</svg>
FAVICON
echo "  ✓ Favicon updated with initial: $INITIAL"

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
