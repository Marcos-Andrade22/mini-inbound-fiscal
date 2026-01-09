class CreateEmpresas < ActiveRecord::Migration[8.1]
  def change
    create_table :empresas do |t|
      t.string :cnpj
      t.string :nome
      t.decimal :aliquota_imposto

      t.timestamps
    end
  end
end
