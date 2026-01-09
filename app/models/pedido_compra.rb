class PedidoCompra < ApplicationRecord
  belongs_to :fornecedor
  belongs_to :empresa
end
