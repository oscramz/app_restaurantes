class RestaurantesController < ApplicationController

    before_action :asignar_restaurante, only: [:editar, :mostrar, :actualizar, :eliminar]
    def listar
        @todos_restaurantes = Restaurante.all
    end
    
    def crear
        @restaurante = Restaurante.new
        @tipos_comidas = TipoComida.all
    end
    
    def editar
        @tipos_comidas = TipoComida.all
    end

    def mostrar
        
    end

    def actualizar
        @restaurante.nombre = params_restaurantes[:nombre]
        @restaurante.tipo_comida_id = params_restaurantes[:tipo_comida_id]
        if @restaurante.save
            redirect_to restaurantes_path
        else
            @tipos_comidas = TipoComida.all
            render :editar
        end
    end

    def guardar
        @restaurante = Restaurante.new(params_restaurantes)
        if @restaurante.save
                redirect_to restaurantes_path
        else
            @tipos_comidas = TipoComida.all
            render :crear
        end
    end

    def eliminar
        @restaurante.destroy
        redirect_to restaurantes_path
    end

    private

    def asignar_restaurante
        @restaurante = Restaurante.find(params[:id])
    end
    
    def params_restaurantes
        datos_restaurantes = params.require(:restaurante).permit(:nombre, :tipo_comida_id)
    end
end