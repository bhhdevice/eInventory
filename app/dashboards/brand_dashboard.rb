require "administrate/base_dashboard"

class BrandDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    models: Field::HasMany,
    equipment: Field::HasMany,
    stock: Field::HasOne,
    id: Field::Number,
    name: Field::String,
    address: Field::String,
    state: Field::String,
    city: Field::String,
    zip_code: Field::String,
    phone_number: Field::String,
    website: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    email: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :models,
    :equipment,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :models,
    :equipment,
    :id,
    :name,
    :address,
    :state,
    :city,
    :zip_code,
    :phone_number,
    :website,
    :created_at,
    :updated_at,
    :email,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :models,
    :equipment,
    :name,
    :address,
    :state,
    :city,
    :zip_code,
    :phone_number,
    :website,
    :email,
  ].freeze

  # Overwrite this method to customize how brands are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(brand)
    "#{brand.name}"
  end
end
