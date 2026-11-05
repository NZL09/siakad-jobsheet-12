<?php
header('HTTP/1.1 503 Service Unavailable');
header('Retry-After: 3600'); 
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Situs Dalam Perbaikan</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: #ffffff;
            color: #333333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            padding: 0 20px;
            text-align: center;
        }
        .container {
            max-width: 500px;
        }
        h1 {
            font-size: 2rem;
            font-weight: 600;
            margin: 0 0 10px 0;
        }
        p {
            font-size: 1rem;
            line-height: 1.6;
            color: #666666;
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Situs Sedang Dalam Perbaikan</h1>
        <p>Mohon maaf atas ketidaknyamanan ini. Kami sedang melakukan pemeliharaan rutin dan akan segera kembali.</p>
    </div>
</body>
</html>