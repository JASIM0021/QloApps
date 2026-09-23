<?php
/*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

class FileLoggerCore extends AbstractLogger
{
    protected $filename = '';

    /**
    * Write the message in the log file
    *
    * @param string message
    * @param level
    */
    protected function logMessage($message, $level)
    {
        $filename = $this->getFilename();
        if (empty($filename)) {
            return false;
        }
        if (!is_string($message)) {
            $message = print_r($message, true);
        }
        $formatted_message = '*'.$this->level_value[$level].'* '."\t".date('Y/m/d - H:i:s').': '.$message."\r\n";
        return (bool)@file_put_contents($filename, $formatted_message, FILE_APPEND);
    }

    /**
    * Check if the specified filename is writable and set the filename
    *
    * @param string $filename
    */
    public function setFilename($filename)
    {
        $dir = dirname($filename);
        if (!is_dir($dir)) {
            @mkdir($dir, 0777, true);
        }
        if (is_writable($dir)) {
            $this->filename = $filename;
        } else {
            @chmod($dir, 0777);
            if (is_writable($dir)) {
                $this->filename = $filename;
            } else {
                @error_log('Directory '.$dir.' is not writable');
            }
        }
    }

    /**
    * Get the log filename
    *
    * @return string
    */
    public function getFilename()
    {
        return $this->filename;
    }
}
