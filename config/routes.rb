Rails.application.routes.draw do
  get 'tipos_comidas', to: 'tipos_comidas#listar'
end