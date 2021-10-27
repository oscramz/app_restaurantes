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
        params_usuario
        if @usuario.update(params_usuario)
            redirect_to usuario_path(@usuario)
        else
            render :editar
        end
    end

    def guardar
        params_usuario
        @usuario = Usuario.new(params_usuario)
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

    private
    def params_usuario
        params.require(:usuario).permit(:nombre_usuario, :password, :password_confirmation)
    end

end