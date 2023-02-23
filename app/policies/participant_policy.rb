class ParticipantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    user.status == "user"
  end
  # added new records for QR scanning
  def qr_codes_scanner?
    true
  end
end
