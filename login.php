<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") exit;

include "db.php";

$data = json_decode(file_get_contents("php://input"), true);
$email    = trim($data["email"] ?? "");
$password = trim($data["password"] ?? "");

if ($email === "" || $password === "") {
    http_response_code(400);
    echo json_encode(["message" => "Email and password are required"]);
    exit;
}

$stmt = $conn->prepare("SELECT id, password FROM users WHERE email=? LIMIT 1");
$stmt->bind_param("s", $email);
$stmt->execute();
$res = $stmt->get_result();
$user = $res->fetch_assoc();

if ($user && password_verify($password, $user["password"])) {

    $token = bin2hex(random_bytes(16));

    $up = $conn->prepare("UPDATE users SET token=? WHERE id=?");
    $up->bind_param("si", $token, $user["id"]);
    $up->execute();

    echo json_encode(["message" => "Login successful", "token" => $token]);
} else {
    http_response_code(401);
    echo json_encode(["message" => "Invalid email or password"]);
}
?>
