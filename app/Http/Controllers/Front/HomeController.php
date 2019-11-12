<?php

namespace App\Http\Controllers\Front;

use App\Feature;
use App\Helper\Reply;
use App\Http\Requests\Front\ContactUs\ContactUsRequest;
use App\Notifications\ContactUsMail;
use App\Package;
use App\User;
use Illuminate\Support\Facades\Notification;
use App\Module;

class HomeController extends FrontBaseController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            \Illuminate\Support\Facades\DB::connection()->getPdo();
        } catch (\Exception $e) {
            return redirect('install');
        }
        
        $this->pageTitle = 'Home';
        $this->packages = Package::where('default', 'no')->get();

        $features = Feature::all();
        $this->featureWithImages = $features->filter(function ($value, $key) {
            return $value->type == 'image';
        });

        $this->featureWithIcons = $features->filter(function ($value, $key) {
            return $value->type == 'icon';
        });
        $this->packageFeatures = Module::get()->pluck('module_name')->toArray();

        return view('front.home', $this->data);
    }

    public function contactUs(ContactUsRequest $request) {

        $this->pageTitle = 'Contact Us';
        $superAdmins = User::where('super_admin', '1')->get();

        $this->table = '<table><tbody style="color:#0000009c;">
        <tr>
            <td><p>Name : </p></td>
            <td><p>'.ucwords($request->name).'</p></td>
        </tr>
        <tr>
            <td style="font-family: Avenir, Helvetica, sans-serif;box-sizing: border-box;min-width: 98px;vertical-align: super;"><p style="font-family: Avenir, Helvetica, sans-serif; box-sizing: border-box; color: #74787E; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left;">Message : </p></td>
            <td><p>'.$request->message.'</p></td>
        </tr>
</tbody>
        
</table><br>';

        Notification::route('mail', $this->detail->email)
            ->notify(new ContactUsMail($this->data, $request->email));


        return Reply::success('Thanks for contacting us. We will catch you soon.');
    }

    public function updateDatabase()
    {
        \Illuminate\Support\Facades\Artisan::call('migrate', array('--force' => true));

        return 'Database updated successfully. <a href="'.route('login').'">Click here to Login</a>';
    }

    public function clearCache()
    {
        \Illuminate\Support\Facades\Artisan::call('config:clear');
        \Illuminate\Support\Facades\Artisan::call('route:clear');

        if (request()->ajax()) {
            return Reply::success('Cache cleared successfully.');
        }

        return 'Cache cleared successfully. <a href="'.route('login').'">Click here to Login</a>';
    }
    
    public function refreshCache()
    {
        \Illuminate\Support\Facades\Artisan::call('config:cache');
        \Illuminate\Support\Facades\Artisan::call('route:cache');

        if (request()->ajax()) {
            return Reply::success('Cache refreshed successfully.');
        }

        return 'Cache refreshed successfully. <a href="'.route('login').'">Click here to Login</a>';
    }
}

