<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login and Registration System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Login and Registration System</h1>
    </header>
    <main>
        <section class="forms">
            <!-- Login Form -->
            <div class="form-container" id="loginFormContainer">
                <h2>Login</h2>
                <form id="loginForm">
                    <label for="loginEmail">Email:</label>
                    <input type="email" id="loginEmail" required>

                    <label for="loginPassword">Password:</label>
                    <input type="password" id="loginPassword" required>

                    <button type="submit">Login</button>
                </form>
                <p>Don't have an account? <a href="#" id="showRegistrationForm">Register here</a></p>
            </div>

            <!-- Registration Form -->
            <div class="form-container" id="registrationFormContainer" style="display: none;">
                <h2>Register</h2>
                <form id="registrationForm">
                    <label for="regName">Name:</label>
                    <input type="text" id="regName" required>

                    <label for="regEmail">Email:</label>
                    <input type="email" id="regEmail" required>

                    <label for="regPassword">Password:</label>
                    <input type="password" id="regPassword" required>

                    <button type="submit">Register</button>
                </form>
                <p>Already have an account? <a href="#" id="showLoginForm">Login here</a></p>
            </div>
        </section>
    </main>
    <footer>
        <p>© 2024 Login and Registration System</p>
    </footer>
    <script src="script.js"></script>
</body>
</html>
2. styles.css
This CSS file provides styling for the login and registration system interface.

css
Copy code
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    background-color: #f4f4f9;
}

header {
    background-color: #333;
    color: #fff;
    padding: 10px 0;
    text-align: center;
}

main {
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.forms {
    width: 100%;
    max-width: 400px;
}

.form-container {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-top: 10px;
    font-weight: bold;
}

input, button {
    margin-top: 5px;
    padding: 8px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #0056b3;
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

footer {
    background-color: #333;
    color: #fff;
    padding: 10px 0;
    text-align: center;
}
3. script.js
This JavaScript file handles form submissions, simple validation, and switching between the login and registration forms.

javascript
Copy code
document.addEventListener('DOMContentLoaded', function () {
    const loginFormContainer = document.getElementById('loginFormContainer');
    const registrationFormContainer = document.getElementById('registrationFormContainer');
    const showRegistrationForm = document.getElementById('showRegistrationForm');
    const showLoginForm = document.getElementById('showLoginForm');

    // Simple user storage (for demo purposes only)
    let users = [];

    // Function to toggle forms
    function toggleForms() {
        loginFormContainer.style.display = loginFormContainer.style.display === 'none' ? 'block' : 'none';
        registrationFormContainer.style.display = registrationFormContainer.style.display === 'none' ? 'block' : 'none';
    }

    // Show registration form
    showRegistrationForm.addEventListener('click', function (e) {
        e.preventDefault();
        toggleForms();
    });

    // Show login form
    showLoginForm.addEventListener('click', function (e) {
        e.preventDefault();
        toggleForms();
    });

    // Handle registration form submission
    document.getElementById('registrationForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const name = document.getElementById('regName').value;
        const email = document.getElementById('regEmail').value;
        const password = document.getElementById('regPassword').value;

        // Check if user already exists
        const userExists = users.some(user => user.email === email);
        if (userExists) {
            alert('User already exists with this email.');
            return;
        }

        // Register the user
        users.push({ name, email, password });
        alert('Registration successful! Please log in.');
        toggleForms();
        document.getElementById('registrationForm').reset();
    });

    // Handle login form submission
    document.getElementById('loginForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const email = document.getElementById('loginEmail').value;
        const password = document.getElementById('loginPassword').value;

        // Check if user exists and password is correct
        const user = users.find(user => user.email === email && user.password === password);
        if (user) {
            alert(`Welcome back, ${user.name}!`);
            document.getElementById('loginForm').reset();
        } else {
            alert('Invalid email or password.');
        }
    });
});
