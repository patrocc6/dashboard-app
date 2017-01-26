class ProjectPolicy < ApplicationPolicy
  def update?
    @user.admin?
  end
end
