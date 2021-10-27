class RestaurantesController < ApplicationController

    def listar
        @todos_restaurantes = Restaurante.all
        @tipos_comidas = TipoComida.all
    end
    
    def crear
        @restaurante = Restaurante.new
        @tipos_comidas = TipoComida.all
    end

    def mostrar
        
    end

    def editar
        @restaurante = Restaurante.find(params[:id])
    end

    def guardar
        datos_restaurantes = params.require(:restaurante).permit(:nombre, :tipo_comida_id)
        @restaurante = Restaurante.new(datos_restaurantes)
        if @restaurante.save
                redirect_to restaurantes_path
        else
            @tipos_comidas = TipoComida.all
            render :crear
        end
    end

end