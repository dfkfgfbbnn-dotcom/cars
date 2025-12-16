<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") exit;

include "Auth.php";
include "db.php";

$data = json_decode(file_get_contents("php://input"), true);

$brand = trim($data["brand"] ?? "");
$model = trim($data["model"] ?? "");
$year  = intval($data["year"] ?? 0);
$color = trim($data["color"] ?? "");

if ($brand === "" || $model === "" || $year === 0 || $color === "") {
    http_response_code(400);
    echo json_encode(["message" => "Missing fields"]);
    exit;
}

$stmt = $conn->prepare("INSERT INTO cars (brand, model, year, color) VALUES (?,?,?,?)");
$stmt->bind_param("ssis", $brand, $model, $year, $color);

if ($stmt->execute()) {
    echo json_encode(["message" => "Car added successfully", "id" => $stmt->insert_id]);
} else {
    http_response_code(500);
    echo json_encode(["message" => "DB error", "error" => $conn->error]);
}
?>
