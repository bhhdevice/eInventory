require "administrate/base_dashboard"

class StatusDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    employees: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    updated_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :users,
    :employees,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :employees,
    :id,
    :name,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    :employees,
    :name,
  ].freeze

  # Overwrite this method to customize how statuses are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(status)
    "#{status.name}"
  end
end
