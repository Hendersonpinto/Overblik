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
  end

  def add_employees_create
  end

  def associate_users
    @progress = 4
  end

  def associate_users_create
  end
end
