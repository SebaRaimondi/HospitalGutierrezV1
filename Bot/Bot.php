<?php

$botToken = '453768563:AAFJjd8WdUf3fm-SBiIlKpg-HGv0kZdXRmg';
$website = 'https://api.telegram.org/bot'.$botToken;

$update = file_get_contents('php://input');
$update = json_decode($update, true);

$chatId = $update['message']['chat']['id'];
$message = $update['message']['text'];

function sendMessage($chatId, $message)
{
    $url = $GLOBALS[website]."/sendMessage?chat_id=".$chatId."&text=".urlencode($message);
    file_get_contents($url);
}

$actual_link = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

switch ($message) {
    case '/test':
        sendMessage($chatId, $actual_link);
        break;
    case '/hi':
        sendMessage($chatId, "Hello!");
        break;
    default:
        sendMessage($chatId, "Command not found");
        break;
}
