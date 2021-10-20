class TiposPuntajesController < ApplicationController

    # Get lista tipos de puntajes
    def listar
        @todos_los_puntajes = TipoPuntaje.all
    end

end