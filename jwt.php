<?php
// config/jwt.php
$jwt_secret = 'cars-secret-key-2023';

function createJWT($payload) {
    global $jwt_secret;
    
    $header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);
    $payload['exp'] = time() + (24 * 60 * 60); // 24 hours
    
    $base64Header = base64_encode($header);
    $base64Payload = base64_encode(json_encode($payload));
    
    $signature = hash_hmac('sha256', "$base64Header.$base64Payload", $jwt_secret, true);
    $base64Signature = base64_encode($signature);
    
    return "$base64Header.$base64Payload.$base64Signature";
}

function verifyJWT() {
    global $jwt_secret;
    
    $headers = getallheaders();
    $authHeader = $headers['Authorization'] ?? '';
    
    if (empty($authHeader) || !str_starts_with($authHeader, 'Bearer ')) {
        return false;
    }
    
    $token = substr($authHeader, 7);
    $parts = explode('.', $token);
    
    if (count($parts) !== 3) {
        return false;
    }
    
    list($base64Header, $base64Payload, $base64Signature) = $parts;
    
    $signature = base64_decode($base64Signature);
    $expectedSignature = hash_hmac('sha256', "$base64Header.$base64Payload", $jwt_secret, true);
    
    if (!hash_equals($signature, $expectedSignature)) {
        return false;
    }
    
    $payload = json_decode(base64_decode($base64Payload), true);
    
    if ($payload['exp'] < time()) {
        return false;
    }
    
    return $payload;
}
?>