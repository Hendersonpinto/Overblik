class OnboardingController < ApplicationController
  def index
  end

  def welcome
    @progress = 1
  end

  def select_apps
    @progress = 1
  end

  def select_apps_create
  end

  def define_plans
    @progress = 2
  end

  def define_plans_create
  end

  def add_employees
    @progress = 3
    @employee = Employee.new
    @departments = Department.all
  end
  
  def add_employees_create
    @employee = Employee.new(validate_params)
    @employee.company = current_user.company
    if @employee.save
      redirect_to onboarding_associate_users_path
    else
      @departments = Department.all
      @progress = 3
      render :add_employees
    end

  end

  def associate_users
    @progress = 4
  end

  def associate_users_create
  end


  def validate_params
    params.require(:employee).permit(:first_name, :last_name, :email, :mobile, :role, :department_id)
  end
end
