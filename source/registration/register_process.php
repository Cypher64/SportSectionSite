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
$section_id = $_POST['section_id'];

$sql = "SELECT ID FROM Ychasnuk WHERE Nomer_telefony = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $nomer_telefony);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    header("Location: /source/registration/register.php?error=phone_exists&section_id=$section_id");
    exit();
}

$user_id = $_POST['user_id'] ?? null;

if ($user_id) {
    $stmt = $conn->prepare("INSERT INTO ychasnuk_section (ID_ychasnuka, ID_Section) VALUES (?, ?)");
    $stmt->bind_param("ii", $user_id, $section_id);
    $stmt->execute();
    
    header("Location: /source/other/section.php?id=$section_id&message=registered");
    exit();
}

header("Location: /source/other/create_account.php?prizvushche=$prizvushche&imya=$imya&vik=$vik&stat=$stat&nomer_telefony=$nomer_telefony&section_id=$section_id");
?>