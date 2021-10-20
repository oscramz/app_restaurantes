Rails.application.routes.draw do
  # rutas tipos comidas
  get    'tipos_comidas',            to: 'tipos_comidas#listar',    as: 'tipos_comidas'       #listar
  get    'tipos_comidas/nuevo',      to: 'tipos_comidas#crear',     as: 'nuevo_tipo_comida'   #registro comida
  get    'tipos_comidas/:id',        to: 'tipos_comidas#mostrar',   as: 'tipo_comida'         #detalle tipo de comida
  get    'tipos_comidas/:id/editar', to: 'tipos_comidas#editar',    as: 'editar_tipo_comida'  #editar tipo comida

  post   'tipos_comidas',            to: 'tipos_comidas#guardar'
  put    'tipos_comidas/:id',        to: 'tipos_comidas#actualizar'
  patch  'tipos_comidas/:id',        to: 'tipos_comidas#actualizar'
  delete 'tipos_comidas/:id',        to: 'tipos_comidas#eliminar'

  # rutas tipos puntajes
  get    'tipos_puntajes',           to: 'tipos_puntajes#listar',   as: 'tipos_puntajes'
  
end