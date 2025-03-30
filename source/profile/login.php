<?php
session_start();
$conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

if ($conn->connect_error) {
    die("Помилка з'єднання: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $phone = $_POST['phone'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT Y.ID, U.password FROM Ychasnuk Y JOIN User U ON Y.ID = U.ID_Ychasnuka WHERE Y.Nomer_telefony = ?");
    $stmt->bind_param("s", $phone);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['ID'];
            header("Location: /index.php");
            exit();
        } else {
            $error = "Неправильний пароль.";
        }
    } else {
        $error = "Користувача з таким номером телефону не існує.";
    }
}

?>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Вхід</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/login.css">
</head>
<body>
    <header class="header">
        <a href="/index.php">
            <img src="/images/logo.png" alt="Логотип" class="logo">
        </a>
    </header>
    <div class="login-container">
        <h1>Вхід до профілю</h1>
        <?php if (isset($error)): ?>
            <div class="error"><?php echo $error; ?></div>
        <?php endif; ?>
        <form method="POST">
            <input type="text" name="phone" placeholder="Номер телефону" required>
            <input type="password" name="password" placeholder="Пароль" required>
            <button type="submit">Увійти</button>
        </form>
    </div>
</body>
</html>