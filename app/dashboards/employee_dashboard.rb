require "administrate/base_dashboard"

class EmployeeDashboard < Administrate::BaseDashboard
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
    reports_to: Field::BelongsTo.with_options(class_name: "User"),
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
    reset_password_sent_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    remember_created_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    last_sign_in_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    updated_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    disable_login: Field::Boolean,
    unlock_token: Field::String,
    locked_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :department,
    :location,
    :job_title,
    :status,
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
    :reports_to_type,
    :reports_to_id,
    :employee_number,
    :address,
    :state,
    :city,
    :zip_code,
    :admin,
    :manager,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :created_at,
    :updated_at,
    :disable_login,
    :unlock_token,
    :locked_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :department,
    :location,
    :job_title,
    :status,
    :reports_to,
    :first_name,
    :last_name,
    :phone_number,
    :reports_to_type,
    :reports_to_id,
    :employee_number,
    :address,
    :state,
    :city,
    :zip_code,
    :admin,
    :manager,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :disable_login,
    :unlock_token,
    :locked_at,
  ].freeze

  # Overwrite this method to customize how employees are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(employee)
  #   "Employee ##{employee.id}"
  # end
end
