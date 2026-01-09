class CreateNotaFiscals < ActiveRecord::Migration[8.1]
  def change
    create_table :nota_fiscals do |t|
      t.string :numero
      t.string :chave
      t.decimal :valor_total
      t.decimal :impostos
      t.string :status
      t.integer :score_conformidade
      t.references :pedido_compra, null: false, foreign_key: true
      t.references :fornecedor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
