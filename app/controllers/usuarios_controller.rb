class UsuariosController < ApplicationController

    def crear
        @usuario = Usuario.new
    end

    def mostrar
        @usuario = Usuario.find(params[:id])
    end

    def editar
        @usuario = Usuario.find(params[:id])
    end

    def actualizar
        @usuario = Usuario.find(params[:id])
        datos_usuario = params.require(:usuario).permit(:nombre_usuario, :password, :password_confirmation)
        if @usuario.update(datos_usuario)
            redirect_to usuario_path(@usuario)
        else
            render :editar
        end
    end

    def guardar
        datos_usuario = params.require(:usuario).permit(:nombre_usuario, :password, :password_confirmation)
        @usuario = Usuario.new(datos_usuario)
        if @usuario.save
            #mensaje de confirmacion
            redirect_to usuario_path(@usuario)
        else
            render :crear
        end
    end

    
    def eliminar
        @usuario = Usuario.find(params[:id])
        @usuario.destroy
        
    end

end