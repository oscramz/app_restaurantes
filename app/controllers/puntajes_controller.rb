class PuntajesController < ApplicationController

    before_action :asignar_puntaje, only: [:mostrar, :editar, :actualizar, :eliminar]
    # Get lista tipos de puntaje
    def listar
        @tipos_puntajes = TipoPuntaje.all
    end

    #get /nuevo_puntaje
    def crear
        @puntaje = TipoPuntaje.new
    end

    #get /:id
    def mostrar

    end

    #get /:id/editar
    def editar

    end

    #post /puntaje
    def guardar
        nuevo_puntaje = TipoPuntaje.new(params_puntaje)
        nuevo_puntaje.save
        redirect_to tipos_puntajes_path
    end

    def actualizar
        @puntaje.tipo = params_puntaje[:tipo]
        @puntaje.save
        redirect_to tipos_puntajes_path
    end

    def eliminar
        @puntaje.destroy
        redirect_to tipos_puntajes_path
    end

    private
    def asignar_puntaje
        @puntaje = TipoPuntaje.find(params[:id])
    end

    def params_puntaje
        params.require(:tipo_puntaje).permit(:tipo)
    end
    
end