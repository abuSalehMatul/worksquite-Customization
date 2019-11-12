<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnViewList extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('view_arrays', function (Blueprint $table) {
            $table->integer('is_project')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_project_phase')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_start_date')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_due_date')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_end_date')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_priority')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_project_cat')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_task_cat')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_est_hour')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_act_hour')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_created_at')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_section_tiles')->default(1)->comment('0:not_view,1:view');
            $table->integer('is_tag')->default(1)->comment('0:not_view,1:view');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('view_arrays', function (Blueprint $table) {
            //
        });
    }
}
