<?php
header('Content-Type: application/json');
$servername = 'localhost:3306';
$username = 'root';
$password = 'root';
$dbname = 'sportuvni_sections';

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sectionId = isset($_GET['section_id']) ? intval($_GET['section_id']) : 0;
$sql = "SELECT DISTINCT DATE_FORMAT(t.Data, '%Y-%m-%d') as Data 
        FROM Trenyvannya t 
        JOIN Trener tr ON tr.ID = t.ID_Trenera 
        JOIN ychasnuk_section ys ON ys.ID_Grup = tr.ID_Grup 
        WHERE ys.ID_Section = ?
        limit 8";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $sectionId);
$stmt->execute();
$result = $stmt->get_result();

$trainings = [];
while ($row = $result->fetch_assoc()) {
    $trainings[] = $row;
}

echo json_encode($trainings);
?>