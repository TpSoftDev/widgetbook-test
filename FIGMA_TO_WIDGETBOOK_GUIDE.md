# Figma to Widgetbook: Complete Workflow Guide

## 🎯 What You're Looking At

You have a **Figma Input Component** with comprehensive variations:

### Component Structure:
```
Input Component
├── Label (optional, above)
├── Input Field
│   ├── Left Icon (optional)
│   ├── Placeholder/Text
│   └── Right Icon (optional)
└── Supporting Text (optional, below)
```

### Variations Found in Figma:

**Sizes:**
- Medium (height: 48px/68px)
- Large (height: 56px/76px)

**States:**
- Hint (placeholder visible)
- Focused (input focused)
- Filled (with text)
- Disabled
- Error

**Icon Positions:**
- Left
- Right
- None

**With/Without Icon:**
- Has icon (left or right)
- No icon

### Design Tokens (from Figma Variables):

**Colors:**
- `inputLabel`: #1f1f1f
- `inputTextHint`: #9e9e9e
- `inputSurface`: #fdfbf5
- `inputOutline`: rgba(31, 31, 31, 0.2)
- `inputOutlineFocused`: #57ccf2
- `inputText`: #1f1f1f
- `inputSurfaceError`: #ffe3e0
- `inputOutlineError`: #fe6f61
- `inputSupportingTextError`: #fe6f61
- `inputTextDisabled`: #9e9e9e
- `inputSurfaceDisabled`: #ebebeb
- `inputOutlineDisabled`: #9e9e9e

**Typography:**
- Font: Poppins
- Label: 14px, weight 500, line-height 18px
- Input Text: 20px, weight 500, line-height 24px
- Supporting Text: 12px, weight 500, line-height 16px

**Spacing:**
- Padding XS: 8px
- Padding S: 12px
- Padding M: 16px
- Gap XXS: 4px

**Border Radius:**
- borderRadiusS: 8px

---

## 📋 Step-by-Step Workflow

### Step 1: Create the Flutter Input Widget

**File:** `lib/widgets/input_field.dart`

**Properties to extract from Figma:**
- `label` (String?)
- `hintText` (String?)
- `controller` (TextEditingController?)
- `size` (InputSize: Medium, Large)
- `state` (InputState: Hint, Focused, Filled, Disabled, Error)
- `leftIcon` (IconData?)
- `rightIcon` (IconData?)
- `supportingText` (String?)
- `onChanged` (ValueChanged<String>?)
- `onSubmitted` (ValueChanged<String>?)

### Step 2: Create Widgetbook Stories

**File:** `widgetbook/lib/input_field_stories.dart`

**Stories to create (based on Figma variations):**
1. Medium - Hint (no icon)
2. Medium - Hint (left icon)
3. Medium - Hint (right icon)
4. Medium - Focused
5. Medium - Filled
6. Medium - Disabled
7. Medium - Error
8. Large - Hint
9. Large - Focused
10. Large - Filled
11. Large - Disabled
12. Large - Error

### Step 3: Document for Developers

**What to document:**
1. Component API (all properties)
2. Usage examples
3. Design tokens (colors, spacing, typography)
4. State variations
5. Code examples

### Step 4: Integrate with Zeroheight

**What to add to Zeroheight:**
1. Figma embed (design reference)
2. Widgetbook embed (live component)
3. Code snippets
4. Usage guidelines
5. Design tokens

---

## 🎨 Component Implementation Strategy

### Approach 1: Match Figma Exactly
- Replicate all visual details precisely
- Use exact colors, spacing, typography
- Match all states and variations

### Approach 2: Flutter Material Design
- Use Flutter's TextField with custom styling
- Adapt Figma design to Material patterns
- Maintain visual consistency

### Approach 3: Hybrid
- Use Flutter Material as base
- Customize to match Figma design
- Best of both worlds

---

## 📝 Documentation Structure

### For Developers (in Code):
1. **Widget documentation** (dartdoc comments)
2. **Story documentation** (usage examples)
3. **Inline comments** (complex logic)

### For Zeroheight:
1. **Component Overview**
2. **Design Specs** (Figma embed)
3. **Live Demo** (Widgetbook embed)
4. **Code Examples**
5. **API Reference**
6. **Design Tokens**
7. **Usage Guidelines**

---

## 🚀 Next Steps

1. **Create the Input widget** - Implement all variations
2. **Create Widgetbook stories** - Show all states
3. **Document the component** - Code comments + README
4. **Set up Zeroheight** - Add design + code + live demo
5. **Test with team** - Get feedback from designers and developers

---

## 💡 Key Insights

1. **Figma is the source of truth** - Design comes first
2. **Widgetbook shows it live** - Developers can see and test
3. **Code is the implementation** - Actual usage in app
4. **Zeroheight ties it all together** - Design + Code + Docs

---

## ❓ Questions to Answer

1. **Do you want exact Figma match or Material adaptation?**
2. **Which variations are most important?**
3. **How detailed should the documentation be?**
4. **What's your Zeroheight setup?** (Do you have access?)

---

**Ready to start?** Let's begin with creating the Input widget based on the Figma design!

