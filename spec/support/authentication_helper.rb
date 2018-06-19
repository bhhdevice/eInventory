module AuthenticationHelper
  # request login helper
  def request_login_admin
    admin = create(:user, admin: true, password: 'Pa$$word')
    post user_session_path, params: {'user[email]': admin.email, 'user[password]': 'Pa$$word'}
  end

  # Controller helper to login as a certain role.
  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = build(:user)
    user.disable_login = false
    user.admin = true
    user.save
    sign_in user
  end

  def login_manager
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = build(:user)
    user.disable_login = false
    user.manager = true
    user.save
    sign_in user
  end
end
