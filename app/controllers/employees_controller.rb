class EmployeesController < ApplicationController
  # skip_before_filter :verify_authenticity_token

  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.new employee_params

    if @employee.save
      render :show
    else
      render_errors @employee
    end
  end

  def by_speciality
    @specialities = Employee.by_speciality
  end

  def show
  end
  def destroy
    @employee = Employee.find(params[:id])

    if @employee.destroy!
        head :no_content
    else
      render_errors @employee
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :speciality)
  end
end
