<?php
$conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

if ($conn->connect_error) {
    die("Помилка з'єднання: " . $conn->connect_error);
}

$section_id = isset($_POST['section_id']) ? $_POST['section_id'] : (isset($_GET['section_id']) ? $_GET['section_id'] : null);

if ($section_id === null || !is_numeric($section_id)) {
    die("Помилка: section_id не передано або є недійсним.");
}

?>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Форма реєстрації</title>
    <header style="text-align: center; margin-top: 20px;">
         <a href="/index.php">
            <img src="/images/logo.png" alt="Логотип" style="width: 100px; height: auto;">
        </a>
    </header>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/register.css">
</head>
<body class="register">
    <div class="container">
        <h1 class="text">Реєстрація на секцію</h1>
        <form class="reg" id="registration-form" action="/source/registration/register_process.php" method="POST">
            <label for="prizvushche">Прізвище:</label>
            <input type="text" name="prizvushche" id="prizvushche" required>

            <label for="imya">Ім'я:</label>
            <input type="text" name="imya" id="imya" required>

            <label for="vik">Вік:</label>
            <input type="number" name="vik" id="vik" min="1" required>

            <label for="stat">Стать:</label>
            <select name="stat" id="stat" required>
                <option value="Чоловік">Чоловік</option>
                <option value="Жінка">Жінка</option>
            </select>

            <label for="telefon">Номер телефону:</label>
            <input type="text" name="nomer_telefony" id="nomer_telefony" required>
            <?php if (isset($_GET['error']) && $_GET['error'] == 'phone_exists'): ?>
            <div style="color: red; font-size: 14px;">Такий номер вже є у базі.</div>
            <?php endif; ?>

            <input type="hidden" name="section_id" value="<?php echo $section_id; ?>">

            <div class="error-message" id="age-error-message">Вам має бути від 7 до 25 років.</div>

            <button type="submit" class="button" id="submit-button">Зареєструватися</button>
        </form>
    </div>

    <script>
        const ageInput = document.getElementById('vik');
        const submitButton = document.getElementById('submit-button');
        const errorMessage = document.getElementById('age-error-message');

        ageInput.addEventListener('input', function() {
            const age = parseInt(ageInput.value);
            if (age < 7 || age > 25) {
                submitButton.disabled = true;
                submitButton.style.backgroundColor = '#ccc';  
                errorMessage.style.display = 'block';
            } else {
                submitButton.disabled = false;
                submitButton.style.backgroundColor = '';  
                errorMessage.style.display = 'none';
            }
        });
    </script>
</body>
</html>