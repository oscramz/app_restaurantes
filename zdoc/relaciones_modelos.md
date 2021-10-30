Enunciado
Terminar de ingresar o crear los modelos al proyecto de rails
Generando el modelo de Restaurante que se relaciona con TipoComida

rails g model Restaurante nombre:string tipo_comida:references
Revisar el archivo de inflections.rb con las referencias a singular y plural

# inflections.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
    inflect.irregular 'tipo_comida', 'tipos_comidas'
end
Ejecutar la migración

rails db:migrate # migrar la tabla de restaurantes
Relacionar los modelos Restaurante.rb y TipoComida

Ejecutar la creación del modelo Plato

Ejecutar migración

Crear el modelo de Invitación

rails g model Invitacion mensaje:string fecha:date usuario:references restaurante:references