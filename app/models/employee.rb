class Employee < User

  protected

  def password_required?
    false
  end
end
