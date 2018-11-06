require "administrate/base_dashboard"

class EquipmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    category: Field::BelongsTo,
    brand: Field::BelongsTo,
    model: Field::BelongsTo,
    id: Field::Number,
    category: Field::BelongsTo,
    asset_tag: Field::String,
    hostname: Field::String,
    serial_number: Field::String,
    phone_number: Field::String,
    sim_number: Field::String,
    imei: Field::String,
    device_number: Field::String,
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
    :category,
    :brand,
    :model,
    :asset_tag,
    :serial_number,
    :phone_number,
    :sim_number
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :brand,
    :model,
    :category,
    :asset_tag,
    :hostname,
    :serial_number,
    :phone_number,
    :sim_number,
    :imei,
    :device_number,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :brand,
    :model,
    :asset_tag,
    :hostname,
    :serial_number,
    :phone_number,
    :sim_number,
    :imei,
    :device_number,
  ].freeze

  # Overwrite this method to customize how equipment are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(equipment)
    "#{equipment.brand.name} #{equipment.model.name} #{equipment.asset_tag} #{equipment.phone_number}"
  end
end
