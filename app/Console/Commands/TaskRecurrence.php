<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Helper\ReccurrenceGenerator;

class TaskRecurrence extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'recurr:check';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check the pattern and generate reccurrence of tasks';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
       $recurrence= new ReccurrenceGenerator;
    }
}
