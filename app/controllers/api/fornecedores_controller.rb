class Api::FornecedoresController < ApplicationController
  before_action :set_fornecedor, only: [ :show, :update, :destroy ]

  def index
    @fornecedores = policy_scope(Fornecedor)
    render json: @fornecedores
  end

  def create
    @fornecedor = Fornecedor.new(fornecedor_params)
    if @fornecedor.save
      render json: @fornecedor, status: :created
    else
      render json: @fornecedor.errors, status: :unprocessable_entity
    end
  end

  private

  def set_fornecedor
    @fornecedor = Fornecedor.find(params[:id])
  end

  def fornecedor_params
    params.require(:fornecedor).permit(:nome, :cnpj, :empresa_id)
  end
end
