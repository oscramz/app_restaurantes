class  TiposComidasController < ApplicationController

    # GET /tipos_comidas
    def listar
        @todos_los_tipos = TipoComida.all
        @titulo_link = "Registrar nuevo tipo de comida"
    end

    #get /tipos_comidas/nuevo
    def crear
        @tipo_comida = TipoComida.new
    end

    #get /tipos_comidas/:id
    def mostrar
        #vista para mostrar detalle de tipo de comida
        #por ejemplo, mostrar todos los rest adjuntos
        @tipo_comida = TipoComida.find(params[:id])
    end

    #get / tipos_comidas/:id/editar
    def editar
        #mostrar formulario con los datos de un registro para editarlos
        @tipo_comida = TipoComida.find(params[:id])
    end

    #post /tipos_comidas
    def guardar
        #guardar todo lo que llegue del formulario en la DB
        datos_tipo_comida = params.require(:tipo_comida).permit(:tipo)
        nuevo_tipo = TipoComida.new(datos_tipo_comida)
        nuevo_tipo.save
        redirect_to tipos_comidas_path
    end

    #delete tipos_comidas/:id
    def eliminar
        #pasos para eliminar un registro
        #1. buscar el registro por ID
        tipo = TipoComida.find(params[:id])
        #2 Intentar eliminar el registro
        tipo.destroy
        redirect_to tipos_comidas_path
    end

end