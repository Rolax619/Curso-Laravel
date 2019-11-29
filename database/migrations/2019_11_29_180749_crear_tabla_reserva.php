<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CrearTablaReserva extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reserva', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('forma_pago',50);
            $table->date('fecha');
            $table->unsignedBigInteger('persona_id');
            $table->foreign('persona_id','fk_reserva_persona')->references('id')->on('persona')->onDelete('restrict')->onUpdate('restrict');
            $table->unsignedBigInteger('servicio_id');
            $table->foreign('servicio_id','fk_reserva_servivio')->references('id')->on('servicio')->onDelete('restrict')->onUpdate('restrict');
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
        Schema::dropIfExists('reserva');
    }
}
