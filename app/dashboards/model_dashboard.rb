require "administrate/base_dashboard"

class ModelDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    brand: Field::BelongsTo.with_options( searchable: true, searchable_field: 'name' ),
    category: Field::BelongsTo.with_options( searchable: true, searchable_field: 'name' ),
    equipment: Field::HasMany,
    stock: Field::HasOne,
    id: Field::Number,
    name: Field::String.with_options( searchable: true ),
    release_date: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    processor: Field::String,
    ram: Field::String,
    storage_capacity: Field::String,
    storage_type: Field::String,
    display: Field::String,
    battery_capacity: Field::String,
    wifi: Field::Boolean,
    bluetooth: Field::Boolean,
    gps: Field::Boolean,
    cellular: Field::String,
    camera: Field::String,
    size: Field::String,
    weight: Field::String,
    created_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    updated_at: Field::DateTime.with_options(timezone: 'EST', format: '%m/%d/%Y %I:%M%p'),
    number: Field::String,
    website: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  name
  brand
  category
  equipment
  stock
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  brand
  category
  equipment
  stock
  id
  name
  release_date
  processor
  ram
  storage_capacity
  storage_type
  display
  battery_capacity
  wifi
  bluetooth
  gps
  cellular
  camera
  size
  weight
  created_at
  updated_at
  number
  website
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  brand
  category
  equipment
  name
  release_date
  processor
  ram
  storage_capacity
  storage_type
  display
  battery_capacity
  wifi
  bluetooth
  gps
  cellular
  camera
  size
  weight
  number
  website
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

  # Overwrite this method to customize how models are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(model)
    "#{model.name}"
  end
end
