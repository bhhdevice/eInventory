module AuthenticationHelper
  # Feature spec helper to login as a certain role.
  def sign_in_as(role_name)
    somebody = create(:user)
    if role_name
      r = create(:role, name: role_name)
      somebody.roles << r
    end
    visit new_user_session_path
    fill_in 'user_email', with: somebody.email
    fill_in 'user_password', with: somebody.password
    click_on 'Sign in'
  end

  # Controller helper to login as a certain role.
  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    user.admin = true
    sign_in user
  end

  def login_manager
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    user.manager = true
    user.save
    sign_in user
  end

  # Request helper to login
  def request_login(user)
    post user_session_path, params: { email: user.email, password: user.password }
  end
end
