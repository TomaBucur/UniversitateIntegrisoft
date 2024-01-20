# Universitate Integrisoft

## C# Project Documentation

### Getting Started
1. **Clone the repository:** `git clone https://github.com/numele-tau/UniversitateIntegrisoft.git`
2. **Open the solution in Visual Studio.**
3. **Set the `UniversitateIntegrisoft` project as the startup project.**
4. **Run the project using "IIS Express."** For Swagger, press F5 in Visual Studio.

### Testing the APIs
There are two available routes(APIs) for testing in Swagger:
1. **GetStudentMateriiNote:** Select a student ID (between 1 and 21) and click "Execute." Receive a JSON object with student information and a list of subjects and grades.
2. **GetMedieStudent:** Select a student ID (between 1 and 21) and click "Execute." Get the average grade for the specified student.

### Authorization
To test authorization, use the following credentials:
- **Username:** Integrisoft
- **Password:** interviu

1. **GetStudentMateriiNote** has the [Authorize] attribute, requiring authentication for access.
2. **GetMedieStudent** requires a special role ("Admin") for access.

### Modifying Authorization
To check and modify the required role for accessing the second route, change the string "Admin" in the attribute above the second method in `StudentController`.

### Note
- Server responses for nonexistent IDs return "Studentul nu a fost gasit" (Student not found).
- In case of missing credentials, you will receive a "401 - Unauthorized Access" error.

### Repository Pattern
The project implements the repository pattern to separate data access logic, facilitating testing and code maintenance.

### Security
DTOs are used for transmitting relevant data, enhancing application security. This allows changes to the backend logic without impacting the user interface.

---

## SQL Database Scripts

### Getting Started
1. To create the database, run the "CreareDB.sql" script in the "SQLscripts" project. This script will create the "Universitate" database.
2. After running the above script, select any of the other scripts to execute. Use `Ctrl+Shift+E` or click the green triangle in the script window.

### Connection Setup
1. If the database is not connected by default, use the fourth icon to the left of the green triangle to connect to the local server.
2. If the database is not in the default connected server, use the two icons to the right of the previously mentioned button to change the server. Here, you can connect the server to the required database.

---
