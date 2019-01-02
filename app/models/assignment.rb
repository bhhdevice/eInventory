class Assignment < ApplicationRecord
  attr_accessor :smart_charger, :cell_phone_charger, :tablet_keyboard, :tablet_mouse, :user_search, :tablet_search, :cell_search
  before_destroy :create_log
  belongs_to :user
  belongs_to :equipment
  after_create :update_stock
  after_update :update_stock
  after_destroy :update_stock

  validates :equipment, uniqueness: true
  validate :quick_add, on: :quick_create

  def to_s
    "#{equipment.brand.name} #{equipment.model.name} - Phone: #{equipment.phone_number} - Asset: #{equipment.asset_tag}"
  end

  def self.quick_add(page_obj, params)
    equipment_loop = {}
    valid_equipment = []
    user = User.where("last_name ILIKE ? OR employee_number ILIKE ? OR first_name ILIKE ? AND last_name ILIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%", "%#{params[:user_search]}%", "%#{params[:user_search]}%") unless params[:user_search] == ""
    equipment_loop[:tablet] = Equipment.unassigned.joins(:category).joins(:model).joins(:brand).where("categories.name = 'Tablet' AND equipment.asset_tag LIKE ? OR equipment.phone_number LIKE ?", "%#{params[:tablet_search]}%", "%#{params[:tablet_search]}%") unless params[:tablet_search] == ""
    equipment_loop[:cell_phone] = Equipment.unassigned.joins(:model).joins(:brand).where("equipment.phone_number LIKE ?", "%#{params[:cell_search]}%").first unless params[:cell_search] == ""
    equipment_loop[:smart_charger] = Equipment.unassigned.joins(:category).joins(:model).where("categories.name = 'Charger' AND models.name ILIKE '%iSmart 4-port USB Charger%'").first unless params[:smart_charger] == "0"
    equipment_loop[:cell_phone_charger] = Equipment.unassigned.joins(:category).joins(:model).where("categories.name = 'Charger' AND models.name ILIKE '%apple charger%'").first unless params[:cell_phone_charger] == "0"
    equipment_loop[:tablet_keyboard] = Equipment.unassigned.joins(:category).joins(:model).where("categories.name = 'Keyboard' AND models.name LIKE '%Tab E 9.6 Case w/ Keyboard%'").first unless params[:tablet_keyboard] == "0"
    equipment_loop[:tablet_mouse] = Equipment.unassigned.joins(:category).joins(:model).where("categories.name = 'Mouse' AND models.name LIKE '%Compact bluetooth mouse%'").first unless params[:tablet_mouse] == "0"
    equipment_objs = {}
    if params[:tablet_search] == "" && params[:cell_search] == "" && params[:smart_charger] == "0" && params[:cell_phone_charger] == "0" && params[:tablet_keyboard] == "0" && params[:tablet_mouse] == "0"
      page_obj.errors.add(:user, "data entered cannot be assigned")
      return false
    end
    if params[:user_search] == "" || user.nil? || user.count > 1
      page_obj.errors.add(:user, "not found")
      return false
    else
      user = user.first
    end
    if equipment_loop[:tablet].nil? || equipment_loop[:tablet].count > 1
    else
      equipment_loop[:tablet] = equipment_loop[:tablet].first
    end
    equipment_loop.each do |type, equipment|
      equipment_objs[type] = Assignment.new(user: user, equipment: equipment)
      if equipment_objs[type].valid?
        valid_equipment << equipment_objs[type]
      else
        page_obj.errors.add(type, "#{equipment_objs[type].errors.messages.flatten.join(" ")}")
      end
    end
    if page_obj.errors.present?
      return false
    else
      valid_equipment.each do |e|
        e.save
      end
      return true
    end
  end

  private

    def update_stock
      self.equipment.brand.stock.update
      self.equipment.model.stock.update
    end
end
