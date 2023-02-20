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
    user.status == "chairperson"
  end

  def create?
    user.status == "chairperson" || user.status == "user"
  end

  def new?
    create?
  end

  def print?
    user.status == "chairperson"
  end
end
