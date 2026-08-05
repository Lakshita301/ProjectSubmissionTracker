# 📚 Project Submission Tracker

A full-stack web application developed using **Flask** and **MySQL** that simplifies the management of academic project submissions. The portal allows faculty members to create projects, review student submissions, assign grades, and provide feedback, while students can upload their work, monitor submission status, and view evaluation results.

---

## 🚀 Features

### 👨‍🏫 Faculty Module
- Faculty Registration & Login
- Create new projects with:
  - Project title
  - Description
  - Deadline
  - Maximum marks
- View all created projects
- Delete projects
- View student submissions
- Download/View submitted files
- Grade submissions
- Provide comments/feedback

### 👨‍🎓 Student Module
- Student Registration & Login
- View available projects
- View project descriptions and deadlines
- Upload project submissions
- Track submission status
- View grades and faculty feedback

### 📁 File Management
- Upload project files securely
- Faculty can access submitted files
- File storage using Flask upload handling

### 🗄 Database Features
- Relational database design using MySQL
- CRUD operations
- Foreign key constraints
- Multiple table relationships
- SQL joins and aggregate queries

---

# 🛠 Tech Stack

### Backend
- Python 3
- Flask

### Frontend
- HTML5
- CSS3
- Bootstrap 5
- JavaScript
- jQuery

### Database
- MySQL

### Development Tools
- Visual Studio Code
- Git
- GitHub

---

# 📂 Project Structure

```
project_submission_tracker/
│
├── app.py                     # Main Flask application
├── db_config.py               # MySQL connection configuration
├── student_project_submission_tracker.sql
│
├── uploads/                   # Uploaded project files
│
├── static/
│   ├── styles.css
│   └── scripts.js
│
├── templates/
│   ├── base.html
│   ├── index.html
│   ├── register.html
│   ├── student_dashboard.html
│   └── faculty_dashboard.html
│
├── .gitignore
└── README.md
```

---

# 📊 Database Design

The application consists of the following relational tables:

- Student
- Faculty
- Department
- Project
- Submission

### Relationships

- One Faculty ➜ Many Projects
- One Student ➜ Many Submissions
- One Project ➜ Many Submissions
- One Department ➜ Many Students
- One Department ➜ Many Faculty

---

# ✨ Key Functionalities

- User Authentication
- Role-Based Access Control
- Project Creation
- Project Deletion
- File Upload
- Submission Tracking
- Faculty Evaluation
- Grade Management
- Feedback System

---

# 🗃 SQL Concepts Used

- CREATE
- INSERT
- UPDATE
- DELETE
- INNER JOIN
- LEFT JOIN
- GROUP BY
- Aggregate Functions
- Foreign Keys
- Constraints

---

# ▶️ Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Lakshita301/project_submission_tracker.git
```

---

### 2. Navigate into the Project

```bash
cd project_submission_tracker
```

---

### 3. Create Virtual Environment

Windows

```bash
python -m venv venv
```

Activate it

```bash
venv\Scripts\activate
```

---

### 4. Install Dependencies

```bash
pip install flask mysql-connector-python
```

---

### 5. Configure Database

Update your MySQL credentials in

```
db_config.py
```

Example

```python
host="localhost"
user="root"
password="YOUR_PASSWORD"
database="project_submission_tracker"
```

---

### 6. Import Database

```sql
SOURCE student_project_submission_tracker.sql;
```

---

### 7. Run the Application

```bash
python app.py
```

---

### 8. Open Browser

```
http://127.0.0.1:5000
```

---

# 📸 Application Modules

- Login
- Registration
- Student Dashboard
- Faculty Dashboard
- Project Management
- Project Submission
- Grading & Feedback

---

# 🎯 Learning Outcomes

This project demonstrates practical implementation of:

- Flask Web Development
- Relational Database Design
- SQL CRUD Operations
- File Handling
- Session Management
- User Authentication
- HTML/CSS/Bootstrap Frontend Development
- Database Connectivity using MySQL Connector
- Role-Based Access Control

---

# 📖 Future Enhancements

- Password hashing using Flask-Bcrypt
- Email notifications
- Deadline reminders
- Project search and filtering
- Admin dashboard
- Multiple file uploads
- Project analytics
- Cloud deployment

---

# 👩‍💻 Team

**Project Title:** Project Submission Tracker

Developed as part of the **Database Management Systems (UE23CS351A)** course at **PES University**.

---

# 🔗 GitHub Repository

https://github.com/Lakshita301/project_submission_tracker

---

## 📄 License

This project is developed for educational purposes as part of the Database Management Systems course at PES University.
