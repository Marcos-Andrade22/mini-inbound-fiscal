class NotaFiscal < ApplicationRecord
  belongs_to :pedido_compra
  belongs_to :fornecedor
end
