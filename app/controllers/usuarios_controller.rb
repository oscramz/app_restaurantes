class UsuariosController < ApplicationController

    def crear
        @usuario = Usuario.new
    end

end