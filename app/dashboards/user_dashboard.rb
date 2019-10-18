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
    assignments: Field::HasMany,
    id: Field::Number.with_options(export: false),
    first_name: Field::String,
    last_name: Field::String,
    phone_number: Field::String,
    reports_to_type: Field::String.with_options(export: false),
    reports_to_id: Field::Number.with_options(export: false),
    employee_number: Field::String,
    address: Field::String,
    state: Field::String,
    city: Field::String,
    zip_code: Field::String,
    admin: Field::Boolean,
    email: Field::String,
    encrypted_password: Field::String.with_options(export: false),
    reset_password_token: Field::String.with_options(export: false),
    reset_password_sent_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p', export: false),
    remember_created_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p', export: false),
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    last_sign_in_at: Field::DateTime.with_options(export: false),
    current_sign_in_ip: Field::String.with_options(searchable: false, export: false),
    last_sign_in_ip: Field::String.with_options(searchable: false, export: false),
    created_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    updated_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    disable_login: Field::Boolean.with_options(export: false),
    unlock_token: Field::String.with_options(export: false),
    locked_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    password: Field::Password.with_options(export: false),
    password_confirmation: Field::Password.with_options(export: false),
    assignments: Field::HasMany,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  first_name
  last_name
  department
  location
  job_title
  status
  locked_at
  assignments
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  assignments
  department
  location
  job_title
  status
  reports_to
  id
  first_name
  last_name
  phone_number
  employee_number
  address
  state
  city
  zip_code
  admin
  email
  sign_in_count
  last_sign_in_at
  last_sign_in_ip
  created_at
  updated_at
  disable_login
  locked_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  first_name
  last_name
  job_title
  reports_to
  employee_number
  department
  location
  address
  state
  city
  zip_code
  phone_number
  email
  status
  admin
  disable_login
  sign_in_count
  locked_at
  password
  password_confirmation
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.last_name}, #{user.first_name} - #{user.employee_number}"
  end
end
