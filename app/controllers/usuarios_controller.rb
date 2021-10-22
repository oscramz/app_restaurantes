class UsuariosController < ApplicationController

    def crear
        @usuario = Usuario.new
    end

    def guardar
        datos_usuario = params.require(:usuario).permit(:nombre_usuario, :password, :password_confirmation)
        @usuario = Usuario.new(datos_usuario)
        if @usuario.save
            #mensaje de confirmacion
        else
            render :crear
        end
    end

end