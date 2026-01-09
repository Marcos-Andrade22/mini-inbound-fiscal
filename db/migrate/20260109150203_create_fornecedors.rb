class CreateFornecedors < ActiveRecord::Migration[8.1]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :cnpj
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
