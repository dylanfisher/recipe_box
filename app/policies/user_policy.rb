class UserPolicy < ApplicationPolicy
  def save_to_box?
    registered?
  end

  def edit?
    admin? or user == record
  end

  def update?
    admin? or edit?
  end

  def confirm?
    admin? or edit?
  end
end
