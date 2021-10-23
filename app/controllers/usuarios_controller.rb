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
        if @usuario.destroy
            flash[:eliminar] = "Usuario #{@usuario.nombre_usuario} eliminado con éxito"
        else
            flash[:eliminar] = "El usuario no pudo ser eliminado"
        end
        redirect_to nuevo_usuario_path
    end

end