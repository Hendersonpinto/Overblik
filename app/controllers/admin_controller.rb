class AdminController < ApplicationController
  before_action :authenticate_super_admin!
  before_action :set_category, only: [:category_show, :category_edit, :category_update, :category_destroy]
  before_action :set_sub_category, only: [:sub_category_show, :sub_category_edit, :sub_category_update, :sub_category_destroy]
  before_action :set_company, only: [:company_show, :company_edit, :company_update, :company_destroy]
  before_action :set_license, only: [:license_show, :license_edit, :license_update, :license_destroy]
  before_action :set_license_transaction, only: [:license_transaction_show, :license_transaction_edit, :license_transaction_update, :license_transaction_destroy]
  before_action :set_license_usage, only: [:license_usage_show, :license_usage_edit, :license_usage_update, :license_usage_destroy]
  before_action :set_company_license, only: [:company_license_show, :company_license_edit, :company_license_update, :company_license_destroy]
  before_action :set_company_license_account, only: [:company_license_account_show, :company_license_account_edit, :company_license_account_update, :company_license_account_destroy]
  before_action :set_transaction_user, only: [:transaction_user_show, :transaction_user_edit, :transaction_user_update, :transaction_user_destroy]
  before_action :set_department, only: [:department_show, :department_edit, :department_update, :department_destroy]
  before_action :set_plan, only: [:plan_show, :plan_edit, :plan_update, :plan_destroy]
  before_action :set_user, only: [:user_show, :user_edit, :user_update, :user_destroy]
  before_action :set_vendor, only: [:vendor_show, :vendor_edit, :vendor_update, :vendor_destroy]
  before_action :set_vendor_contact, only: [:vendor_contact_show, :vendor_contact_edit, :vendor_contact_update, :vendor_contact_destroy]


  def dashboard
    # Here we will want to simply have links to the index page of each table
    # and maybe some generic data about each page (count of total records in that table)
  end

  # Categories CRUD

  def categories_index
    @categories = Category.all
  end

  def category_show
  end

  def category_new
    @category = Category.new
  end

  def category_create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: "Category successfully created"
    else
      render :category_new
    end
  end

  def category_edit
  end

  def category_update
    @category.update(category_params)

    if @category.update(category_params)
      redirect_to admin_category_path(@category)
    else
      render :category_edit
    end
  end

  def category_destroy
    @category.destroy

    redirect_to admin_categories_path, notice: "category successfully deleted."
  end

  # Sub Categories CRUD

  def sub_categories_index
    @sub_categories = SubCategory.all
  end

  def sub_category_show
  end

  def sub_category_new
    @sub_category = SubCategory.new
  end

  def sub_category_create
    @sub_category = SubCategory.new(sub_category_params)

    if @sub_category.save
      redirect_to admin_sub_categories_path, notice: "sub_category successfully created"
    else
      render :sub_category_new
    end
  end

  def sub_category_edit
  end

  def sub_category_update
    @sub_category.update(sub_category_params)

    if @sub_category.update(sub_category_params)
      redirect_to admin_sub_category_path(@sub_category)
    else
      render :sub_category_edit
    end
  end

  def sub_category_destroy
    @sub_category.destroy

    redirect_to admin_sub_categories_path, notice: "sub_category successfully deleted."
  end

  # Companies CRUD

  def companies_index
    @companies = Company.all
  end

  def company_show
  end

  def company_new
    @company = Company.new
  end

  def company_create
    @company = Company.new(company_params)

    if @company.save
      redirect_to admin_companies_path, notice: "Company successfully created"
    else
      render :company_new
    end
  end

  def company_edit
  end

  def company_update
    @company.update(company_params)

    if @company.update(company_params)
      redirect_to admin_company_path(@company)
    else
      render :company_edit
    end
  end

  def company_destroy
    @company.destroy

    redirect_to admin_companies_path, notice: "company successfully deleted."
  end

  # Company Licenses CRUD

  def company_licenses_index
    @company_licenses = CompanyLicense.all
  end

  def company_license_show
  end

  def company_license_new
    @company_license = CompanyLicense.new
  end

  def company_license_create
    @company_license = CompanyLicense.new(params[:id])

    if @company_license.save
      redirect_to admin_company_licenses_path
    else
      render :company_license_new
    end
  end

  def company_license_edit
  end

  def company_license_update
    @company_license.update(company_license_params)

    if @company_license.update(company_license_params)
      redirect_to admin_company_license_path(@company_license)
    else
      render :company_license_edit
    end
  end

  def company_license_destroy
    @license.destroy

    redirect_to admin_licenses_path, notice: "license successfully deleted."
  end

  # Company License Accounts CRUD

  def company_license_accounts_index
    @company_license_accounts = CompanyLicenseAccount.all
  end

  def company_license_account_show
  end

  def company_license_account_new
    @company_license_account = CompanyLicenseAccount.new
  end

  def company_license_account_create
    @company_license_account = CompanyLicenseAccount.new(company_license_account_params)

    if @company_license_account.save
      redirect_to admin_company_license_accounts_path, notice: "company_license_account successfully created"
    else
      render :company_license_account_new
    end
  end

  def company_license_account_edit
  end

  def company_license_account_update
    @company_license_account.update(company_license_account_params)

    if @company_license_account.update(company_license_account_params)
      redirect_to admin_company_license_account_path(@company_license_account)
    else
      render :company_license_account_edit
    end
  end

  def company_license_account_destroy
    @company_license_account.destroy

    redirect_to admin_company_license_accounts_path, notice: "company_license_account successfully deleted."
  end

  # Departments CRUD

  def departments_index
    @departments = Department.all
  end

  def department_show
  end

  def department_new
    @department = Department.new
  end

  def department_create
    @department = Department.new(department_params)

    if @department.save
      redirect_to admin_departments_path, notice: "department successfully created"
    else
      render :department_new
    end
  end

  def department_edit
  end

  def department_update
    @department.update(department_params)

    if @department.update(department_params)
      redirect_to admin_department_path(@department)
    else
      render :department_edit
    end
  end

  def department_destroy
    @department.destroy

    redirect_to admin_departments_path, notice: "department successfully deleted."
  end

  # License Transactions CRUD

  def license_transactions_index
    @license_transactions = LicenseTransaction.all
  end

  def license_transaction_show
  end

  def license_transaction_new
    @license_transaction = LicenseTransaction.new
  end

  def license_transaction_create
    @license_transaction = LicenseTransaction.new(license_transaction_params)

    if @license_transaction.save
      redirect_to admin_license_transactions_path, notice: "license_transaction successfully created"
    else
      render :license_transaction_new
    end
  end

  def license_transaction_edit
  end

  def license_transaction_update
    @license_transaction.update(license_transaction_params)

    if @license_transaction.update(license_transaction_params)
      redirect_to admin_license_transaction_path(@license_transaction)
    else
      render :license_transaction_edit
    end
  end

  def license_transaction_destroy
    @license_transaction.destroy

    redirect_to admin_license_transactions_path, notice: "license_transaction successfully deleted."
  end

  # License Usages CRUD

  def license_usages_index
    @license_usages = LicenseUsage.all
  end

  def license_usage_show
  end

  def license_usage_new
    @license_usage = LicenseUsage.new
  end

  def license_usage_create
    @license_usage = LicenseUsage.new(license_usage_params)

    if @license_usage.save
      redirect_to admin_license_usages_path, notice: "license_usage successfully created"
    else
      render :license_usage_new
    end
  end

  def license_usage_edit
  end

  def license_usage_update
    @license_usage.update(license_usage_params)

    if @license_usage.update(license_usage_params)
      redirect_to admin_license_usage_path(@license_usage)
    else
      render :license_usage_edit
    end
  end

  def license_usage_destroy
    @license_usage.destroy

    redirect_to admin_license_usages_path, notice: "license_usage successfully deleted."
  end

  # Licenses CRUD

  def licenses_index
    @licenses = License.all
  end

  def license_show
  end

  def license_new
    @license = License.new
  end

  def license_create
    @license = License.new(license_params)

    if @license.save
      redirect_to admin_licenses_path, notice: "license successfully created"
    else
      render :license_new
    end
  end

  def license_edit
  end

  def license_update
    @license.update(license_params)

    if @license.update(license_params)
      redirect_to admin_license_path(@license)
    else
      render :license_edit
    end
  end

  def license_destroy
    @license.destroy

    redirect_to admin_licenses_path, notice: "license successfully deleted."
  end

  # Plans CRUD

  def plans_index
    @plans = Plan.all
  end

  def plan_show
  end

  def plan_new
    @plan = Plan.new
  end

  def plan_create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to admin_plans_path, notice: "plan successfully created"
    else
      render :plan_new
    end
  end

  def plan_edit
  end

  def plan_update
    @plan.update(plan_params)

    if @plan.update(plan_params)
      redirect_to admin_plan_path(@plan)
    else
      render :plan_edit
    end
  end

  def plan_destroy
    @plan.destroy

    redirect_to admin_plans_path, notice: "plan successfully deleted."
  end

  # Transaction Users CRUD

  def transaction_users_index
    @transaction_users = TransactionUser.all
  end

  def transaction_user_show
  end

  def transaction_user_new
    @transaction_user = TransactionUser.new
  end

  def transaction_user_create
    @transaction_user = TransactionUser.new(transaction_user_params)

    if @transaction_user.save
      redirect_to admin_transaction_users_path, notice: "transaction_user successfully created"
    else
      render :transaction_user_new
    end
  end

  def transaction_user_edit
  end

  def transaction_user_update
    @transaction_user.update(transaction_user_params)

    if @transaction_user.update(transaction_user_params)
      redirect_to admin_transaction_user_path(@transaction_user)
    else
      render :transaction_user_edit
    end
  end

  def transaction_user_destroy
    @transaction_user.destroy

    redirect_to admin_transaction_users_path, notice: "transaction_user successfully deleted."
  end

  # Users CRUD

  def users_index
    @users = User.all
  end

  def user_show
  end

  def user_new
    @user = User.new
  end

  def user_create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "user successfully created"
    else
      render :user_new
    end
  end

  def user_edit
  end

  def user_update
    @user.update(user_params)

    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :user_edit
    end
  end

  def user_destroy
    @user.destroy

    redirect_to admin_users_path, notice: "user successfully deleted."
  end

  # Vendors CRUD

  def vendors_index
    @vendors = Vendor.all
  end

  def vendor_show
  end

  def vendor_new
    @vendor = Vendor.new
  end

  def vendor_create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      redirect_to admin_vendors_path, notice: "Vendor successfully created"
    else
      render :vendor_new
    end
  end

  def vendor_edit
  end

  def vendor_update
    @vendor.update(vendor_params)

    if @vendor.update(vendor_params)
      redirect_to admin_vendor_path(@vendor)
    else
      render :vendor_edit
    end
  end

  def vendor_destroy
    @vendor.destroy

    redirect_to admin_vendors_path, notice: "Vendor successfully deleted."
  end


  # Vendor Contacts CRUD

  def vendor_contacts_index
    @vendor_contacts = VendorContact.all
  end

  def vendor_contact_show
  end

  def vendor_contact_new
    @vendor_contact = VendorContact.new
  end

  def vendor_contact_create
    @vendor_contact = VendorContact.new(vendor_contact_params)

    if @vendor_contact.save
      redirect_to admin_vendor_contacts_path, notice: "vendor_contact successfully created"
    else
      render :vendor_contact_new
    end
  end

  def vendor_contact_edit
  end

  def vendor_contact_update
    @vendor_contact.update(vendor_contact_params)

    if @vendor_contact.update(vendor_contact_params)
      redirect_to admin_vendor_contact_path(@vendor_contact)
    else
      render :vendor_contact_edit
    end
  end

  def vendor_contact_destroy
    @vendor_contact.destroy

    redirect_to admin_vendor_contacts_path, notice: "vendor_contact successfully deleted."
  end

  private

  # Set the "before_action" for every resource
  # so we don't repeat code through :show, :edit, :update and :destroy

  def set_category
    @category = Category.find(params[:id])
  end

  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def set_company_license
    @company_license = CompanyLicense.find(params[:id])
  end

  def set_company_license_account
    @company_license_account = CompanyLicenseAccount.find(params[:id])
  end

  def set_department
    @department = Department.find(params[:id])
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def set_license_transaction
    @license_transaction = LicenseTransaction.find(params[:id])
  end

  def set_transaction_user
    @transaction_user = TransactionUser.find(params[:id])
  end

  def set_license_usage
    @license_usage = LicenseUsage.find(params[:id])
  end

  def set_license
    @license = License.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end

  def set_vendor_contact
    @vendor_contact = VendorContact.find(params[:id])
  end

  #####

  # Set the strong params for the form values to go through

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def sub_category_params
    params.require(:sub_category).permit(:name, :icon, :company_id)
  end

  def company_params
    params.require(:company)
    .permit(
      :name,
      :website,
      :address,
      :city,
      :postal_zip,
      :country
      )
  end

  def company_license_params
    params.require(:company_license)
    .permit(
      :license_id,
      :company_id,
      :active_users,
      :user_id
      )
  end

  def company_license_account_params
    params.require(:company_license_account)
    .permit(
      :company_license_id,
      :user_id,
      :active,
      :access_permission
      )
  end

  def department_params
    params.require(:department).permit(:name)
  end

  def plan_params
    params.require(:plan)
    .permit(
      :vendor_id,
      :product_line,
      :name,
      :price,
      :users_capacity,
      :description,
      :billing_cycle,
      :currency,
      :cancellation
      )
  end

  def license_transaction_params
    params.require(:license_transaction)
    .permit(
      :company_license_id,
      :owner_id,
      :total_purchase_price,
      :purchase_date,
      :expiry_date,
      )
  end

  def transaction_user_params
    params.require(:transaction_user)
    .permit(
      :user_id,
      :license_transaction_id
      )
  end

  def license_usage_params
    params.require(:license_usage).permit(:company_license_id, :user_id)
  end

  def license_params
    params.require(:license)
    .permit(
      :name,
      :category_id,
      :vendor_id,
      :license_type,
      :logo_url,
      :avg_license_cost
      )
  end

  def user_params
    params.require(:user)
    .permit(
      :email,
      :password,
      :company_id,
      :department_id,
      :first_name,
      :last_name,
      :role,
      )
  end

  def vendor_params
    params.require(:vendor)
    .permit(
      :name,
      :website,
      :address,
      :city,
      :postal_zip,
      :country
      )
  end

  def vendor_contact_params
    params.require(:vendor_contact)
    .permit(
      :vendor_id,
      :first_name,
      :last_name,
      :email,
      :mobile,
      :role,
      :notes
      )
  end

end
