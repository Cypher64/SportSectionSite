<?php
session_start();
$conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

if ($conn->connect_error) {
    die("Помилка з'єднання: " . $conn->connect_error);
}

$prizvushche = $_POST['prizvushche'];
$imya = $_POST['imya'];
$vik = $_POST['vik'];
$stat = $_POST['stat'];
$nomer_telefony = $_POST['nomer_telefony'];
$section_ids = explode(',', $_POST['section_id']);

$sql = "SELECT ID FROM Ychasnuk WHERE Nomer_telefony = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $nomer_telefony);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    header("Location: /source/registration/index_register.php?error=phone_exists");
    exit();
}

header("Location: /source/other/create_account.php?prizvushche=$prizvushche&imya=$imya&vik=$vik&stat=$stat&nomer_telefony=$nomer_telefony&section_id=" . implode(',', $section_ids));
?>