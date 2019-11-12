<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRecurrencePatternsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recurrence_patterns', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('parent_id');
            $table->string('recurring_type');
            $table->integer('separation_count');
            $table->integer('max_num_recurrence');
            $table->integer('day_of_week');
            $table->integer('week_of_month');
            $table->integer('day_of_month');
            $table->integer('month_of_year');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recurrence_patterns');
    }
}
