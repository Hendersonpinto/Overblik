class CompanyLicensesController < ApplicationController
    before_action :set_company_license, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token, :only => [:create_results]
  
    def dashboard
      @license_transactions = LicenseTransaction.all
    end
  
    def index
  
    end
  
    def show
    end
  
    def new
      @company_license = CompanyLicense.new
    end
  
    def create
      @company_license = CompanyLicense.new(company_license_params)
      @company_license.user = current_user
  
      if @company_license.save
        redirect_to company_licenses_path
      else
        render new
      end
    end
  
    def edit
    end
  
    def update
      @company_license.update(company_license_params)
  
      redirect_to company_license_path(@company_license)
    end
  
    def destroy
      @company_license.destroy
  
      redirect_to company_licenses_path
    end
  
    def create_results
      puts "THESE ARE MY PARAMS #{params}"
      params[:data].each do |transaction| 
        p "The transaction is explained below"
        p transaction
        @vendor = Vendor.create!(name: transaction[:vendor_name])
  
      end
        if @vendor.save
          p "The vendor is created and saved #{@vendor}"
          p @vendor
          render json:{ redirect_url: show_results_path(@vendor), success: true }
        else
          render json:{ success: false }
        end
  
    end
  
    def show_results
      @vendor = Vendor.find(params[:vendor_id])
    end
  
    def usage
      @users = User.all
      @company_license = CompanyLicense.new
    end
  
    private
  
    def set_company_license
      @company_license = CompanyLicense.find(params[:id])
    end
  
    def company_license_params
      params.require(:company_license).permit(:license_id)
    end
  
  
  
  
    def validate_params
      params.require(:company_license).permit(:vendor_name, :expiry_date)
    end
  end