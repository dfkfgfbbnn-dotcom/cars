<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") exit;

include "db.php";

/* طريقة قراءة الهيدر (أوثق من getallheaders أحياناً) */
$auth =
  $_SERVER['HTTP_AUTHORIZATION'] ??
  $_SERVER['REDIRECT_HTTP_AUTHORIZATION'] ??
  (function_exists("getallheaders") ? (getallheaders()["Authorization"] ?? getallheaders()["authorization"] ?? "") : "");

$auth = trim($auth);

if ($auth === "") {
  http_response_code(401);
  echo json_encode(["message" => "Unauthorized: Missing Authorization header"]);
  exit;
}

$token = (stripos($auth, "Bearer ") === 0) ? trim(substr($auth, 7)) : $auth;

$stmt = $conn->prepare("SELECT id FROM users WHERE token=? LIMIT 1");
$stmt->bind_param("s", $token);
$stmt->execute();
$res = $stmt->get_result();
$user = $res->fetch_assoc();

if (!$user) {
  http_response_code(401);
  echo json_encode(["message" => "Invalid token"]);
  exit;
}

/* لو تبين تستخدمين user id داخل أي ملف يستدعي Auth.php */
$user_id = $user["id"];
?>
