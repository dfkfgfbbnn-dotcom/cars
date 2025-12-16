<?php
require "db.php";

$input = json_decode(file_get_contents("php://input"));

$brand = $input->brand;
$model = $input->model;
$year = $input->year;
$color = $input->color;
$image_url = $input->image_url;

if (!$brand || !$model || !$year || !$color) {
    echo json_encode(["status" => "error", "message" => "Missing data"]);
    exit;
}

$sql = "INSERT INTO cars (brand, model, year, color, image_url)
        VALUES ('$brand', '$model', '$year', '$color', '$image_url')";

if ($conn->query($sql)) {
    echo json_encode(["status" => "success", "message" => "Car added successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Database error"]);
}
?>