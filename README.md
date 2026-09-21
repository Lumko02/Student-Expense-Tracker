# 🎒 Student Expense Tracker

<p align="center">
  <img src="web/icons/Icon-512.png" width="120" alt="Student Expense Tracker Logo">
</p>

<h3 align="center">Track your money. Understand your spending. Stay in control.</h3>

<p align="center">
  A beginner-friendly Flutter application built to help students record, manage, and understand their everyday expenses.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.44.8-02569B?style=for-the-badge&logo=flutter&logoColor=white">
  <img src="https://img.shields.io/badge/Dart-3.12.2-0175C2?style=for-the-badge&logo=dart&logoColor=white">
  <img src="https://img.shields.io/badge/Platform-Web-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white">
  <img src="https://img.shields.io/badge/Tests-12%20Passing-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Core%20App%20Complete-success?style=for-the-badge">
</p>

---

## 🌱 About the Project

**Student Expense Tracker** is a personal Flutter project designed around a simple problem:

> **Where is all my money going?**

The application allows students to record their daily expenses, organise them into categories, calculate their total spending, manage a budget, and make changes to previously recorded expenses.

The project began as a **Dart command-line application** and was later transformed into a **Flutter application**, introducing a graphical user interface while keeping the original Dart business logic.

The application can run in a desktop browser and can also be accessed from a mobile device, including an **iPhone**, through a local Flutter web server.

---

## ✨ What Can It Do?

| Feature                      | Description                                                                       |
| ---------------------------- | --------------------------------------------------------------------------------- |
| 💰 **Add Expenses**          | Record an expense with a description, amount and category                         |
| 📊 **Track Spending**        | Automatically calculate total expenses                                            |
| 🏷️ **Categories**           | Organise expenses into useful spending categories                                 |
| ✏️ **Edit Expenses**         | Update an existing expense                                                        |
| 🗑️ **Delete Expenses**      | Remove expenses that are no longer needed                                         |
| 🧮 **Budget Logic**          | Calculate spending and remaining budget                                           |
| 💳 **Budget Card**           | Display budget information in a reusable UI component                             |
| 🧾 **Expense Cards**         | Display individual expenses using reusable cards                                  |
| 🌐 **Web App**               | Run the application in a web browser                                              |
| 📱 **Mobile Browser Access** | Access the running application from an iPhone or other device on the same network |

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

The application provides a simple dashboard where users can manage their budget and expenses.

```text
┌──────────────────────────────────────────────┐
│          🎒 Student Expense Tracker          │
├──────────────────────────────────────────────┤
│                                              │
│                 BUDGET                       │
│               R 2 000.00                     │
│                                              │
│              TOTAL EXPENSES                  │
│                R 850.00                      │
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
│ 📚 Textbook                R350.00   ✏️ 🗑️  │
└──────────────────────────────────────────────┘
```

---

## 🧠 How It Works

The project separates the **user interface**, **business logic**, **data**, and reusable **widgets**.

```text
                    ┌──────────────────┐
                    │   Flutter UI     │
                    │  Home Screen     │
                    └────────┬─────────┘
                             │
                 ┌───────────┴───────────┐
                 ▼                       ▼
        ┌─────────────────┐     ┌─────────────────┐
        │   BudgetCard    │     │   ExpenseCard   │
        │     Widget      │     │     Widget      │
        └─────────────────┘     └────────┬────────┘
                                        │
                                        ▼
                               ┌──────────────────┐
                               │ ExpenseManager   │
                               │ Business Logic   │
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

### `ExpenseCard`

A reusable Flutter widget responsible for displaying an individual expense.

This helps keep expense display code separate from the main screen and makes the interface easier to maintain.

### `BudgetCard`

A reusable Flutter widget responsible for displaying budget-related information.

Separating the budget display into its own component keeps the user interface organised and allows the widget to be updated independently.

---

## 🛠️ Built With

| Technology          | Purpose                        |
| ------------------- | ------------------------------ |
| **Dart**            | Application and business logic |
| **Flutter**         | User interface                 |
| **Flutter Web**     | Browser-based application      |
| **Material Design** | UI components                  |
| **Flutter Testing** | Unit and widget testing        |
| **Git & GitHub**    | Version control                |

---

# 🚀 Getting Started

## Prerequisites

You'll need:

* Flutter SDK
* Dart SDK
* Google Chrome or another supported browser
* Git

Check your Flutter installation:

```bash
flutter doctor
```

---

## Clone the Repository

```bash
git clone https://github.com/Lumko02/Student-Expense-Tracker.git
cd Student-Expense-Tracker
```

---

## Install Dependencies

```bash
flutter pub get
```

---

## 🌐 Run in Chrome

Launch the Flutter Web application:

```bash
flutter run -d chrome
```

The application should open automatically in Google Chrome.

You can check which devices Flutter currently detects with:

```bash
flutter devices
```

---

# 📱 Run on an iPhone Through the Local Network

The application can also be opened on an iPhone using Safari while Flutter runs a local web server on the development computer.

> **Note:** This tests the Flutter Web application on an iPhone. It is not the same as compiling and running the native Flutter iOS application through Xcode.

### 1. Connect Both Devices to the Same Network

Make sure the:

```text
💻 Development computer
        +
📱 iPhone
```

are connected to the **same Wi-Fi network**.

---

### 2. Start the Flutter Web Server

From the project directory, run:

```bash
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8081
```

Keep this terminal running while using the application.

If port `8081` is already being used, another available port can be selected.

For example:

```bash
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8082
```

---

### 3. Find the Computer's Local IP Address

On Windows PowerShell or Command Prompt, run:

```powershell
ipconfig
```

Look under the active Wi-Fi adapter for:

```text
IPv4 Address
```

For example:

```text
IPv4 Address . . . . . . . . . : 192.168.0.106
```

Your IP address may be different each time you connect to a network.

---

### 4. Open the Application on the iPhone

Open **Safari** on the iPhone.

Enter the computer's IPv4 address followed by the Flutter web-server port.

For example:

```text
http://192.168.0.106:8081
```

The format is:

```text
http://YOUR-COMPUTER-IP:PORT
```

The Student Expense Tracker should now load on the iPhone. 📱✨

If the page does not load, check that:

* Both devices are connected to the same Wi-Fi network
* The Flutter web server is still running
* The correct IPv4 address is being used
* The correct port is being used
* Windows Firewall allows the connection on the private network

---

## 🍎 Native iOS Development

Opening the application through Safari allows the **web version** to be tested on an iPhone.

Building the application as a native iOS app requires:

```text
Flutter Project
      ↓
    macOS
      ↓
    Xcode
      ↓
   iPhone
```

A Mac with Xcode is required to compile and run the native Flutter iOS version.

---

# 🧪 Testing

The project includes tests for the application's Dart logic and Flutter interface.

Run all tests with:

```bash
flutter test
```

The current test suite contains:

```text
12 tests passing ✅
```

Tests cover functionality including:

* Creating expenses
* Adding expenses
* Calculating totals
* Editing expenses
* Deleting expenses
* Budget calculations
* Category filtering
* Category totals
* Loading the Student Expense Tracker Flutter application

Before running the application, the project can also be checked with:

```bash
flutter analyze
```

A clean analysis currently produces:

```text
No issues found!
```

---

# 📁 Project Structure

```text
Student-Expense-Tracker/
│
├── 📂 lib/
│   ├── expense.dart
│   ├── expense_manager.dart
│   ├── main.dart
│   │
│   ├── 📂 screens/
│   │   └── home_screen.dart
│   │
│   └── 📂 widgets/
│       ├── budget_card.dart
│       └── expense_card.dart
│
├── 📂 test/
│   ├── expense_test.dart
│   ├── expense_manager_test.dart
│   └── widget_test.dart
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

# 🔄 From CLI → Flutter

One of the goals of this project is learning how an existing Dart application can evolve into a graphical application.

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

### Version 2 — Flutter

```text
Browser / Mobile Browser
          │
          ▼
     Flutter UI
          │
          ▼
   Reusable Widgets
          │
          ▼
   ExpenseManager
          │
          ▼
       Expense
```

The underlying expense-management logic remains reusable while the user interface becomes more accessible and interactive.

---

# 🚧 Current Limitations

The application currently stores expenses **in memory**.

That means:

> Refreshing the application = goodbye expenses. 🥲

No database or persistent storage has been implemented yet.

The application can currently be viewed on an iPhone through its web version, but a native iOS build still requires macOS and Xcode.

---

# 🗺️ Roadmap

### 🔜 Next

* [ ] Persistent storage
* [ ] Improve budget management
* [ ] Category filtering
* [ ] Expense search
* [ ] Improve responsive mobile layout

### 🚀 Future

* [ ] Monthly expense reports
* [ ] Spending charts
* [ ] JSON storage
* [ ] SQLite database
* [ ] Flutter Android application
* [ ] Native Flutter iOS application
* [ ] Dark mode

---

# 💡 What I'm Learning

This project is helping me practise:

```text
Dart
  ↓
Object-Oriented Programming
  ↓
Unit Testing
  ↓
Widget Testing
  ↓
Flutter
  ↓
Reusable UI Components
  ↓
State Management
  ↓
Web Development
  ↓
Responsive Design
  ↓
Application Architecture
```

More importantly, it gives me a place to experiment, break things, fix them, and understand **why** they work.

---

# 👤 Author

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
