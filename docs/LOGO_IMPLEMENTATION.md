# 🦈 AXOLOP Logo Implementation Guide

## Overview

This document outlines the proper implementation of the Axolop logo across the Shopify theme, ensuring brand consistency and Shopify compatibility.

## Logo Asset

- **File:** `assets/images/axolop-logo.png`
- **Description:** Orange shark icon on black background
- **Usage:** Primary brand logo for all applications
- **Format:** PNG with transparent background support

## Shopify Implementation

### Header Logo Implementation

The logo is implemented directly in `sections/header.liquid` using Shopify's asset URL system:

```liquid
{%- assign axolop_logo = 'images/axolop-logo.png' | asset_url -%}
<img src="{{ axolop_logo }}"
     alt="{{ shop.name | escape }}"
     class="header__heading-logo header__heading-logo--main"
     width="{{ settings.logo_width }}"
     height="{{ settings.logo_width | divided_by: 2.5 }}"
     loading="eager">
```

### Key Implementation Details

1. **Asset URL Format:** Always use `'images/axolop-logo.png' | asset_url`
2. **No Text Fallback:** Logo image is required - no fallback to shop name text
3. **Responsive Sizing:**
   - Desktop: 100px width (from `settings.logo_width`)
   - Mobile: 90px width (from `settings.mobile_logo_width`)
   - Aspect ratio: 2.5:1 (width divided by 2.5 for height)
4. **Performance:** `loading="eager"` for above-the-fold logo display

## Brand Guidelines

### Logo Usage Rules

- ✅ **Always use the image file** - never display "axolop" as text
- ✅ **Maintain aspect ratio** - 2.5:1 ratio is enforced
- ✅ **Use proper Shopify asset URLs** - ensures CDN optimization
- ✅ **Include proper alt text** - uses shop name for accessibility

### Prohibited Usage

- ❌ **Never use text-based logo** - "axolop" text should not appear
- ❌ **Don't modify the logo file** - keep original `axolop-logo.png`
- ❌ **Avoid inline styling** - use CSS classes for customization
- ❌ **Don't use external URLs** - always use Shopify asset system

## Technical Specifications

### File Requirements

- **Location:** `assets/images/axolop-logo.png`
- **Format:** PNG with transparency support
- **Optimization:** Compressed for web delivery
- **Accessibility:** Proper alt text implementation

### CSS Classes

```css
.header__heading-logo {
  /* Logo styling handled by theme */
}

.header__heading-logo--main {
  /* Primary logo display */
}
```

## Shopify Compatibility

### Asset URL System

The implementation uses Shopify's native asset URL system for:

- **CDN Optimization:** Automatic CDN delivery
- **Caching:** Proper cache headers
- **Performance:** Optimized asset delivery
- **Security:** Shopify's secure asset handling

### Theme Integration

- **Settings Integration:** Uses `settings.logo_width` and `settings.mobile_logo_width`
- **Responsive Design:** Automatic mobile/desktop sizing
- **Theme Compatibility:** Works with all Shopify Online Store 2.0 themes

## Maintenance

### Updates

When updating the logo:

1. Replace `assets/images/axolop-logo.png` with new file
2. Maintain same filename for compatibility
3. Test responsive sizing across devices
4. Verify asset URL generation works correctly

### Troubleshooting

**Logo not displaying:**

- Check file exists in `assets/images/axolop-logo.png`
- Verify asset URL format: `'images/axolop-logo.png' | asset_url`
- Check browser console for 404 errors

**Logo sizing issues:**

- Verify `settings.logo_width` and `settings.mobile_logo_width` values
- Check aspect ratio calculation (width ÷ 2.5)
- Test responsive breakpoints

## Brand Consistency

This implementation ensures:

- **Consistent branding** across all pages
- **Professional appearance** matching Axolop's premium positioning
- **Technical excellence** aligned with pro-audio industry standards
- **Shopify best practices** for optimal performance and compatibility

---

**Last Updated:** 2025-01-27  
**Version:** 1.0.1  
**Maintainer:** AXOLOP Development Team
