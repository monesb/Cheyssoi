<?php
// Database connection settings
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "cheyssoi";

$showModal = false;

// Connect to database
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom_entreprise = $conn->real_escape_string($_POST["nom_entreprise"]);
    $prenom_pro = $conn->real_escape_string($_POST["prenom_pro"]);
    $nom_pro = $conn->real_escape_string($_POST["nom_pro"]);
    $intitule_poste = $conn->real_escape_string($_POST["intitule_poste"]);
    $secteur_activite = $conn->real_escape_string($_POST["secteur_activite"]);
    $email_pro = $conn->real_escape_string($_POST["email_pro"]);
    $numero_telephone = $conn->real_escape_string($_POST["numero_telephone"]);
    $siret = $conn->real_escape_string($_POST["siret"]);
    $pays_region = $conn->real_escape_string($_POST["pays_region"]);

    $sql = "INSERT INTO professionnel (nom_entreprise, prenom_pro, nom_pro, intitule_poste, secteur_activite, email_pro, numero_telephone, siret, pays_region) 
            VALUES ('$nom_entreprise', '$prenom_pro', '$nom_pro', '$intitule_poste', '$secteur_activite', '$email_pro', '$numero_telephone', '$siret', '$pays_region')";
    if ($conn->query($sql) === TRUE) {
        header("Location: https://cheyssoi.kesug.com");
        exit;
    }
}

$conn->close();
?>
