class PuntajesController < ApplicationController

    # Get lista tipos de puntaje
    def listar
        @tipos_puntajes = TipoPuntaje.all
    end

    #get /nuevo_puntaje
    def crear
        @puntaje = Puntaje.new
    end

    #get /:id
    def mostrar
        @puntaje = TipoPuntaje.find(params[:id])
    end

    #get /:id/editar
    def editar
        @puntaje = TipoPuntaje.find(params[:id])
    end

    #post /puntaje
    def guardar
        @tipo_puntaje = params.require(:puntaje).permit(:tipo)
        nuevo_puntaje = TipoPuntaje.new(tipo_puntaje)
        nuevo_puntaje.save
        redirect_to puntajes_path
    end

    def actualizar
        @puntaje = TipoPuntaje.find(params[:id])
        tipo_puntaje = params.require(:puntaje).permit(:tipo)
        @puntaje.tipo = tipo_puntaje[:tipo]
        @puntaje.save
        redirect_to nuevo_puntaje_path
    end

    def eliminar
        tipo = TipoPuntaje.find(params[:id])
        tipo.destroy
        redirect_to nuevo_puntaje_path
    end

end