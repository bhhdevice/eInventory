class EmployeesController < InheritedResources::Base

  private

    def employee_params
      params.require(:employee).permit()
    end
end

