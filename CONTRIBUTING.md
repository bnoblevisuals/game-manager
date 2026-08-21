# Contributing to Game Manager

## Project Naming Conventions

### Java
- Classes: PascalCase
  - Example: TaskService
- Methods and variables: camelCase
  - Example: getTaskById
- Constants: UPPER_SNAKE_CASE
  - Example: MAX_TASKS

### React
- Components: PascalCase
  - Example: TaskList
- Variables and functions: camelCase
  - Example: handleTaskUpdate

### Database
- Tables: snake_case
  - Example: project_tasks
- Columns: snake_case
  - Example: created_at

## Git Branch Conventions

Branches should use the following format:

feature/<short-description>
fix/<short-description>
docs/<short-description>
refactor/<short-description>

Examples:
- feature/task-management
- fix/login-validation
- docs/update-readme
- refactor/task-service

## Git Commit Conventions

Commits should use the following format:

<type>: <short description>

Types:
- feat: New functionality
- fix: Bug fixes
- docs: Documentation changes
- refactor: Code restructuring without changing behavior
- test: Adding or changing tests
- chore: Setup, configuration, dependencies, or maintenance

Example:

docs: add initial README