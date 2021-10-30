Modelos
Objetivo de la clase de hoy: Registrar restaurantes por consola y verlos en una lista
Crear el proyecto utilizando el comando

# rails new <nombre_aplicación> -> crea una aplicación en rails
# -d postgresql -> configura el proyecto con la gema pg
# -T -> crea un proyecto sin archivos de prueba de Minitest (vamos a utilizar Rspec)
sudo apt-get install libpq-dev # instalar bibliotecas necesarias para la gema de postgres
rails new <nombre_aplicación> -d postgresql -T
Configurar el postgres

host: 127.0.0.1
port: 5433          # 5432
username: postgres
password: postgres  # es su propio password
Crear el modelo Tipos Comida (SINGULAR)

# crear un modelo llamado TipoComida con un campo
# tipo:string
rails g model TipoComida tipo:string
Ejecutando la migración

# realizar la creación y migración de la base de datos
rails db:create     # crear la base de datos 1 vez
rails db:migrate    # migrar lo que sea necesario
Abrir la consola de Rails

# abrir la consola con
rails c
Crear un registro en la base de datos con TipoComida

tipo_italiana = TipoComida.new(tipo: 'italiana')    # creamos un objeto TipoComida
tipo_italiana.save                                      # guardamos en objeto en la BD
Agregar un controlador y una vista que permita ver los registros en la base de datos

# app/controllers/tipos_comidas_controller.rb
class TiposComidasController < ApplicationController
    # GET /tipos_comidas
    def listar
        @todos_los_tipos = TipoComida.all.order(id: :asc)
        @titulo_link = "Registrar nuevo tipo de comida"
    end
end
Agregar a la tabla de registros un botón utilizando la etiqueta <%= link_to %> para eliminar los registros de la base de datos

<h1>
    <i class="fas fa-fish"></i>
    Listar los tipos de restaurantes
</h1>

<%= link_to @titulo_link, nuevo_tipo_comida_path, class: 'btn btn-primary' %>

<table class="table">
    <tr>
        <th>id</th>
        <th class="text-center">tipo</th>
        <th class="text-end">acciones</th>
    </tr>
    <% @todos_los_tipos.each do |tipo_comida| %>
        <tr>
            <td> <%= tipo_comida.id %> </td>
            <td class="text-center"> 
                <%= link_to tipo_comida_path(tipo_comida) do %>
                    <i class="fas fa-fish"></i>
                    <%= tipo_comida.tipo %>
                <% end %>
            </td>
            <td class="text-end">
                <%= link_to tipo_comida_path(tipo_comida), class: 'btn btn-danger', method: :delete, data: { confirm: '¿Está seguro que quiere eliminar el registro?' } do %>
                    <i class="fas fa-eraser"></i>
                    Borrar
                <% end %>
                <%= link_to editar_tipo_comida_path(tipo_comida), class: 'btn btn-warning' do %>
                    <i class="fas fa-edit"></i>
                    Editar
                <% end %>
            </td>
        </tr>
    <% end %>
</table>
Crear una vista para definir un formulario utilizando un POST para crear un nuevo TipoComida

<h1>Formulario para crear un nuevo tipo de comida</h1>

<%= render 'formulario', base_tipo_comida: @tipo_comida  %>

<%= link_to 'Volver', tipos_comidas_path %>
Definir un método en el controlador para capturar los datos enviados y almacenarlos en la BD

 # POST /tipos_comidas
def guardar
    # guardar lo que llegue del formulario en la base de datos
    datos_tipo_comida = params.require(:tipo_comida).permit(:tipo)
    nuevo_tipo = TipoComida.new(datos_tipo_comida)
    nuevo_tipo.save

    redirect_to tipos_comidas_path
end
Modificar el archivo de ruta con las convenciones

Rails.application.routes.draw do

# Rutas Tipos Comidas
get      'tipos_comidas',             to: 'tipos_comidas#listar',     as: 'tipos_comidas'     # listar 
get      'tipos_comidas/nuevo',       to: 'tipos_comidas#crear',      as: 'nuevo_tipo_comida' # formulario de nuevo
get      'tipos_comidas/:id',         to: 'tipos_comidas#mostrar',    as: 'tipo_comida'       # vista del detalle de un tipo de comida
get      'tipos_comidas/:id/editar',  to: 'tipos_comidas#editar',     as: 'editar_tipo_comida'# formulario para editar el registro

post     'tipos_comidas',             to: 'tipos_comidas#guardar'
put      'tipos_comidas/:id',         to: 'tipos_comidas#actualizar'
patch    'tipos_comidas/:id',         to: 'tipos_comidas#actualizar'
delete   'tipos_comidas/:id',         to: 'tipos_comidas#eliminar'

end