module AssignmentsHelper
  def quick_equipment_picker(params)
    equip_hash = {errors:[]}
    tablet_param_arr = quick_params[:equipment_id].split(" ")
    user_param_arr = quick_params[:user_id].split(" ")
    if params[:user_id].present?
      equip_hash[:user] = User.where("last_name ILIKE ? OR employee_number LIKE ? OR first_name ILIKE ? AND last_name ILIKE ?", "%#{user_param_arr[0]}%", "%#{user_param_arr[1] || user_param_arr[0]}%", "%#{user_param_arr[0]}%", "%#{user_param_arr[1]}%")
      if equip_hash[:user].count > 1
        equip_hash[:errors] << "User data is not unique"
      else
        equip_hash[:user] = equip_hash[:user].first
      end
    else
      equip_hash[:user] = nil
    end
    if params[:equipment_id].present?
      equip_hash[:tablet] = Equipment.joins(:model).joins(:brand).where("equipment.asset_tag LIKE ? OR equipment.phone_number LIKE ? OR models.name ILIKE ? OR brands.name ILIKE ?", "%#{tablet_param_arr[0]}%", "%#{tablet_param_arr[1] || tablet_param_arr[0]}%", "%#{tablet_param_arr[2] || tablet_param_arr[0]}%", "%#{tablet_param_arr[3] || tablet_param_arr[0]}%")
      if equip_hash[:tablet].count > 1
        equip_hash[:errors] << "Tablet data is not unique"
      else
        equip_hash[:tablet] = equip_hash[:tablet].first
      end
    else
      equip_hash[:tablet] = nil
    end
    if params[:cell_phone].present?
      equip_hash[:cell_phone] = Equipment.joins(:category).joins(:model).joins(:brand).where("categories.name = 'Phone' AND equipment.phone_number LIKE ?", "%#{params[:cell_phone]}%")
      if equip_hash[:cell_phone].count > 1
        equip_hash[:errors] << "Cell phone data is not unique"
      else
        equip_hash[:cell_phone] = equip_hash[:cell_phone].first
      end
    else
      equip_hash[:cell_phone] = nil
    end
    if params[:smart_charger] == 0
      equip_hash[:smart_charger] = Equipment.joins(:category).joins(:model).where("categories.name = 'Charger' AND models.name ILIKE '%iSmart 4-port USB Charger%'").unassigned.first
    end
    if params[:cell_phone_charger] == 0
      equip_hash[:cell_phone_charger] = Equipment.joins(:category).joins(:model).where("categories.name = 'Charger' AND models.name ILIKE '%apple charger%'").unassigned.first
    end
    if params[:tablet_keyboard] == 0
      equip_hash[:tablet_keyboard] = Equipment.joins(:category).joins(:model).where("categories.name = 'Keyboard' AND models.name LIKE '%Tab E 9.6 Case w/ Keyboard%'").unassigned.first
    end
    if params[:tablet_mouse] == 0
      equip_hash[:tablet_mouse] = Equipment.joins(:category).joins(:model).where("categories.name = 'Mouse' AND models.name LIKE '%Compact bluetooth mouse%'").unassigned.first
    end

    equip_hash
  end
end
