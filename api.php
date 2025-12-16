<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") exit;

include "db.php";

/* ===== Helpers ===== */
function j($data, $code = 200){
  http_response_code($code);
  echo json_encode($data);
  exit;
}

function getAuthToken(): string {
  // 1) Try Apache/Nginx server vars
  $hdr = $_SERVER['HTTP_AUTHORIZATION'] ?? $_SERVER['REDIRECT_HTTP_AUTHORIZATION'] ?? '';

  // 2) Fallback to getallheaders (works well on XAMPP)
  if (!$hdr && function_exists('getallheaders')) {
    $headers = getallheaders();
    $hdr = $headers['Authorization'] ?? $headers['authorization'] ?? '';
  }

  if (!$hdr) return '';

  if (stripos($hdr, 'Bearer ') === 0) return trim(substr($hdr, 7));
  return trim($hdr);
}

function requireAuth($conn){
  $token = getAuthToken();
  if ($token === '') j(["message" => "Unauthorized: Missing Authorization header"], 401);

  $stmt = $conn->prepare("SELECT id FROM users WHERE token=? LIMIT 1");
  $stmt->bind_param("s", $token);
  $stmt->execute();
  $res = $stmt->get_result();
  $u = $res->fetch_assoc();

  if(!$u) j(["message" => "Unauthorized: Invalid token"], 401);
  return $u["id"];
}

/* Require auth for all methods here */
requireAuth($conn);

$method = $_SERVER["REQUEST_METHOD"];

/* ===== GET one ===== */
if ($method === "GET" && isset($_GET["id"])) {
  $id = intval($_GET["id"]);
  $stmt = $conn->prepare("SELECT * FROM cars WHERE id=? LIMIT 1");
  $stmt->bind_param("i", $id);
  $stmt->execute();
  $car = $stmt->get_result()->fetch_assoc();

  if ($car) j($car);
  j(["message" => "Car not found"], 404);
}

/* ===== GET all ===== */
if ($method === "GET") {
  $q = $conn->query("SELECT * FROM cars ORDER BY id DESC");
  j($q->fetch_all(MYSQLI_ASSOC));
}

/* ===== POST add ===== */
if ($method === "POST") {
  $data = json_decode(file_get_contents("php://input"), true);
  $brand = trim($data["brand"] ?? "");
  $model = trim($data["model"] ?? "");
  $year  = intval($data["year"] ?? 0);
  $color = trim($data["color"] ?? "");

  if($brand==="" || $model==="" || $year<=0 || $color===""){
    j(["message" => "brand, model, year, color are required"], 400);
  }

  $stmt = $conn->prepare("INSERT INTO cars (brand, model, year, color) VALUES (?,?,?,?)");
  $stmt->bind_param("ssis", $brand, $model, $year, $color);
  $stmt->execute();

  j(["message"=>"Car added", "id"=>$conn->insert_id], 201);
}

/* ===== PUT update ===== */
if ($method === "PUT") {
  if(!isset($_GET["id"])) j(["message"=>"Missing id"], 400);
  $id = intval($_GET["id"]);

  $data = json_decode(file_get_contents("php://input"), true);
  $brand = trim($data["brand"] ?? "");
  $model = trim($data["model"] ?? "");
  $year  = intval($data["year"] ?? 0);
  $color = trim($data["color"] ?? "");

  if($brand==="" || $model==="" || $year<=0 || $color===""){
    j(["message" => "brand, model, year, color are required"], 400);
  }

  $stmt = $conn->prepare("UPDATE cars SET brand=?, model=?, year=?, color=? WHERE id=?");
  $stmt->bind_param("ssisi", $brand, $model, $year, $color, $id);
  $stmt->execute();

  if($stmt->affected_rows > 0) j(["message"=>"Car updated"]);
  j(["message"=>"Car not found or no changes"], 404);
}

/* ===== DELETE ===== */
if ($method === "DELETE") {
  if(!isset($_GET["id"])) j(["message"=>"Missing id"], 400);
  $id = intval($_GET["id"]);

  $stmt = $conn->prepare("DELETE FROM cars WHERE id=?");
  $stmt->bind_param("i", $id);
  $stmt->execute();

  if($stmt->affected_rows > 0) j(["message"=>"Car deleted"]);
  j(["message"=>"Car not found"], 404);
}

j(["message"=>"Method not allowed"], 405);