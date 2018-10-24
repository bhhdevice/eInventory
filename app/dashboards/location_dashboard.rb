require "administrate/base_dashboard"

class LocationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    address: Field::String,
    city: Field::String,
    state: Field::String,
    zip_code: Field::String,
    phone_number: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :users,
    :address,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :id,
    :name,
    :address,
    :city,
    :state,
    :zip_code,
    :phone_number,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    :name,
    :address,
    :city,
    :state,
    :zip_code,
    :phone_number,
  ].freeze

  # Overwrite this method to customize how locations are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(location)
    "#{location.name}"
  end
end