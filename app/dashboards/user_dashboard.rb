require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    department: Field::BelongsTo,
    location: Field::BelongsTo,
    job_title: Field::BelongsTo,
    status: Field::BelongsTo,
    reports_to: Field::BelongsTo.with_options(class_name: "User", scope: -> { User.managers }),
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    phone_number: Field::String,
    reports_to_type: Field::String,
    reports_to_id: Field::Number,
    employee_number: Field::String,
    address: Field::String,
    state: Field::String,
    city: Field::String,
    zip_code: Field::String,
    admin: Field::Boolean,
    manager: Field::Boolean,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    disable_login: Field::Boolean,
    unlock_token: Field::String,
    locked_at: Field::DateTime,
    password: Field::Password,
    password_confirmation: Field::Password
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :first_name,
    :last_name,
    :department,
    :location,
    :job_title,
    :status,
    :disable_login
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :department,
    :location,
    :job_title,
    :status,
    :reports_to,
    :id,
    :first_name,
    :last_name,
    :phone_number,
    :employee_number,
    :address,
    :state,
    :city,
    :zip_code,
    :admin,
    :manager,
    :email,
    :sign_in_count,
    :last_sign_in_at,
    :last_sign_in_ip,
    :created_at,
    :updated_at,
    :disable_login,
    :locked_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :first_name,
    :last_name,
    :job_title,
    :reports_to,
    :employee_number,
    :department,
    :location,
    :address,
    :state,
    :city,
    :zip_code,
    :phone_number,
    :email,
    :status,
    :admin,
    :manager,
    :disable_login,
    :sign_in_count,
    :locked_at,
    :password,
    :password_confirmation
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.full_name} - #{user.job_title.name}"
  end
end
