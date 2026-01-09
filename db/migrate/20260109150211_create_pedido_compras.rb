class CreatePedidoCompras < ActiveRecord::Migration[8.1]
  def change
    create_table :pedido_compras do |t|
      t.string :numero
      t.decimal :valor_previsto
      t.references :fornecedor, null: false, foreign_key: true
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
