Crear CRUD para registrar usuarios en la app
Crear el modelo

rails g model Usuario nombre_usuario:string password_digest:string
Ejecutar la migración

rails db:migrate
Quitar el comentario de la gema de bcrypt en Gemfile

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
Ejecutar el comando bundle en consola

bundle
Configurar el modelo para utilizar la gema bcrypt

# usuario.rb
# Los modelos son en singular
class Usuario < ApplicationRecord
    has_secure_password
    
end
Agregar las validaciones al modelo del usuario

# usuario.rb
# Los modelos son en singular
class Usuario < ApplicationRecord
    has_secure_password

    validates(:nombre_usuario, presence: true)
    validates(:nombre_usuario, uniqueness: true)
    
end
Crear el archivo de controlador

# app/controllers/usuarios_controller.rb
# Los controladores son el plural
class UsuariosController < ApplicationController
    
end
Crear el método y la vista para el método

# Los controladores son el plural
class UsuariosController < ApplicationController
    
    # GET /usuarios/nuevo
    def crear
    end
end
Crear el archivo app/views/usuarios/crear.html.erb

Crear la ruta GET para la vista de crear un usuario

# config/routes.rb
# Usuarios

get       'usuarios/nuevo',           to: 'usuarios#crear',         as: 'nuevo_usuario'
Crear el formulario en el archivo app/views/usuarios/crear.html.erb

<h1>Registro</h1>

<%= form_with(model: @usuario) do |formulario| %>
    <div class="mb-3">
        <%= formulario.label      :nombre_usuario, class: 'form-label'%>
        <%= formulario.text_field :nombre_usuario, class: 'form-control' %>
    </div>
    
    <div class="mb-3">
        <%= formulario.label          :password, class: 'form-label' %>
        <%= formulario.password_field :password, class: 'form-control' %>
    </div>
    
    <div class="mb-3">
        <%= formulario.label          :password_confirmation, class: 'form-label' %>
        <%= formulario.password_field :password_confirmation, class: 'form-control' %>
    </div>


    <%= formulario.submit %>
<% end %>
Agregar la ruta del post (momentánea)

# Usuarios

get       'usuarios/nuevo',           to: 'usuarios#crear',         as: 'nuevo_usuario'
post      'usuarios',                 to: 'usuarios#guardar',       as: 'usuarios'
Crear la variable @usuario en el controlador

# Los controladores son el plural
class UsuariosController < ApplicationController
    
    # GET /usuarios/nuevo
    def crear
        @usuario = Usuario.new
    end
end
Definir el método guardar para guardar los usuarios por formulario

# app/controllers/usuarios_controller.rb
# POST /usuarios
def guardar
    datos_usuario = params.require(:usuario).permit(:nombre_usuario, :password, :password_confirmation)
    @usuario = Usuario.new(datos_usuario)
    if @usuario.save
        # mostrar un mensaje o vista de confirmación
    else
        render :crear
    end
end
Agregar los errores a la vista del formulario para crear un usuario

<h1>Registro</h1>

<%= form_with(model: @usuario) do |formulario| %>
    <div class="mb-3">
        <%= formulario.label      :nombre_usuario, class: 'form-label'%>
        <%= formulario.text_field :nombre_usuario, class: 'form-control' %>
        <% if @usuario.errors[:nombre_usuario].any? %>
            <div class="alert alert-danger" role="alert">
                <%= @usuario.errors[:nombre_usuario].first %>
            </div>
        <% end %>
    </div>
    
    <div class="mb-3">
        <%= formulario.label          :password, class: 'form-label' %>
        <%= formulario.password_field :password, class: 'form-control' %>
        <% if @usuario.errors[:password].any? %>
            <div class="alert alert-danger" role="alert">
                <%= @usuario.errors[:password].first %>
            </div>
        <% end %>
    </div>
    
    <div class="mb-3">
        <%= formulario.label          :password_confirmation, class: 'form-label' %>
        <%= formulario.password_field :password_confirmation, class: 'form-control' %>
        <% if @usuario.errors[:password_confirmation].any? %>
            <div class="alert alert-danger" role="alert">
                <%= @usuario.errors[:password_confirmation].first %>
            </div>
        <% end %>
    </div>


    <%= formulario.submit %>
<% end %>
Definir un nuevo método mostrar

# GET /usuarios/:id
def mostrar
    @usuario = Usuario.find(params[:id])
end
Crear la vista app/views/usuarios/mostrar.html.erb

<h1>Bienvenido</h1>

<%= @usuario.nombre_usuario %>
Dar lógica al método mostrar y redirigir después de guardar en la base de datos

# POST /usuarios
def guardar
    datos_usuario = params.require(:usuario).permit(:nombre_usuario, :password, :password_confirmation)
    @usuario = Usuario.new(datos_usuario)
    if @usuario.save
        redirect_to usuario_path(@usuario)
    else
        render :crear
    end
end
Definir la ruta, vista y método para mostrar la vista de editar

# config/routes.rb
get       'usuarios/:id/editar',      to: 'usuarios#editar',        as: 'editar_usuario'
# app/controllers/usuarios_controller.rb
def editar

end
Buscar el usuario en la base de datos

# app/controllers/usuarios_controller.rb

# GET /usuarios/:id/editar
def editar
    @usuario = Usuario.find(params[:id])
end
Agregar un botón de navegación para ver el formulario desde mostrar.html.erb

<!-- app/views/usuarios/mostrar.html.erb -->
<h1>Bienvenido</h1>

<%= @usuario.nombre_usuario %>

<%= link_to "Editar", editar_usuario_path(@usuario), class: 'btn btn-warning' %>
Agregar la ruta patch y put para permitir la actualización de datos

#routes.rb
patch     'usuarios/:id',             to: 'usuarios#actualizar'
Agregar la lógica y de actualizar en un nuevo método en el controlador

# PATCH /usuarios/:id
def actualizar
    @usuario = Usuario.find(params[:id])
    datos_usuario = params.require(:usuario).permit(:nombre_usuario, :password, :password_confirmation)
    if @usuario.update(datos_usuario)
        redirect_to usuario_path(@usuario)
    else
        render :editar
    end
end
Agregar lógica para eliminar un usuario y enviar un mensaje de confirmación

# app/controllers/usuarios_controller.rb
# DELETE /usuarios/:id
def eliminar
    @usuario = Usuario.find(params[:id])
    if @usuario.destroy # intentar eliminar un registro
        flash[:eliminar] = "Usuario #{@usuario.nombre_usuario} eliminado"
    else
        flash[:eliminar] = "NO se pudo eliminar"
    end       
    redirect_to nuevo_usuario_path
end
Agregar la ruta delete

delete    'usuarios/:id',             to: 'usuarios#eliminar'
Agregar el botón para eliminar una cuenta en la vista app/views/usuarios/mostrar.html.erb

<h1>Bienvenido</h1>

<%= @usuario.nombre_usuario %>

<%= link_to "Editar", editar_usuario_path(@usuario), class: 'btn btn-warning' %>

<%= link_to usuario_path(@usuario), method: :delete, class: 'btn btn-danger' do %>
    <i class="fas fa-trash-alt"></i>
    Eliminar cuenta
<% end %>
Mostrar el mensaje enviado desde eliminar hacia la vista de crear.html.erb

<h1>Registro</h1>

<% if flash[:eliminar] %>
    <div class="alert alert-danger" role="alert">
        <%= flash[:eliminar] %>
    </div>
<% end %>

<%= render 'formulario', base_usuario: @usuario %>