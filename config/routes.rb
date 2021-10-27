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
  get    'puntajes',                 to: 'puntajes#listar',        as: 'tipos_puntajes'
  get    'puntajes/nuevo',           to: 'puntajes#crear',         as: 'nuevo_tipo_puntaje'
  get    'puntajes/:id',             to: 'puntajes#mostrar',       as: 'tipo_puntaje'
  get    'puntajes/:id/editar',      to: 'puntajes#editar',        as: 'editar_tipo_puntaje'

  post   'puntajes',                 to: 'puntajes#guardar'
  put    'puntajes/:id',             to: 'puntajes#actualizar'
  patch  'puntajes/:id',             to: 'puntajes#actualizar'
  delete 'puntajes/:id',             to: 'puntajes#eliminar'

  #rutas usuarios
  get    'usuarios/nuevo',           to: 'usuarios#crear',        as: 'nuevo_usuario'
  get    'usuarios/:id',             to: 'usuarios#mostrar',      as: 'usuario'
  get    'usuarios/:id/editar',       to: 'usuarios#editar',       as: 'editar_usuario'
  
  post   'usuarios',                 to: 'usuarios#guardar',      as: 'usuarios'
  put    'usuarios/:id',             to: 'usuarios#actualizar'
  patch  'usuarios/:id',             to: 'usuarios#actualizar'
  delete 'usuarios/:id',             to: 'usuarios#eliminar'

  #rutas restaurantes
  get    'restaurantes',             to: 'restaurantes#listar',     as: 'restaurantes'
  get    'restaurantes/nuevo',       to: 'restaurantes#crear',      as: 'nuevo_restaurante'
  get    'restaurantes/:id',         to: 'restaurantes#mostrar',    as: 'restaurante'
  get    'restaurantes/:id/editar',  to: 'restaurantes#editar',     as: 'editar_restaurantes'
  
  post   'restaurantes',             to: 'restaurantes#guardar'
  put    'restaurantes/:id',         to: 'restaurantes#actualizar'
  patch  'restaurantes/:id',         to: 'restaurantes#actualizar'
  delete 'restaurantes/:id',         to: 'restaurantes#eliminar'

end