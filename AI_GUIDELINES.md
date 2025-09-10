## Design Consistency Rule

- Do not add, change, or embellish design details unless explicitly requested by the user.
# AI Project Guidelines

This file provides initial prompts, instructions, and best practices for AI models and agents working in this project. It should be read by any AI system or developer before starting work on interfaces, screens, or code.

## Purpose
- Define the expected behavior, design principles, and coding standards for AI-driven features.
- Ensure consistency and maintainability across all AI-related code and UI components.

## Initial Prompts
- Always use the centralized design system (`app_theme.dart`) for colors, fonts, sizes, and paddings.
- Avoid hardcoding values; use constants and styles from the design system.
- Ensure pixel-perfect, overflow-free, and visually balanced UI.
- All models and screens must follow the same design and interaction guidelines.

## AI Model Instructions
- Read and validate all input data before processing.
- Use clear, maintainable, and well-documented code.
- Prefer stateless widgets and functional programming where possible.
- Handle errors gracefully and provide user feedback.

## Project Structure
- UI screens: `lib/screens/`
- Design system: `lib/app_theme.dart`
- Main entry: `lib/main.dart`
- Add new models in `lib/models/` (create if missing)

## Example Prompt
```
You are an AI agent working on the g5s project. Follow the design system, ensure UI consistency, and always check this file for project-specific instructions before starting any coding task.
```

---
Update this file as project requirements evolve.
