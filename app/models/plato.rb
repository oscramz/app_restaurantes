class Plato < ApplicationRecord
  belongs_to :restaurante

  validates(:nombre, presence: true)
  validates(:precio, presence: true)
  validates(:descripcion, presence: true)
end
