<?php
session_start(); 

$conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

if ($conn->connect_error) {
    die("Помилка з'єднання: " . $conn->connect_error);
}

$id = $_GET['id'];
$sql = "SELECT * FROM Section WHERE ID = $id";
$result = $conn->query($sql);
$section = $result->fetch_assoc();

$trener_sql = "SELECT T.Prizvushche, T.Imya, G.Nazva, G.Za_vikom, G.Za_statyu, G.Vilni_miscya 
               FROM Trener T
               JOIN Grupa G ON T.ID_Grup = G.ID
               WHERE T.ID_Section = $id";
$trener_result = $conn->query($trener_sql);

$is_registered = false;
$user_data = [];
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $check_registration_sql = "SELECT * FROM ychasnuk_section WHERE ID_ychasnuka = $user_id AND ID_Section = $id";
    $registration_result = $conn->query($check_registration_sql);
    $is_registered = $registration_result->num_rows > 0;

    $user_data_sql = "SELECT Prizvushche, Imya, Vik, Stat, Nomer_telefony FROM Ychasnuk WHERE ID = $user_id";
    $user_data_result = $conn->query($user_data_sql);
    if ($user_data_result->num_rows > 0) {
        $user_data = $user_data_result->fetch_assoc();
    }
}

?>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $section['Nazva']; ?></title>
    <header style="text-align: center; margin-top: 20px;">
         <a href="/index.php">
            <img src="/images/logo.png" alt="Логотип" style="width: 100px; height: auto;">
        </a>
    </header>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/section.css">
</head>
<body class="section">
    <div class="container_section">
        <h1 class="nazva"><?php echo $section['Nazva']; ?></h1>
        <div class="details">
            <p><strong>Місцезнаходження:</strong> <?php echo $section['Misceznahodjennya']; ?></p>
            <p><strong>Вільних місць:</strong> <?php echo $section['Vilni_miscya']; ?></p>
        </div>

        <h2>Список тренерів</h2>
        <table class="section-table">
            <thead>
                <tr>
                    <th>Тренер</th>
                    <th>Група</th>
                    <th>Вік групи</th>
                    <th>Стать групи</th>
                    <th>Вільні місця</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($trener_result->num_rows > 0) {
                    while ($trener = $trener_result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $trener['Prizvushche'] . " " . $trener['Imya'] . "</td>";
                        echo "<td>" . $trener['Nazva'] . "</td>";
                        echo "<td>" . $trener['Za_vikom'] . "</td>";
                        echo "<td>" . ($trener['Za_statyu'] ? $trener['Za_statyu'] : 'Змішана') . "</td>";
                        echo "<td>" . $trener['Vilni_miscya'] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='4'>Тренерів поки немає.</td></tr>";
                }
                ?>
            </tbody>
        </table>

    <div style="text-align: center; margin-top: 20px;">
        <?php if ($is_registered): ?>
            <button class="button" onclick="document.getElementById('confirmModal').style.display='block'">Покинути</button>
            
            <div id="confirmModal" class="modal">
                <div class="modal-content">
                    <p>Ви дійсно бажаєте покинути секцію?</p>
                    <form action="/source/registration/unregister.php" method="POST">
                        <input type="hidden" name="section_id" value="<?php echo $section['ID']; ?>">
                        <button class="button" type="submit">Підтвердити</button>
                        <button class="button" type="button" onclick="document.getElementById('confirmModal').style.display='none'">Скасувати</button>
                    </form>
                </div>
            </div>
        <?php else: ?>
            <form action="/source/registration/register_process.php" method="POST">
                <input type="hidden" name="section_id" value="<?php echo $section['ID']; ?>">
                <?php if (isset($_SESSION['user_id'])): ?>
                    <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id']; ?>">
                    <button class="button" type="submit">Зареєструватися</button>
                <?php else: ?>
                    <button class="button" type="button" onclick="window.location.href='/source/registration/register.php?section_id=<?php echo $section['ID']; ?>'">Зареєструватися</button>
                <?php endif; ?>
            </form>
        <?php endif; ?>
        
        <?php if (isset($_GET['message']) && $_GET['message'] == 'registered'): ?>
            <p style="color: green; font-weight: bold;">Ви успішно зареєструвались на секцію!</p>
        <?php endif; ?>
    </div>
</body>
</html>