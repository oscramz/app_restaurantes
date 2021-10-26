class Usuario < ApplicationRecord
    has_secure_password

    has_many :invitaciones
    has_many :inv_restaurantes, through: :invitaciones, source: :restaurante

    has_many :promociones
    has_many :restaurantes, through: :promociones

    has_many :puntajes_platos
    has_many :puntajes_restaurantes

    validates(:nombre_usuario, presence: true)
    validates(:nombre_usuario, uniqueness: true)
end
