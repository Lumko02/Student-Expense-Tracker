# 🎒 Student Expense Tracker

<p align="center">
  <img src="web/icons/Icon-512.png" width="120" alt="Student Expense Tracker Logo">
</p>

<h3 align="center">Track your money. Understand your spending. Stay in control.</h3>

<p align="center">
  A beginner-friendly Flutter Web application built to help students record, manage, and understand their everyday expenses.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.44.8-02569B?style=for-the-badge&logo=flutter&logoColor=white">
  <img src="https://img.shields.io/badge/Dart-3.12.2-0175C2?style=for-the-badge&logo=dart&logoColor=white">
  <img src="https://img.shields.io/badge/Platform-Web-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white">
  <img src="https://img.shields.io/badge/Status-In%20Progress-F59E0B?style=for-the-badge">
</p>

---

## 🌱 About the Project

**Student Expense Tracker** is a personal Flutter project designed around a simple problem:

> **Where is all my money going?**

The application allows students to record their daily expenses, organise them into categories, calculate their total spending, and make changes to previously recorded expenses.

The project began as a **Dart command-line application** and was later transformed into a **Flutter Web application**, introducing a graphical user interface while keeping the original Dart business logic.

---

## ✨ What Can It Do?

| Feature                 | Description                                               |
| ----------------------- | --------------------------------------------------------- |
| 💰 **Add Expenses**     | Record an expense with a description, amount and category |
| 📊 **Track Spending**   | Automatically calculate total expenses                    |
| 🏷️ **Categories**      | Organise expenses into useful spending categories         |
| ✏️ **Edit Expenses**    | Update an existing expense                                |
| 🗑️ **Delete Expenses** | Remove expenses that are no longer needed                 |
| 🧮 **Budget Logic**     | Calculate spending and remaining budget                   |
| 🌐 **Web App**          | Run the application directly in Chrome                    |

### Categories

```text
🍔 Food
🚌 Transport
🎬 Entertainment
📚 Study
📦 Other
```

---

## 🖥️ The Application

The application provides a simple dashboard where users can:

```text
┌──────────────────────────────────────────────┐
│          🎒 Student Expense Tracker          │
├──────────────────────────────────────────────┤
│                                              │
│              TOTAL EXPENSES                  │
│                 R 850.00                    │
│                                              │
├──────────────────────────────────────────────┤
│  Description                                 │
│  ┌────────────────────────────────────────┐  │
│  │ Lunch                                  │  │
│  └────────────────────────────────────────┘  │
│                                              │
│  Amount                                      │
│  ┌────────────────────────────────────────┐  │
│  │ 50.00                                  │  │
│  └────────────────────────────────────────┘  │
│                                              │
│  Category                                    │
│  ┌────────────────────────────────────────┐  │
│  │ Food                              ▼    │  │
│  └────────────────────────────────────────┘  │
│                                              │
│           ＋ ADD EXPENSE                     │
│                                              │
├──────────────────────────────────────────────┤
│ 🍔 Lunch                    R50.00   ✏️ 🗑️  │
│ 🚌 Taxi                     R30.00   ✏️ 🗑️  │
│ 📚 Textbook               R350.00   ✏️ 🗑️  │
└──────────────────────────────────────────────┘
```

---

## 🧠 How It Works

The project separates the **user interface**, **business logic**, and **data**.

```text
                    ┌──────────────────┐
                    │   Flutter UI     │
                    │    main.dart     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ ExpenseManager   │
                    │  Business Logic  │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │     Expense      │
                    │      Object      │
                    └──────────────────┘
```

### `Expense`

Represents one expense.

```dart
Expense(
  'Lunch',
  50.00,
  'Food',
);
```

Each expense contains:

* `description`
* `amount`
* `category`

### `ExpenseManager`

Responsible for managing expenses and performing calculations.

```dart
addExpense()
deleteExpense()
editExpense()
calculateTotal()
calculateRemainingBudget()
getExpensesByCategory()
calculateCategoryTotal()
```

This keeps the application's core logic separate from the Flutter UI.

---

## 🛠️ Built With

<p align="center">

| Technology          | Purpose                   |
| ------------------- | ------------------------- |
| **Dart**            | Application logic         |
| **Flutter**         | User interface            |
| **Flutter Web**     | Browser-based application |
| **Material Design** | UI components             |
| **Dart Testing**    | Unit testing              |
| **Git & GitHub**    | Version control           |

</p>

---

## 🚀 Getting Started

### Prerequisites

You'll need:

* Flutter SDK
* Dart SDK
* Google Chrome
* Git

Check your Flutter installation:

```bash
flutter doctor
```

---

### Clone the Repository

```bash
git clone https://github.com/Lumko02/Student-Expense-Tracker.git
```

```bash
cd Student-Expense-Tracker
```

---

### Install Dependencies

```bash
flutter pub get
```

---

### Run the Application

Launch the Flutter Web application:

```bash
flutter run -d chrome
```

The application will open automatically in Google Chrome.

---

## 🧪 Testing

The project includes unit tests for the application's core Dart classes.

Run the tests with:

```bash
flutter test
```

The tests cover functionality including:

* Creating expenses
* Adding expenses
* Calculating totals
* Editing expenses
* Deleting expenses
* Budget calculations
* Category filtering
* Category totals

---

## 📁 Project Structure

```text
Student-Expense-Tracker/
│
├── 📂 lib/
│   ├── expense.dart
│   ├── expense_manager.dart
│   └── main.dart
│
├── 📂 test/
│   ├── expense_test.dart
│   └── expense_manager_test.dart
│
├── 📂 web/
│   ├── index.html
│   ├── manifest.json
│   └── icons/
│
├── 📄 analysis_options.yaml
├── 📄 pubspec.yaml
├── 📄 pubspec.lock
├── 📄 README.md
└── 📄 .gitignore
```

---

## 🔄 From CLI → Flutter Web

One of the goals of this project was learning how an existing Dart application can evolve into a graphical application.

### Version 1 — Dart CLI

```text
Terminal
   │
   ▼
User Input
   │
   ▼
ExpenseManager
   │
   ▼
Expense
```

### Version 2 — Flutter Web

```text
Browser
   │
   ▼
Flutter UI
   │
   ▼
ExpenseManager
   │
   ▼
Expense
```

The underlying expense-management logic remains reusable while the user interface becomes more accessible and interactive.

---

## 🚧 Current Limitations

The application currently stores expenses **in memory**.

That means:

> Refreshing the browser = goodbye expenses. 🥲

No database or persistent storage has been implemented yet.

---

## 🗺️ Roadmap

### 🔜 Next

* [ ] Persistent storage
* [ ] Budget input interface
* [ ] Remaining budget display
* [ ] Category filtering
* [ ] Expense search

### 🚀 Future

* [ ] Monthly expense reports
* [ ] Spending charts
* [ ] JSON storage
* [ ] SQLite database
* [ ] Responsive mobile layout
* [ ] Flutter Android application
* [ ] Dark mode

---

## 💡 What I'm Learning

This project is helping me practise:

```text
Dart
  ↓
Object-Oriented Programming
  ↓
Unit Testing
  ↓
Flutter
  ↓
State Management
  ↓
Web Development
  ↓
Application Architecture
```

More importantly, it gives me a place to experiment, break things, fix them, and understand **why** they work.

---

## 👤 Author

<p align="center">
  <strong>Lumko Saneliso Majozi</strong>
  <br>
  Software Engineering Student
  <br><br>
  <a href="https://github.com/Lumko02">GitHub</a>
  •
  <a href="https://www.linkedin.com/in/lumko-majozi-1656b6240/">LinkedIn</a>
</p>

---

<p align="center">
  <strong>Built with Dart & Flutter 💜</strong>
  <br>
  <sub>Learning by building.</sub>
</p>


