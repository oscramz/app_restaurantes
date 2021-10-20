class CreateTipoPuntajes < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_puntajes do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
