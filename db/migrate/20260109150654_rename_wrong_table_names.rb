class RenameWrongTableNames < ActiveRecord::Migration[8.1]
  def change
    rename_table :fornecedors, :fornecedores    # Se existir
    rename_table :nota_fiscals, :notas_fiscais  # Se existir
  end
end
