class UserPolicy < ApplicationPolicy
  def save_to_box?
    registered?
  end
end
