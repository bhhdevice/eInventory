class Assignment < ApplicationRecord
  attr_accessor :smart_charger, :cell_phone_charger, :tablet_keyboard, :tablet_mouse, :user_search, :tablet_search, :cell_search
  belongs_to :user
  belongs_to :equipment
  after_create :update_stock
  after_update :update_stock
  after_destroy :update_stock

  validates :equipment, uniqueness: true
  validate :quick_add, on: :quick_create


  def self.quick_add(page_obj, params)
    equipment_loop = {}
    user = User.where("last_name ILIKE ? OR employee_number LIKE ? OR first_name ILIKE ? AND last_name ILIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%", "%#{params[:user_search]}%", "%#{params[:user_search]}%").first unless params[:user_search] == ""
    equipment_loop[:tablet] = Equipment.joins(:category).joins(:model).joins(:brand).where("categories.name = 'Tablet' AND equipment.asset_tag LIKE ? OR equipment.phone_number LIKE ?", "%#{params[:tablet_search]}%", "%#{params[:tablet_search]}%").first unless params[:tablet_search] == ""
    equipment_loop[:cell_phone] = Equipment.joins(:model).joins(:brand).where("equipment.phone_number LIKE ?", "%#{params[:cell_search]}%").first unless params[:cell_search] == ""
    equipment_loop[:smart_charger] = Equipment.joins(:category).joins(:model).where("categories.name = 'Charger' AND models.name ILIKE '%iSmart 4-port USB Charger%'").first unless params[:smart_charger] == "0"
    equipment_loop[:cell_phone_charger] = Equipment.joins(:category).joins(:model).where("categories.name = 'Charger' AND models.name ILIKE '%apple charger%'").first unless params[:cell_phone_charger] == "0"
    equipment_loop[:tablet_keyboard] = Equipment.joins(:category).joins(:model).where("categories.name = 'Keyboard' AND models.name LIKE '%Tab E 9.6 Case w/ Keyboard%'").first unless params[:tablet_keyboard] == "0"
    equipment_loop[:tablet_mouse] = Equipment.joins(:category).joins(:model).where("categories.name = 'Mouse' AND models.name LIKE '%Compact bluetooth mouse%'").first unless params[:tablet_mouse] == "0"
    equipment_objs = {}
    if params[:user_search] == ""
      page_obj.errors.add(:user, "cannot be blank")
    end
    equipment_loop.each do |type, equipment|
      equipment_objs[type] = Assignment.new(user: user, equipment: equipment)
      if equipment_objs[type].save
      else
        page_obj.errors.add(type, "#{equipment_objs[type].errors[:equipment]}")
      end
    end
    if page_obj.errors.present?
      return false
    else
      return true
    end
  end

  private

    def update_stock
      self.equipment.brand.stock.update
      self.equipment.model.stock.update
    end
end
