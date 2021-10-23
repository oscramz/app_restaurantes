class PuntajesController < ApplicationController

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
        @puntaje = TipoPuntaje.find(params[:id])
    end

    #get /:id/editar
    def editar
        @puntaje = TipoPuntaje.find(params[:id])
    end

    #post /puntaje
    def guardar
        nuevo_puntaje = params.require(:puntaje).permit(:tipo)
        @puntaje = TipoPuntaje.new(nuevo_puntaje)
        if @puntaje.save
            redirect_to puntajes_path(@puntaje)
        else
            render :crear
        end
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