class Api::NotasFiscaisController < ApplicationController
  before_action :set_nota_fiscal, only: [ :show, :update ]

  def index
    @notas_fiscais = policy_scope(NotaFiscal).where(status: "pendente")
    render json: @notas_fiscais, include: [ :fornecedor, :pedido_compra, :user ]
  end

  def create
    @nota_fiscal = NotaFiscal.new(nota_params)
    @nota_fiscal.user = current_user
    @nota_fiscal.status = "pendente"

    if @nota_fiscal.save
      render json: @nota_fiscal, status: :created
    else
      render json: @nota_fiscal.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @nota_fiscal
    if @nota_fiscal.update(update_params)
      render json: @nota_fiscal
    else
      render json: @nota_fiscal.errors, status: :unprocessable_entity
    end
  end

  private

  def set_nota_fiscal
    @nota_fiscal = NotaFiscal.find(params[:id])
  end

  def nota_params
    params.require(:nota_fiscal).permit(:numero, :chave, :valor_total, :impostos, :pedido_compra_id, :fornecedor_id)
  end

  def update_params
    params.require(:nota_fiscal).permit(:status)
  end
end
