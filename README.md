# Widgetbook Learning Guide - Step by Step

## 🎯 What You'll Learn
By the end of this guide, you'll understand:
1. What Widgetbook is and why it's useful
2. How to create widgets for your app
3. How to create "stories" (different variations) of your widgets
4. How to view and interact with your widgets in Widgetbook
5. How to use advanced features like knobs (interactive controls)

---

## 📚 Step 1: Understanding the Basics

### What is Widgetbook?
Widgetbook is like a **catalog or gallery** for your Flutter widgets. Think of it like:
- A **showroom** where you can see all your widgets in one place
- A **storybook** where each "story" shows a different state/variation of your widget
- A **testing ground** where you can interact with widgets without running your full app

### Key Concepts:

1. **Widget** - Your actual Flutter widget (like `CustomButton`)
2. **Story/UseCase** - A specific variation or state of your widget
   - Example: "Primary Button", "Loading Button", "Disabled Button"
3. **Widgetbook App** - A separate app that displays all your stories
4. **Annotation** - Special code tags (`@widgetbook.UseCase`) that mark your stories

### Why Use Widgetbook?
- ✅ **Isolated Testing** - Test widgets without running your full app
- ✅ **Documentation** - Visual documentation of all your widgets
- ✅ **Design Review** - Show designers and stakeholders all widget variations
- ✅ **Quick Iteration** - See changes instantly without navigating through your app

---

## 🎓 Step 2: Your First Widget (Practice)

### Task: Create a Simple Card Widget

Let's create a new widget from scratch so you understand the full process.

**Instructions:**
1. Create a new file: `lib/widgets/user_card.dart`
2. Create a `UserCard` widget that displays:
   - A user's name
   - A user's email
   - An optional avatar/icon
   - A background color (optional)

**Think about:**
- What properties should this widget have?
- What should it look like?
- How should it be structured?

**When you're ready, let me know and I'll help you create it!**

---

## 📝 Step 3: Creating Stories (UseCases)

### What is a Story?
A story is a **specific configuration** of your widget. Each story shows your widget in a different state or with different properties.

### Example from your code:
```dart
@widgetbook.UseCase(name: 'Primary Button', type: CustomButton)
Widget buildPrimaryButton(BuildContext context) {
  return CustomButton(
    text: 'Click Me',
    onPressed: () {
      print('Button clicked!');
    },
  );
}
```

**Breaking it down:**
- `@widgetbook.UseCase` - This annotation tells Widgetbook "this is a story"
- `name: 'Primary Button'` - The name shown in Widgetbook
- `type: CustomButton` - Which widget this story is for
- The function returns an instance of your widget with specific properties

---

## 🚀 Step 4: Running Widgetbook

### How to Run:
1. Navigate to the `widgetbook` folder: `cd widgetbook`
2. Generate the code: `flutter pub run build_runner build --delete-conflicting-outputs`
3. Run the app: `flutter run -d chrome` (or any device)

**What happens:**
- Widgetbook scans all your `@widgetbook.UseCase` annotations
- It generates a navigation structure
- It displays all your stories in a beautiful UI

---

## 🎛️ Step 5: Adding Interactive Controls (Knobs)

### What are Knobs?
Knobs let you **interactively change** widget properties in Widgetbook without editing code!

### Example:
Instead of creating 10 different stories for 10 different colors, you can create ONE story with a color knob that lets you pick any color!

**This is advanced - we'll cover this after you master the basics!**

---

## ✅ Progress Checklist

- [ ] Step 1: Read and understand the basics
- [ ] Step 2: Create your first widget (UserCard)
- [ ] Step 3: Create stories for your widget
- [ ] Step 4: Run Widgetbook and see your widget
- [ ] Step 5: Add knobs for interactivity

---

## 🎯 Next Steps

After you complete each step, **tell me when you're ready** and I'll:
1. Review what you created
2. Explain any concepts you're unsure about
3. Guide you to the next step
4. Help you understand the "why" behind each part

**Ready to start? Let's begin with Step 2!**

