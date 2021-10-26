class PuntajeRestaurante < ApplicationRecord
  belongs_to :tipo_puntaje
  belongs_to :restaurante
  belongs_to :usuario
end
