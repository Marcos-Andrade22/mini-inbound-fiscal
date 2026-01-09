class Api::PedidosComprasController < ApplicationController
  before_action :set_pedido, only: [ :show, :update, :destroy ]

  def index
    @pedidos_compras = policy_scope(PedidoCompra)
    render json: @pedidos_compras
  end

  def create
    @pedido_compra = PedidoCompra.new(pedido_params)
    if @pedido_compra.save
      render json: @pedido_compra, status: :created
    else
      render json: @pedido_compra.errors, status: :unprocessable_entity
    end
  end

  private

  def set_pedido
    @pedido_compra = PedidoCompra.find(params[:id])
  end

  def pedido_params
    params.require(:pedido_compra).permit(:numero, :valor_previsto, :fornecedor_id, :empresa_id)
  end
end
