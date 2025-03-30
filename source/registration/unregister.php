<?php
session_start();

$conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

if ($conn->connect_error) {
    die("Помилка з'єднання: " . $conn->connect_error);
}

if (isset($_POST['section_id']) && isset($_SESSION['user_id'])) {
    $section_id = $_POST['section_id'];
    $user_id = $_SESSION['user_id'];

    $sql = "DELETE FROM ychasnuk_Section WHERE ID_ychasnuka = $user_id AND ID_Section = $section_id";

    if ($conn->query($sql) === TRUE) {
        header("Location: /index.php");
        exit();
    } else {
        echo "Помилка при видаленні: " . $conn->error;
    }
} else {
    echo "Невірні дані.";
}

$conn->close();
?>