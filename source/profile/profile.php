<?php 
session_start();
$conn = new mysqli('localhost:3306', 'root', 'root', 'sportuvni_sections');

if ($conn->connect_error) {
    die("Помилка з'єднання: " . $conn->connect_error);
}

if (!isset($_SESSION['user_id'])) {
    header("Location: /source/profile/login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

$sql = "SELECT Y.ID, Y.Prizvushche, Y.Imya, Y.Vik, Y.Stat, Y.Nomer_telefony, U.password
        FROM Ychasnuk Y
        JOIN User U ON Y.ID = U.ID_Ychasnuka
        WHERE Y.ID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$user = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $prizvushche = $_POST['prizvushche'];
    $imya = $_POST['imya'];
    $vik = $_POST['vik'];
    $stat = $_POST['stat'];
    $nomer_telefony = $_POST['nomer_telefony'];
    
    $sql = "UPDATE Ychasnuk SET Prizvushche=?, Imya=?, Vik=?, Stat=?, Nomer_telefony=? WHERE ID=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssissi", $prizvushche, $imya, $vik, $stat, $nomer_telefony, $user_id);
    $stmt->execute();

    if (!empty($_POST['new_password'])) {
        $new_password = password_hash($_POST['new_password'], PASSWORD_DEFAULT);
        $sql = "UPDATE User SET password=? WHERE ID_Ychasnuka=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("si", $new_password, $user_id);
        $stmt->execute();
    }

    header("Location: /source/profile/profile.php");
    exit();
}

$sql_sections = "SELECT S.ID, S.Nazva, G.Nazva AS GroupName
                 FROM Section S
                 JOIN ychasnuk_section YS ON S.ID = YS.ID_section
                 JOIN Grupa G ON YS.ID_Grup = G.ID
                 WHERE YS.ID_ychasnuka = ?";
$stmt_sections = $conn->prepare($sql_sections);
$stmt_sections->bind_param("i", $user_id);
$stmt_sections->execute();
$result_sections = $stmt_sections->get_result();
$sections = $result_sections->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Профіль користувача</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/profile.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>
    <header class="header">
        <a href="/index.php">
            <img src="/images/logo.png" alt="Логотип" class="logo">
        </a>
        <div class="logout-container">
            <form action="/source/profile/logout.php" method="POST">
                <button class="btn-logout" type="submit">Вийти</button>
            </form>
        </div>
    </header>

    <main class="profile-content">
        <div class="tabs">
            <div class="tab active" style="display: left" onclick="showTab('profile')">Профіль</div>
            <div class="tab" style="display: left" onclick="showTab('my_sections')">Мої секції</div>
        </div>

        <div id="profileTab" class="tab-content">
            <div class="container">
                <form id="profileForm" action="/source/profile/profile.php" method="post" onsubmit="trimFields()">
                    <h4>Базова інформація</h4>
                    <div class="form-group inline-form">
                        <div class="form-field">
                            <label for="prizvushche">Прізвище:</label>
                            <input type="text" name="prizvushche" value="<?php echo htmlspecialchars($user['Prizvushche']); ?>" required>
                        </div>
                        <div class="form-field">
                            <label for="imya">Ім'я:</label>
                            <input type="text" name="imya" value="<?php echo htmlspecialchars($user['Imya']); ?>" required>
                        </div>
                        <div class="form-field">
                            <label for="vik">Вік:</label>
                            <input type="number" name="vik" value="<?php echo htmlspecialchars($user['Vik']); ?>" required>
                        </div>
                        <div class="form-field">
                            <label for="stat">Стать:</label>
                            <input type="text" name="stat" value="<?php echo htmlspecialchars($user['Stat']); ?>" required>
                        </div>
                    </div>

                    <h4>Контактна інформація</h4>
                    <div class="form-group">
                        <label for="nomer_telefony">Номер телефону:</label>
                        <input type="text" name="nomer_telefony" style="width: 20%" value="<?php echo htmlspecialchars($user['Nomer_telefony']); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="new_password">Новий пароль:</label>
                        <input type="password" name="new_password" style="width: 43%" placeholder="Залиште порожнім, якщо не хочете змінювати">
                    </div>

                    <button id="saveButton" type="submit" class="btn-save" style="display: none;">Зберегти зміни</button>
                </form>

                <button class="btn-delete" id="deleteProfileButton">Видалити профіль</button>
            </div>
        </div>

        <div id="DellModal" class="modal">
            <div class="modal-content">
                <p>Ви впевнені, що хочете видалити свій профіль?</p>
                <form action="/source/profile/delete_profile.php" method="POST">
                    <input type="hidden" name="user_id" value="<?php echo htmlspecialchars($user['ID']); ?>">
                    <button class="button" type="submit">Підтвердити</button>
                    <button class="button" type="button" onclick="closeModal1()">Скасувати</button>
                </form>
            </div>
        </div>

        <div id="mySectionsTab" class="tab-content" style="display: none;">
            <div class="container">
                <h4>Ваші секції</h4>
                <?php if (!empty($sections)): ?>
                    <div class="section-cards">
                        <?php foreach ($sections as $section): ?>
                            <div class="section-card">
                                <div class="section-info">
                                    <h5><?php echo htmlspecialchars($section['Nazva']); ?></h5>
                                    <span class="group-name"><?php echo htmlspecialchars($section['GroupName']); ?></span>
                                </div>
                                <div class="section-buttons">
                                    <button class="button" onclick="document.getElementById('leaveConfirmationModal').style.display='block'">Покинути секцію</button>
                                    <button class="btn-training" onclick="openCalendar(<?php echo $section['ID']; ?>)">Тренування</button>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <p>Ви не зареєстровані в жодній секції.</p>
                <?php endif; ?>
            </div>
        </div>

        <div id="leaveConfirmationModal" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <p>Ви дійсно бажаєте покинути секцію?</p>
                <div class="modal-buttons">
                    <form action="/source/other/leave.php" method="post" style="display: inline;" onsubmit="return confirmLeave();">
                        <input type="hidden" name="section_id" value="<?php echo $section['ID']; ?>">
                        <button id="confirmLeaveBtn" class="btn-confirm" onclick="confirmLeave(<?php echo $section['ID']; ?>)">Підтвердити</button>
                    </form>
                    <button class="btn-cancel" onclick="closeModal()">Скасувати</button>
                </div>
            </div>
        </div>

         <div id="calendarModal" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close" onclick="closeCalendar()">&times;</span>
                <h4>Календар тренувань</h4>
                <div id="calendar"></div>
            </div>
        </div>
    </main>

    <script>

        document.getElementById('deleteProfileButton').onclick = function() {
            document.getElementById('DellModal').style.display = 'block';
        }

        function closeModal1() {
            document.getElementById('DellModal').style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target == document.getElementById('DellModal')) {
                closeModal1();
            }
        }

        function showTab(tabName) {
            const profileTab = document.getElementById('profileTab');
            const mySectionsTab = document.getElementById('mySectionsTab');
            const tabs = document.querySelectorAll('.tab');

            if (tabName === 'profile') {
                profileTab.style.display = 'block';
                mySectionsTab.style.display = 'none';
                tabs[0].classList.add('active');
                tabs[1].classList.remove('active');
            } else {
                profileTab.style.display = 'none';
                mySectionsTab.style.display = 'block';
                tabs[0].classList.remove('active');
                tabs[1].classList.add('active');
            }
        }

        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById("profileForm");
            const saveButton = document.getElementById("saveButton");
            const initialData = new FormData(form);

            form.addEventListener("input", function() {
                const currentData = new FormData(form);
                let hasChanged = false;

                for (let [key, value] of initialData.entries()) {
                    if (currentData.get(key) !== value) {
                        hasChanged = true;
                        break;
                    }
                }

                saveButton.style.display = hasChanged ? "block" : "none";
            });
        });

        const initialFormValues = {};
        document.querySelectorAll('#profileForm input').forEach(input => {
            initialFormValues[input.name] = input.value.trim();
        });

        document.querySelectorAll('#profileForm input').forEach(input => {
            input.addEventListener('input', checkForChanges);
        });

        function checkForChanges() {
            const saveButton = document.getElementById('saveButton');
            let formChanged = false;

            document.querySelectorAll('#profileForm input').forEach(input => {
                if (input.name && initialFormValues[input.name] !== input.value.trim()) {
                    formChanged = true;
                }
            });

            saveButton.style.display = formChanged ? 'block' : 'none';
        }

        function trimFields() {
            document.querySelectorAll('#profileForm input[type="text"]').forEach(input => {
                input.value = input.value.trim();
            });
        }

        let sectionIdToLeave;

        function confirmLeave(sectionId) {
            sectionIdToLeave = sectionId;
            document.getElementById("leaveConfirmationModal").style.display = "flex";
        }

        function closeModal() {
            document.getElementById("leaveConfirmationModal").style.display = "none";
        }

        document.getElementById("confirmLeaveBtn").onclick = function() {
            const form = document.createElement("form");
            form.method = "POST";
            form.action = "/source/other/leave.php";
            
            const input = document.createElement("input");
            input.type = "hidden";
            input.name = "section_id";
            input.value = sectionIdToLeave;

            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        }

        let calendarInstance;

        function openCalendar(sectionId) {
            console.log("Opening calendar for section ID:", sectionId);
            $("#calendarModal").show();

            $.ajax({
                url: '/source/other/get_trainings.php',
                type: 'GET',
                data: { section_id: sectionId },
                success: function(data) {
                    console.log("Received data: ", data);

                    if (calendarInstance) {
                        console.log("Destroying previous calendar instance");
                        calendarInstance.destroy();
                    }

                    const trainingDates = data.map(training => training.Data);
                    console.log("Training Dates:", trainingDates);

                    if (trainingDates.length === 0) {
                        console.warn("No training dates available.");
                        return;
                    }

                    // Ініціалізація календаря
                    calendarInstance = flatpickr("#calendar", {
                        dateFormat: "Y-m-d",
                        inline: true,
                        onDayCreate: function(selectedDates, dateStr, instance, dayElem) {
                            const formattedDate = dayElem.dateObj.toISOString().split('T')[0];
                            console.log("Checking date:", formattedDate);

                            if (trainingDates.includes(formattedDate)) {
                                console.log("Date with training:", formattedDate);
                                dayElem.classList.add('has-training');
                            }
                        }
                    });

                    const style = document.createElement('style');
                    style.innerHTML = `
                        .flatpickr-day.has-training {
                            background-color: yellow !important;
                            color: black !important;
                            border-radius: 50%;
                        }
                    `;
                    document.head.appendChild(style);
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching trainings: ", error);
                }
            });
        }

        function closeCalendar() {
            console.log("Closing calendar modal");
            $("#calendarModal").hide();

            if (calendarInstance) {
                calendarInstance.clear();
            }
        }
       
    </script>
</body>
</html>