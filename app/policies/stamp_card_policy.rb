class StampCardPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    user.status == "user"
  end

  def map_view?
    user.status == "user"
  end

  def create?
    user.status == "user"
  end

  def new?
    create?
  end
end
