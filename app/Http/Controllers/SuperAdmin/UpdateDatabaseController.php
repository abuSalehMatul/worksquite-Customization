<?php

namespace App\Http\Controllers\SuperAdmin;

use GuzzleHttp\Client;
use App\Helper\Reply;
use Illuminate\Http\Request;
use ZanySoft\Zip\Zip;
use Illuminate\Support\Facades\File;

class UpdateDatabaseController extends SuperAdminBaseController
{
    public function __construct() {
        parent::__construct();
        $this->pageTitle = 'app.menu.updates';
        $this->pageIcon = 'ti-reload';
    }

    public function index(){
        // show new update notice
//        $lastVersion = file_get_contents(config('laraupdater.update_baseurl').'/laraupdater.json');
        $client = new Client();
        $res = $client->request('GET', config('laraupdater.update_baseurl').'/laraupdater.json', ['verify' => false]);
        $lastVersion = $res->getBody();
        $lastVersion = json_decode($lastVersion, true);

        if ( $lastVersion['version'] > File::get(public_path().'/version.txt') ){
            $this->lastVersion = $lastVersion['version'];
            $this->updateInfo = $lastVersion['description'];
        }
        $this->updateInfo = $lastVersion['description'];

        $this->worksuiteVersion = File::get(public_path().'/version.txt');
        $laravel = app();
        $this->laravelVersion = $laravel::VERSION;
        return view('super-admin.update-database.index', $this->data);
    }

    public function store(Request $request) {
        $filename_tmp = config('laraupdater.tmp_path');
        // $request->file->store($filename_tmp);
        $request->file->storeAs('user-uploads', $request->file->getClientOriginalName());
        File::move('user-uploads/'.$request->file->getClientOriginalName(), $filename_tmp.'/'.$request->file->getClientOriginalName());
    }

    public function manual()
    {
        $client = new Client();
        $res = $client->request('GET', config('laraupdater.update_baseurl').'/laraupdater.json', ['verify' => false]);
        $lastVersion = $res->getBody();
        $lastVersion = json_decode($lastVersion, true);

        if ($lastVersion['version'] > File::get('version.txt')) {
            $this->lastVersion = $lastVersion['version'];
            $this->updateInfo = $lastVersion['description'];
        }
        
        $legalFile = storage_path().'/legal';

        $legalFileInfo = File::get($legalFile);

        $legalFileInfo = explode('**', $legalFileInfo);
        $domain = $legalFileInfo[0];
        $purchaseCode = $legalFileInfo[1];
        $fullUrl = urlencode(url()->full());
        $envatoItemId = config('app.envato_item_id');

        $this->linkParameter = "domain=".$domain."&purchaseCode=".$purchaseCode."&appUrl=".$fullUrl."&itemId=".$envatoItemId;
       
        $this->encryptedDownloadLink = $this->encryptDownloadLink($this->linkParameter);
        // return $this->decryptedDownloadLink = $this->decryptDownloadLink($this->encryptedDownloadLink);

        $this->updateFilePath = config('laraupdater.tmp_path');
        return view('super-admin.update-database.manual', $this->data);
    }

    public function encryptDownloadLink($token)
    {
        $cipher_method = 'aes-128-ctr';
        $enc_key = openssl_digest('froiden-envato', 'SHA256', TRUE);
        $enc_iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length($cipher_method));
        $crypted_token = openssl_encrypt($token, $cipher_method, $enc_key, 0, $enc_iv) . "::" . bin2hex($enc_iv);
        unset($token, $cipher_method, $enc_key, $enc_iv);

        return $crypted_token;
    }

    public function decryptDownloadLink($crypted_token)
    {
        list($crypted_token, $enc_iv) = explode("::", $crypted_token);;
        $cipher_method = 'aes-128-ctr';
        $enc_key = openssl_digest('froiden-envato', 'SHA256', TRUE);
        $token = openssl_decrypt($crypted_token, $cipher_method, $enc_key, 0, hex2bin($enc_iv));
        unset($crypted_token, $cipher_method, $enc_key, $enc_iv);
        return $token;
    }

    public function deleteFile(Request $request)
    {
        $filePath = $request->filePath;
        File::delete($filePath);
        return Reply::success(__('messages.fileDeleted'));
    }

    public function install(Request $request)
    {
        File::put(public_path().'/install-version.txt', 'complete');

        $filePath = $request->filePath;
        $zip = Zip::open($filePath);

        // extract whole archive
        $zip->extract(base_path());

    }

}
