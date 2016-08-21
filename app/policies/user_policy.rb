class UserPolicy < ApplicationPolicy
  def save_to_box?
    registered?
  end

  def edit?
    # binding.pry
    admin?
  end

  def edit_recipes?
    edit?
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
