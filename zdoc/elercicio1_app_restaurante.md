Módulo 8 - Rails
Enunciado
Existe la posibilidad de desarrollar una aplicación para las personas que les gusta mucho puntuar restaurantes y platos. Para diferenciar de otras aplicaciones en el mercado el puntaje se realizará solo a través de "emociones": 🥳 😅 😪. Los usuarios pueden votar por el restaurante y/o por el plato pero solo pueden hacerlo 1 vez. Nosotros como dueños del emprendimiento deberíamos poder registrar restaurantes nuevos con su nombre, tema (qué comida sirven) y un menú de máximo 5 platos por restaurante, esto con el fin de que los restaurantes también puedan probar platos nuevos y forzarlos a elegir sus mejores platos. Los usuarios deberían poder buscar el restaurante, votar por alguno y registrarse en la aplicación para más adelante poder ofrecerles invitaciones a restaurantes o promociones.

Modelos
Objetivo de la clase de hoy: Registrar restaurantes por consola y verlos en una lista
Crear el proyecto utilizando el comando

# rails new <nombre_aplicación> -> crea una aplicación en rails
# -d postgresql -> configura el proyecto con la gema pg
# -T -> crea un proyecto sin archivos de prueba de Minitest (vamos a utilizar Rspec)
rails new <nombre_aplicación> -d postgresql -T
Configurar el postgres

host: 127.0.0.1
port: 5433          # 5432
username: postgres
password: postgres  # es su propio password
Crear el modelo Tipos Comida

# crear un modelo llamado TipoComida con un campo
# tipo:string
rails g model TipoComida tipo:string
Ejecutando la migración

# realizar la mi
rails db:create
rails db:migrate
Abrir la consola de Rails

# abrir la consola con
rails c
Crear un registro en la base de datos con TipoComida

tipo_italiana = TipoComida.new(tipo: 'italiana')
tipo_italiana.save
Agregar un controlador y una vista que permita ver los registros en la base de datos

Agregar a la tabla de registros un botón utilizando la etiqueta <%= link_to %> para eliminar los registros de la base de datos

Crear una vista para definir un formulario utilizando un POST para crear un nuevo TipoComida

Definir un método en el controlador para capturar los datos enviados y almacenarlos en la BD

