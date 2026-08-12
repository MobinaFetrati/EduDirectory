# 🎓 EduDirectory

A modern Flutter-based employee directory and management application designed to organize, search, manage, and analyze employee information through a clean and scalable architecture.

The application includes employee management, organizational groups, advanced search and filtering, statistics, admin controls, Excel import/export, backup functionality, and Supabase backend integration.

---

## ✨ Features

### 👥 Employee Management
- 👤 View employee information
- 📝 Add new employees
- ✏️ Edit employee information
- 🗑️ Manage employee records
- 🖼️ Employee profile images
- 📞 Quick contact actions

### 🔎 Search & Filtering
- 🔍 Search employees
- 🏷️ Filter employees by groups
- 🎯 Advanced filtering
- 📋 Display filtered employee lists

### 🏢 Groups & Organization
- 🏢 Organizational groups
- 🌳 Hierarchical group structure
- 📂 Group details
- 🔎 Group-based employee filtering
- 📊 School/group statistics

### 🔐 Admin Panel
- 🔑 Admin authentication
- 🛠️ Admin dashboard
- 👥 Employee management
- ➕ Add employees
- ✏️ Edit employees
- 📋 Employee list management

### 📊 Statistics
- 📈 Employee statistics
- 📊 Group statistics
- 🏢 School statistics
- 🔢 Data-based statistical views

### 📥 Import & Export
- 📥 Import employee data from Excel
- 📤 Export employee data to Excel
- 📄 Excel template generation
- 💾 Data backup
- 📁 File management

### ☁️ Supabase Integration
- 🗄️ Supabase database
- 🔐 Authentication
- 📦 Supabase Storage
- 🖼️ Image upload and management
- 🔄 Cloud-based data management

### 🎨 UI & UX
- 📱 Responsive Flutter interface
- 🎨 Custom application theme
- 🌈 Centralized color system
- 🧩 Reusable widgets
- ⏳ Loading states
- ⚠️ Error states
- 📭 Empty states

---

## 🛠️ Tech Stack

| Technology | Usage |
|------------|-------|
| 💙 Flutter | Cross-platform application development |
| 🎯 Dart | Programming language |
| 🧠 Riverpod | State management |
| 🧭 GoRouter | Navigation and routing |
| ☁️ Supabase | Backend and database |
| 🗄️ Supabase Storage | File and image storage |
| 🖼️ Cached Network Image | Network image caching |
| 🎨 Flutter SVG | SVG rendering |
| 🔗 URL Launcher | External links and contact actions |
| 📊 Excel | Excel data processing |
| 📁 File Picker | File selection |
| 💾 File Saver | File saving and export |
| 📅 Intl | Date and number formatting |

---

## 🏗️ Architecture

The project follows a feature-based architecture to keep the codebase modular, maintainable, and scalable.

```text
lib/
│
├── app/
│   ├── app.dart
│   ├── app_initializer.dart
│   ├── colors.dart
│   ├── router.dart
│   ├── theme.dart
│   └── theme_provider.dart
│
├── core/
│   ├── constants/
│   │   └── supabase_constants.dart
│   │
│   └── services/
│       └── supabase_service.dart
│
├── features/
│   ├── admin/
│   ├── auth/
│   ├── categories/
│   ├── employee/
│   ├── groups/
│   ├── home/
│   ├── import_export/
│   ├── menu/
│   ├── search/
│   ├── settings/
│   ├── splash/
│   └── statistics/
│
├── shared/
│   ├── models/
│   ├── providers/
│   ├── repositories/
│   └── widgets/
│
└── main.dart
````

---

## 🧩 Main Modules

### 🏠 Home

Provides the main employee directory with search, filtering, employee cards, and group filters.

### 👤 Employee

Handles employee details, profile information, and contact actions.

### 👨‍💼 Admin

Provides administrative tools for managing employee records.

### 🔐 Authentication

Handles admin authentication and access control.

### 🏢 Groups

Manages organizational groups and hierarchical structures.

### 🔎 Search

Provides employee search and filtering functionality.

### 📊 Statistics

Displays employee and organizational statistics.

### 📥 Import / Export

Provides Excel import, export, templates, and backup functionality.

---

## 🖼️ Screenshots

<div align="center">

<table>
<tr>
<td><img src="screenshots/home.png" width="250"/></td>
<td><img src="screenshots/employees.png" width="250"/></td>
<td><img src="screenshots/employee-detail.png" width="250"/></td>
</tr>

<tr>
<td><img src="screenshots/groups.png" width="250"/></td>
<td><img src="screenshots/statistics.png" width="250"/></td>
<td><img src="screenshots/admin.png" width="250"/></td>
</tr>
</table>

</div>

> 📌 Screenshots will be added as the project presentation is finalized.

---

## 🚀 Getting Started

### 1️⃣ Clone the repository

```bash
git clone YOUR_REPOSITORY_URL
```

### 2️⃣ Navigate to the project

```bash
cd edudirectory3
```

### 3️⃣ Install dependencies

```bash
flutter pub get
```

### 4️⃣ Configure Supabase

Create a Supabase project and configure the required project URL and public client key in the appropriate configuration file.

```text
lib/core/constants/supabase_constants.dart
```

⚠️ Never commit private or server-side Supabase keys to the repository.

### 5️⃣ Run the application

```bash
flutter run
```

---

## ☁️ Backend

EduDirectory uses **Supabase** as its backend platform.

The backend is responsible for:

* 🗄️ Employee data
* 👥 User information
* 🏢 Organizational groups
* 🔐 Authentication
* 🖼️ Image storage
* 📦 File storage

---

## 📊 Data Management

The application supports multiple ways to manage employee information:

```text
👤 Manual Management
        ↓
📥 Excel Import
        ↓
☁️ Supabase Database
        ↓
📊 Statistics
        ↓
📤 Excel Export
        ↓
💾 Backup
```

---

## 🧠 State Management

The application uses **Riverpod** to manage application state.

Providers are separated according to their responsibilities, including:

* 👤 Employee state
* 👥 User state
* 🏢 Group state
* 🏷️ Category state
* 🔎 Search state
* 📊 Statistics state
* ⚙️ Filters

This separation helps keep business logic independent from the UI.

---

## 🧭 Navigation

Application navigation is handled using **GoRouter**, providing structured routing between:

* 🏠 Home
* 👤 Employee details
* 🏢 Groups
* 📊 Statistics
* 🔐 Admin login
* 🛠️ Admin panel
* ⚙️ Settings
* 📥 Import / Export

---

## 🎯 Project Goals

This project was developed to demonstrate practical experience with:

* 💙 Flutter application development
* 🧠 State management with Riverpod
* 🏗️ Feature-based architecture
* 🗄️ Supabase backend integration
* 🔐 Authentication
* 📊 Data visualization and statistics
* 📥 Excel import/export
* 🔎 Search and filtering
* 📱 Building scalable real-world applications

---

## 🔮 Future Improvements

The application is designed to be extensible and can be expanded with additional features such as:

* 🔔 Notifications
* 📊 More advanced analytics
* 👤 Additional user roles
* 🔐 More granular permissions
* 📱 Improved responsive layouts
* 🔄 Advanced synchronization
* 📈 More detailed reports

---

## 👩‍💻 Developer

**Mobina Fetrati**

💙 Flutter Developer | Mobile Application Developer

* 🐙 GitHub: [https://github.com/MobinaFetrati](https://github.com/MobinaFetrati)

---

## 📄 License

This project is currently developed for portfolio and project demonstration purposes.

