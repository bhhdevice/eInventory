class Employee < User

  scope :active, -> { joins(:status).where("statuses.name = ?", 'Active') }
  scope :not_admin, -> { where(admin: false) }

  protected

    def password_required?
      false
    end
end
