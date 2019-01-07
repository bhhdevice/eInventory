class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

    def create_log
      current_user = User.current
      l = Log.new
      if self.respond_to? :user
        logged_user = self.user
      elsif self.class.name === "User"
        logged_user = self
      else
        logged_user = nil
      end
      if logged_user.present?
        l.past_user = "#{logged_user.full_name} #{logged_user.employee_number}"
      end

      l.past_record = format_past_record
      if current_user.present?
        l.processed_by = "#{current_user.full_name} #{current_user.employee_number}"
      end
      if l.valid?
        l.save
      else
        return nil
      end
    end

    def format_past_record
      pr_arr = []
      ApplicationRecord.descendants.each do |model|
        if model.name === self.class.name
          pr_arr << "Type - #{self.class.name}"
          pr_arr << self.to_s
          associations = model.reflect_on_all_associations.map(&:name)
          associations.delete(:user)
          associations.delete(:employee)
          associations.each do |a|
            if a.respond_to? :attribute_names
              self.send(a).attribute_names.each do |an|
                pr_arr << self.send(a).send(an).to_s
              end
            end
          end
        end
      end
      pr_arr
    end
end
