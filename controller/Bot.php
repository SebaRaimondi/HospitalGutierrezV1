<?php
    class BotController
    {
        private static $instance;

        public static function getInstance()
        {
            if (!isset(self::$instance)) {
                self::$instance = new self();
                self::$commands = [];
            }

            return self::$instance;
        }

        public static function request()
        {
            $returnArray = true;
            $rawData = file_get_contents('php://input');
            $response = json_decode($rawData, $returnArray);
            $chatId = $response['message']['chat']['id'];

            // Obtener comando (y sus posibles parametros)
            $regExp = '#^(\/[a-zA-Z0-9\/]+?)(\ .*?)$#i';
            $tmp = preg_match($regExp, $response['message']['text'], $aResults);

            if (isset($aResults[1])) {
                $cmd = trim($aResults[1]);
                $params = trim($aResults[2]);
            } else {
                $cmd = trim($response['message']['text']);
                $params = '';
            }

            self::dispatcher($chatId, $cmd, $params);
        }

        private static function sendMessage($chatId, $message)
        {
            $url = self::website()."/sendMessage?chat_id=".$chatId."&text=".urlencode($message);
            file_get_contents($url);
        }

        private static function token()
        {
            return '453768563:AAFJjd8WdUf3fm-SBiIlKpg-HGv0kZdXRmg';
        }

        private static function website()
        {
            return 'https://api.telegram.org/bot'.self::token();
        }

        public static function dispatcher($chatId, $cmd, $params)
        {
            switch ($cmd) {
                case '/test':
                    self::sendMessage($chatId, "test");
                    break;
                case '/hi':
                    self::sendMessage($chatId, "Hello!");
                    break;
                default:
                    self::sendMessage($chatId, "Command not found");
                    break;
            }
        }
    }