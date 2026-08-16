A beginner-friendly command-line application built with Dart that helps students manage their budget and keep track of their daily expenses.

📌 Project Overview

Managing money as a student can be difficult, especially when small expenses add up throughout the month.

The Student Expense Tracker allows users to:

Set a monthly budget
Add expenses
View all recorded expenses
Calculate total spending
Check their remaining budget
Delete expenses
Exit the application

The project is designed to practise fundamental Dart programming and Object-Oriented Programming (OOP) concepts.

🎯 Learning Objectives

By completing this project, I aim to practise:

Variables and data types
Conditional statements
Loops
Functions
Lists
Classes and objects
Constructors
Methods
User input
Error handling
Object-Oriented Programming
Unit testing
🛠️ Technologies
Dart
Dart SDK
Dart testing framework
Command Line Interface (CLI)
📂 Project Structure
student_expense_tracker/
│
├── bin/
│   └── student_expense_tracker.dart
│
├── lib/
│   └── expense.dart
│
├── test/
│   └── expense_test.dart
│
├── pubspec.yaml
└── README.md
⚙️ Features
1. Set Budget

The user can enter their monthly budget.

Example:

Enter your monthly budget: R2000
2. Add Expense

The user can record an expense by entering:

Description
Amount
Category

Example:

Expense description: Lunch
Amount: R50
Category: Food


Expense added successfully!
3. View Expenses

The user can see all their recorded expenses.

Example:

--------- EXPENSES ---------


1. Transport - R35 - Transport
2. Lunch     - R50 - Food
3. Data      - R99 - Internet


Total expenses: R184
4. View Budget Summary

The application calculates how much the user has spent and how much money remains.

Example:

Budget:       R2000
Spent:        R184
Remaining:    R1816
5. Delete Expense

The user can remove an expense from their list.

Example:

Enter expense number to delete: 2


"Lunch" deleted successfully.
6. Exit

The user can safely exit the application.

Thank you for using Student Expense Tracker!
Goodbye!
🧱 Expense Class

Each expense should contain:

Expense
├── description
├── amount
└── category

For example:

Description: Lunch
Amount: R50
Category: Food

Expenses will be stored in a list so that multiple expenses can be managed.

🧪 Testing

The project should include unit tests for important functionality.

Tests should cover things such as:

Creating an expense
Correctly storing expense information
Calculating total expenses
Calculating remaining budget
Adding expenses
Removing expenses
Handling invalid input

Run the tests with:

dart test
▶️ Running the Application

Make sure Dart is installed.

Run the application from the project directory:

dart run

Alternatively:

dart run bin/student_expense_tracker.dart
📋 Example Menu
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
🚀 Future Improvements

Once the basic version is complete, the application could be improved by adding:

Expense editing
Expense search
Category filtering
Spending statistics
Expense dates
JSON file storage
Persistent data
Monthly reports
A graphical user interface using Flutter
📱 Future Flutter Version

The long-term goal is to convert this command-line Dart application into a Flutter mobile application.

The Flutter version could include:

Dashboard
Budget overview
Expense list
Add expense screen
Expense categories
Spending charts
Persistent storage

This allows the project to grow from a simple beginner Dart project into a complete mobile application.

👩🏽‍💻 Author

Lumko Majozi
