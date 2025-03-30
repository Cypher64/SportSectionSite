<?php 
$conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

if ($conn->connect_error) {
    die("Помилка з'єднання: " . $conn->connect_error);
}

$sql = "SELECT * FROM Section";
$result = $conn->query($sql);

session_start();

$success_message = isset($_SESSION['success_message']) ? $_SESSION['success_message'] : null;

unset($_SESSION['success_message']);
?>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSA</title>
    <header style="text-align: center; margin-top: 20px;">
         <a href="/index.php">
            <img src="/images/logo.png" alt="Логотип" style="width: 100px; height: auto;">
        </a>
    </header>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/index.css">
</head>
<body class="index">
    
    <?php if (!isset($_SESSION['user_id'])): ?>
        <div class="auth-buttons">
            <a href="/source/profile/login.php" class="btn btn-primary">Увійти</a>
            <a href="/source/registration/index_register.php" class="btn btn-secondary">Зареєструватися</a>
        </div>
    <?php else: ?>
        <div class="profile">
            <a href="/source/profile/profile.php" style="cursor: pointer;">
                <img src="/images/User.png" style="width: 100px; height: auto; cursor: pointer;">
            </a>
        </div>
    <?php endif; ?>

    <div class="container">
        <?php while($row = $result->fetch_assoc()): ?>
            <div class="tile" onclick="window.location.href='/source/other/section.php?id=<?php echo $row['ID']; ?>'">
                <img src="/images/section_<?php echo $row['ID']; ?>.jpg" alt="<?php echo $row['Nazva']; ?>">
                <h2><?php echo $row['Nazva']; ?></h2>
            </div>
        <?php endwhile; ?>
    </div>
    <div class="footer">
        <p>&copy; 2024 Спортивні секції району</p>
    </div>

    <?php if ($success_message): ?>
        <div id="successModal" class="modal">
            <div class="modal-content">
                <p><?php echo $success_message; ?></p>
                <button class="button" onclick="document.getElementById('successModal').style.display='none'">OK</button>
            </div>
        </div>
    <?php endif; ?>
</body>
</html>