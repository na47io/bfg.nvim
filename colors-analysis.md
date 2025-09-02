# BFG Color Palette Analysis

## Core Color Palette

### Primary Colors
- **bg**: `#022B2B` - Deep teal-green, main background
- **fg**: `#C2BDA1` - Warm beige, primary text color
- **gray**: `#4a5a5a` - Medium gray, secondary text/borders
- **green**: `#6b8b6b` - Muted sage green, accents
- **dark_teal**: `#37C8BC` - Bright teal, strings
- **yellow**: `#d4d4aa` - Soft yellow, warnings/todos
- **red**: `#d75f5f` - Soft red, errors
- **white**: `#ffffff` - Pure white, statements/keywords
- **teal**: `#90E0D6` - Light teal, numbers/constants
- **light_green**: `#A8EFAB` - Light green, types
- **bright_green**: `#3fdf1f` - Vibrant green, comments

### UI Colors
- **bg_soft**: `#213131` - Slightly lighter background, cursor line
- **bg_hard**: `#0a1b1b` - Darker background variant
- **bg_statusline**: `#2a3b3b` - Status bar background
- **bg_visual**: `#2a4a4a` - Visual selection background
- **bg_search**: `#3a4a3a` - Search highlight background
- **bg_float**: `#2B2B02` - Floating window background

## Color Usage Map

### Syntax Highlighting
- **Comments**: `#3fdf1f` (bright_green) - High contrast for readability
- **Strings**: `#37C8BC` (dark_teal) - Distinctive blue-green
- **Numbers**: `#90E0D6` (teal) - Light teal for constants
- **Keywords/Statements**: `#ffffff` (white) - Maximum contrast
- **Types**: `#A8EFAB` (light_green) - Soft green distinction
- **Functions/Identifiers**: `#C2BDA1` (fg) - Same as text for minimal distraction

### UI Elements
- **Normal Text**: `#C2BDA1` (fg) on `#022B2B` (bg)
- **Line Numbers**: `#4a5a5a` (gray)
- **Status Line**: `#C2BDA1` (fg) on `#2a3b3b` (bg_statusline)
- **Visual Selection**: `#2a4a4a` (bg_visual)
- **Search Highlights**: `#3a4a3a` (bg_search)

### Tmux Integration
- **Status Bar**: `#C2BDA1` (fg) on `#2a3b3b` (bg_statusline)
- **Active Window**: `#C2BDA1` (fg) on `#022B2B` (bg)
- **Inactive Window**: `#4a5a5a` (gray) on `#2a3b3b` (bg_statusline)
- **Active Pane Border**: `#6b8b6b` (green)
- **Inactive Pane Border**: `#4a5a5a` (gray)

## Color Theory Notes

### Base Harmony
- Built on a **monochromatic teal foundation** (`#022B2B`, `#2a3b3b`, `#37C8BC`)
- **Complementary warm accent** with beige (`#C2BDA1`) for text
- **Analogous greens** for natural, calming feel

### Contrast Strategy
- **High contrast** for essential elements (white keywords, bright green comments)
- **Medium contrast** for secondary elements (gray line numbers)
- **Low contrast** for minimal distraction (functions same as text color)

### Psychological Impact
- **Teal/Green base**: Calming, focused, natural
- **Warm beige text**: Comfortable for extended reading
- **Minimal color variety**: Reduces cognitive load
- **Strategic brightness**: Bright green comments draw attention to documentation