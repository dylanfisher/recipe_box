class RecipePolicy < ApplicationPolicy
  def save_to_box?
    registered?
  end

  def edit?
    admin? || user == record.user
  end

  def update?
    edit?
  end

  def confirm?
    edit?
  end

  def confirm_update?
    edit?
  end
end
