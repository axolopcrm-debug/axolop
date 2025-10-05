# 🧠 AXOLOP Analyzer Website

**Project Name:** AXOLOP Analyzer Website  
**Platform:** Shopify (Online Store 2.0 Theme, customized + optimized for CRO)  
**Purpose:** Launch the first Axolop plugin — a next-generation audio analyzer — as a free 30-day lead magnet and flagship proof of quality for the Axolop brand.

This site functions as both:

1. A **marketing funnel** optimized for conversions, email capture, and MRR growth (Klaviyo, subscription upsells, A/B testing).
2. A **brand experience** that defines Axolop's aesthetic and credibility in the pro-audio world.

---

## 🎛️ The Analyzer Product

**Codename:** AXOLOP A1  
**Goal:** The most advanced, usable, and visually beautiful audio analyzer on the market.

### Product Principles

- Outperforms **MiniMeters**, **SPAN Plus**, and **Youlean Loudness Meter** in clarity, accuracy, and interface.
- Designed for **pro-audio engineers**, **mixers**, and **producers** who need both usability and precision.
- Works **inside a DAW (VST/AU)** and as a **standalone desktop app**.
- Offers **deep-level metrics** normally spread across multiple tools:
  - LUFS, RMS, Peak, True Peak, Dynamic Range
  - Phase correlation, stereo width, and mid/side analysis
  - Spectral analysis with adjustable FFT sizes and slopes
  - Multi-band histograms, EBU R128 graphs, and exportable reports
- Simple by default → complex on demand. The best UI for both beginners and professionals.

**Tagline:** _"The Analyzer That Replaces Them All."_

---

## 🧩 Website Architecture (Shopify)

**Theme Type:** Online Store 2.0  
**Tech Stack Includes:**

- **Liquid + JSON Templates** for modular sections
- **Klaviyo** integration for lead capture, email automation, and trial nurturing
- **Subscription app** (Recharge or Appstle) for "Axolop Club"
- **Digital delivery app** (SendOwl, Sky Pilot, or Mechanic) for license delivery
- **PostHog** for event tracking (`trial_started`, `license_sent`, `upgrade_clicked`)
- **SEO:** JSON-LD `SoftwareApplication` schema, alt text, and performance-optimized assets
- **CRO:** sticky CTA, comparison table, A/B hero sections, trust indicators, and reviews.

**Page Template:** `page.analyzer.json`  
**Sections used:**
`slideshow-hero`, `comparison-table`, `pricing-table`, `Ultimate-Reviews`, `Tiktok-Videos`, `vertical-ticker`, `trustpilot-reviews`, `icons-with-content`, `faq`, `newsletter`.

**Primary Flow:**
Hero CTA → Free Trial (email/license) → Nurture → Upgrade to Subscription

---

## 🧱 Brand Identity

**Brand Name:** AXOLOP  
**Industry:** Professional Audio Software  
**Long-Term Goal:** Compete directly with **Waves Audio** and **UAD**, but earn the reputation of **FabFilter**.

### Brand Pillars

1. **Pro-first, not prosumer.** Built for real engineers and mixers.
2. **Brutal usability.** Every control exists for a reason. Zero clutter.
3. **Aesthetic minimalism.** Modern black/white interface with a unique orange accent.
4. **Authentic trust.** Transparent DSP, real benchmark data, and open changelogs.
5. **Global presence.** Partnered studios, influencer reviews, education licensing, and community.

### Tone & Copy

- Confident, technical, and calm.
- Speak like a seasoned audio engineer, not a marketer.
- Avoid superlatives unless backed by data.
- When making claims, _show numbers or visuals_.

### Visual Identity

| Element                | Specification                                  |
| ---------------------- | ---------------------------------------------- |
| Primary Background     | #0B0B0C                                        |
| Text                   | #FFFFFF                                        |
| Accent (Axolop Orange) | #FF6A00                                        |
| Secondary Panel        | #1E1E22                                        |
| Muted Text             | #A7A7AD                                        |
| Fonts                  | Söhne / Space Grotesk / Inter / JetBrains Mono |
| UI Shape               | Soft 6–8px corners, 8/12pt grid system         |
| Iconography            | Thin-line, high-contrast numerics              |

---

## 🧭 Positioning Summary

**Market:** Professional and semi-professional audio engineers, mastering houses, producers.  
**Segment Gap:** Existing analyzers are either overly complex (SPAN) or too basic (MiniMeters). Axolop bridges both worlds.  
**Revenue Model:** Subscription-first, freemium entry → MRR and retention-driven model.  
**Distribution Strategy:**

- Free analyzer as lead magnet
- Bundle releases (AXL-A1, AXL-D1, AXL-C1, etc.)
- Influencer partnerships and studio collaborations
- Educational licensing and referral bonuses

---

## 🚀 Development & Deployment

### Quick Start

```bash
# Install dependencies
npm install

# Start development server
shopify theme dev

# Deploy to Shopify
./scripts/deploy.sh v1.0.0 "Initial release"
```

### Deployment Process

Every deploy creates a **Git backup** with today's date + semantic version, pushes to **GitHub**, and then deploys to **Shopify** from the repo.

**Versioning:**

- **Semantic tag:** `vMAJOR.MINOR.PATCH` (e.g., `v1.3.0`)
- **Release branch:** `release/vMAJOR.MINOR.PATCH`
- **Backup tag (dated):** `backup/YYYY-MM-DD-vMAJOR.MINOR.PATCH`

### Development Rules

1. All Shopify code changes must be **clean, modular, and section-based**.
2. No inline scripts for tracking; use theme.liquid or JSON templates.
3. Prioritize **load speed, conversion rate, and design cohesion**.
4. Maintain **brand color (#FF6A00)** for all accent states (hover, active, button).
5. Optimize for **Klaviyo lead capture** and **trial conversion** first—sales second.
6. Always reference Axolop as a **premium pro-audio company** — not a consumer plugin shop.
7. Keep tone consistent with brands like FabFilter, Soundtoys, and Universal Audio.

---

## 🧩 Folder Structure

```
axolop-site/
├── assets/                   # Compiled/static assets (CSS, JS, fonts, images)
├── config/                   # Shopify configuration files
├── layout/                   # Global HTML templates
├── locales/                  # Translations
├── sections/                 # Modular building blocks (Shopify OS 2.0)
├── snippets/                 # Smaller reusable components
├── templates/                # Page JSON templates (OS 2.0)
├── scripts/                  # Deployment scripts
└── .cursor/                  # Cursor project context + rules
```

---

## 🔌 Integrations & Events

### Klaviyo

- Install via app + site snippet in `theme.liquid`.
- Track: `trial_started`, `license_issued`, `upgrade_clicked`, `club_subscribed`.
- Lists/segments: `analyzer_trial`, `club_members`, `high_intent`.

### Subscriptions (Recharge/Appstle)

- SKU: **Axolop Club** (monthly/annual).
- Cart/checkout: ensure drawer supports subscription line items and $0 trials (if used).

### Digital Delivery & Licensing

- Attach installers/keys to the `$0 trial` and paid products.
- Expiry/renewal webhooks → tag users (`trial_expired`, `license_revoked`) and email via Klaviyo.
- Use Mechanic (optional) for license rotation, tagging, and trial reminders.

### Analytics & CRO

- **GA4**, **Meta**, **TikTok** pixels in `theme.liquid`.
- **PostHog (optional):** only if light; track the 4 events above.
- **A/B testing:** prefer server-side via app; if client-side, ensure no CLS and cache-safety.
- **JSON-LD**: `SoftwareApplication` for analyzer product/page.

---

## 🧪 QA & Checklists

**Functional**

- All CTAs resolve (Hero, sticky, pricing, final).
- Trial flow: add to cart → license email → thank-you page with install steps.
- Subscription purchase works with drawer + checkout.

**UX**

- Mobile-first: hero fits ≤ 640px, sticky CTA not overlapping.
- Comparison table scrolls on mobile with shadow affordance.
- Video sections lazy-load and have poster images.

**Performance**

- LCP ≤ 1.0s on desktop, ≤ 1.8s on mobile for landing page.
- Image weights optimized; JS under control (no >150KB uncompressed per page).
- No console errors, 0 broken links.

**SEO**

- Unique `<title>`, `<meta name="description">`.
- Canonical tag set; alt text present; JSON-LD validates.

**Accessibility**

- Keyboard nav full; visible focus states; landmarks (header, main, footer).

---

## 💡 North Star Metric

**Conversion Focus:**

- Free Trial → Subscription
- Analyzer → Axolop Club retention
- Maintain <1s LCP for the landing page
- Target 7%+ landing conversion rate

---

## 🏁 Brand Reminder

Whenever editing, writing, or generating for this project:

- Treat Axolop as a **global pro-audio brand** competing with the industry's elite.
- Prioritize **clarity, credibility, and conversion** equally.
- Never use gimmicky language—use technical elegance.
- Always build toward scalability: MRR, brand trust, and plugin suite expansion.

---

## 📄 License

This project is proprietary to AXOLOP. All rights reserved.

<!-- Updated: Comprehensive documentation for AXOLOP Analyzer Website -->
