class NotaFiscalPolicy < ApplicationPolicy
  def update?
    user.role == 1  # Só financeiro aprova
  end
end
