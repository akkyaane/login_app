<?php
header("Content-Type: application/json; charset=utf-8");

require_once('db/connect.php');

function sendError() {
    http_response_code(400);

    echo json_encode(["status" => 400, "message" => "Error"]);

    exit;
}

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Allow: POST");
    sendError();
}

if ($pdo === null) {
    sendError();
}

$email = $_POST["email"] ?? "";
$password = $_POST["password"] ?? "";

if (!is_string($email) || !is_string($password)) {
    sendError();
}

$email = trim($email);
$password = strtolower(trim($password));

if ($email === "" || strlen($email) > 255 || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    sendError();
}

if (!preg_match('/^[a-f0-9]{64}$/', $password)) {
    sendError();
}

$sql = $pdo->prepare("SELECT id, firstName, lastName, email, password, role FROM users WHERE email = :email AND role > 0");
$sql->execute(['email' => $email]);
$user = $sql->fetch();

$isValid = $user && password_verify($password, $user["password"]);

if ($isValid) {
    $json = [
        "status" => 200,
        "message" => "Success",
        "id" => $user["id"],
        "firstName" => $user["firstName"],
        "lastName" => $user["lastName"],
        "email" => $user["email"],
        "role" => $user["role"]
    ];
} else {
    sendError();
}

echo json_encode($json, JSON_UNESCAPED_UNICODE);

$pdo = null;
