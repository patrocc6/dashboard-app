class ProjectPolicy < ApplicationPolicy
  def update?
    @user.admin?
  end

  def create?
    @user.admin?
  end
end
