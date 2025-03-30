<?php
session_start();
$conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

if ($conn->connect_error) {
    die("Помилка з'єднання: " . $conn->connect_error);
}

if (isset($_POST['section_id']) && isset($_SESSION['user_id'])) {
    $section_id = intval($_POST['section_id']);
    $user_id = $_SESSION['user_id'];

    echo "User ID: $user_id, Section ID: $section_id"; // Виводимо для перевірки

    $checkSql = "SELECT * FROM ychasnuk_section WHERE ID_Ychasnuka = $user_id AND ID_Section = $section_id";
    $result = $conn->query($checkSql);

    if ($result->num_rows > 0) {
        $sql = "DELETE FROM ychasnuk_section WHERE ID_Ychasnuka = $user_id AND ID_Section = $section_id";
        if ($conn->query($sql) === TRUE) {
            header("Location: /source/profile/profile.php");
            exit();
        } else {
            echo "Помилка при видаленні: " . $conn->error;
        }
    } else {
        echo "Запис не знайдено для видалення.";
    }
} else {
    echo "Невірні дані.";
}

$conn->close();
exit();
?>