<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

    if ($conn->connect_error) {
        die("Помилка з'єднання: " . $conn->connect_error);
    }

    $prizvushche = $_POST['prizvushche'];
    $imya = $_POST['imya'];
    $vik = $_POST['vik'];
    $stat = $_POST['stat'];
    $nomer_telefony = $_POST['nomer_telefony'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $section_ids = explode(',', $_POST['section_id']);

    $sql = "INSERT INTO Ychasnuk (Prizvushche, Imya, Vik, Stat, Nomer_telefony) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssiss", $prizvushche, $imya, $vik, $stat, $nomer_telefony);
    $stmt->execute();
    $user_id = $conn->insert_id;

    $sql = "INSERT INTO User (ID_Ychasnuka, password) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("is", $user_id, $password);
    $stmt->execute();

    foreach ((array)$section_ids as $section_id) {
        $section_id_int = (int)$section_id;
    
        $sql_check_section = "SELECT 1 FROM Section WHERE ID = ?";
        $stmt_check_section = $conn->prepare($sql_check_section);
        $stmt_check_section->bind_param("i", $section_id_int);
        $stmt_check_section->execute();
        $result_check_section = $stmt_check_section->get_result();
    
        if ($result_check_section->num_rows > 0) {
            $sql_check = "SELECT 1 FROM ychasnuk_section WHERE ID_Ychasnuka = ? AND ID_Section = ?";
            $stmt_check = $conn->prepare($sql_check);
            $stmt_check->bind_param("ii", $user_id, $section_id_int);
            $stmt_check->execute();
            $result_check = $stmt_check->get_result();
    
            if ($result_check->num_rows === 0) {
                $sql_insert = "INSERT INTO ychasnuk_section (ID_Ychasnuka, ID_Section) VALUES (?, ?)";
                $stmt_insert = $conn->prepare($sql_insert);
                $stmt_insert->bind_param("ii", $user_id, $section_id_int);
                $stmt_insert->execute();
    
                if ($stmt_insert->error) {
                    echo "Помилка при додаванні до ychasnuk_section: " . $stmt_insert->error;
                }
            }
        } else {
            echo "Секція з ID " . $section_id_int . " не знайдена.<br>";
        }
    }
    

    header("Location: /index.php?user_id=$user_id");
    exit();
} else {
    $prizvushche = $_GET['prizvushche'];
    $imya = $_GET['imya'];
    $vik = $_GET['vik'];
    $stat = $_GET['stat'];
    $nomer_telefony = $_GET['nomer_telefony'];
    $section_id = $_GET['section_id'];
}
?>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Створення акаунта</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/create.css">
    <script>
        function validatePassword() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm_password").value;
            const submitButton = document.getElementById("submit_button");

            if (password === confirmPassword && password !== "") {
                submitButton.disabled = false;
                submitButton.style.backgroundColor = "";
            } else {
                submitButton.disabled = true;
                submitButton.style.backgroundColor = "gray";
            }
        }
    </script>
</head>
<body>
    <header style="text-align: center; margin-top: 100px;">
         <a href="/index.php">
            <img src="/images/logo.png" alt="Логотип" style="width: 100px; height: auto;">
        </a>
    </header>
    <h1>Створення акаунта для нового учасника</h1>
    <div class="container">
        <form action="/source/other/create_account.php" method="post">
            <input type="hidden" name="prizvushche" value="<?php echo $prizvushche; ?>">
            <input type="hidden" name="imya" value="<?php echo $imya; ?>">
            <input type="hidden" name="vik" value="<?php echo $vik; ?>">
            <input type="hidden" name="stat" value="<?php echo $stat; ?>">
            <input type="hidden" name="nomer_telefony" value="<?php echo $nomer_telefony; ?>">
            <input type="hidden" name="section_id" value="<?php echo $section_id; ?>">
            
            <div class="form-group">
                <label for="password">Пароль:</label>
                <input type="password" id="password" name="password" required onkeyup="validatePassword()">
            </div>
            <div class="form-group">
                <label for="confirm_password">Підтвердження пароля:</label>
                <input type="password" id="confirm_password" name="confirm_password" required onkeyup="validatePassword()">
            </div>
            <button type="submit" id="submit_button" disabled style="background-color: gray;">Завершити реєстрацію</button>
        </form>
    </div>
    <div class="footer">
        <p>&copy; 2024 Спортивні Секції</p>
    </div>
</body>
</html>