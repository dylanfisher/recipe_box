class RecipePolicy < ApplicationPolicy
  def save_to_box?
    registered?
  end

  def edit?
    user == record.user
  end

  def create?
    user.present?
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
