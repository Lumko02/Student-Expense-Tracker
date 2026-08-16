<p align="center">
  <img alt="Dart" src="https://img.shields.io/badge/Dart-Programming-0175C2?style=flat-square" />
  <img alt="Status" src="https://img.shields.io/badge/Status-Work_in_progress-yellow?style=flat-square" />
</p>

# 🎒 STUDENT EXPENSE TRACKER

A beginner CLI app in Dart to track expenses and manage a monthly budget.

---

## ✨ Quick Links

- [Features](#features)
- [Install](#install)
- [Usage](#usage)
- [Examples](#examples)
- [Testing](#testing)
- [Project Structure](#project-structure)
- [Roadmap](#roadmap)

---

## 🚀 Features

- Set a monthly budget
- Add an expense (description, amount, category)
- View recorded expenses
- View total spent and remaining budget
- Delete an expense via its index

---

## 🛠 Install

1. Install the Dart SDK: https://dart.dev/get-dart
2. From the project root, fetch dependencies:

```bash
dart pub get
```

---

## ▶️ Usage

Run the app from the project root:

```bash
dart run
```

Or run the main script directly:

```bash
dart run bin/student_expense_tracker.dart
```

Follow the interactive menu to set a budget, add expenses, view summaries, or delete entries.

---

## 🧾 Examples

```
=============================
     STUDENT EXPENSE TRACKER
=============================

1. Set budget
2. Add expense
3. View expenses
4. View total spent
5. View remaining budget
6. Delete expense
7. Exit

Choose an option:
```

When adding an expense you'll be prompted for a description, amount (numbers only), and a category (e.g., Food, Transport).

---

## ✅ Testing

Run unit tests under `test/`:

```bash
dart test
```

---

## 📁 Project Structure

```
student_expense_tracker/
├── bin/
│   └── student_expense_tracker.dart
├── lib/
│   └── expense.dart
├── test/
│   └── expense_test.dart
├── pubspec.yaml
└── README.md
```

---

## 🛣 Roadmap

- Edit expenses
- Category filters and search
- Persistent storage (JSON, SQLite)
- Monthly reports and charts
- Flutter UI for mobile

---

## ✍️ Author

Lumko Saneliso Majozi

