<?php
include "Auth.php";   // لازم يكون فوق
include "db.php";

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$result = $conn->query("SELECT * FROM cars");
$cars = [];

while ($row = $result->fetch_assoc()) {
    $cars[] = $row;
}

echo json_encode($cars);
?>
