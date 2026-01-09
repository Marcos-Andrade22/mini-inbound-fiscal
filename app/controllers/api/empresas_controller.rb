class Api::EmpresasController < ApplicationController
  before_action :set_empresa, only: [ :show, :update, :destroy ]

  def index
    @empresas = policy_scope(Empresa)
    render json: @empresas
  end

  def show
    render json: @empresa
  end

  def create
    @empresa = Empresa.new(empresa_params)
    if @empresa.save
      render json: @empresa, status: :created
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  def update
    if @empresa.update(empresa_params)
      render json: @empresa
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @empresa.destroy
    head :no_content
  end

  private

  def set_empresa
    @empresa = Empresa.find(params[:id])
  end

  def empresa_params
    params.require(:empresa).permit(:cnpj, :nome, :aliquota_imposto)
  end
end
