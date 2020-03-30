class FlatfilesController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:create_department, :create_company, :create_user, :create_vendor, :create_vendor_contact, :create_employee]


    def create_company
        puts "THESE ARE MY PARAMS #{params}"
        @companies = []
        @unsuccessful = []
        @successful = []

        params[:data].each do |company| 
            @company = Company.new(
                name: company[:name],
                address: company[:address],
                country: company[:country],
                city: company[:city],
                website: company[:website],
                postal_zip: company[:postal_zip])
                @companies << @company 
            if @company.save
                @successful << @company
            else
                # @unsuccessful << "#{@company.errors.details[:name][0][:error]}   -     #{@company.errors.details[:name][0][:value]}"
                @unsuccessful << {name: @company.name,
                errors: @company.errors.details.map do |k,v|
                    {k=>v[0][:error]}
                    {k=>v.map do |error|
                        "#{error[:value]} is #{error[:error]}"
                        end
                    }
                end
                }
            end
        end
        p "The companies uploaded were"
        @companies.each do |company|
            p company.name
        end
        if @successful.size > 0
        p "The following companies were successfully created"
        @successful.each do |company|
            p "#{company ? company.name : "None"}"
        end
    end
        p "Errors while uploading"
        @unsuccessful.each do |error|
           p  error
        end
        

            render json:{ redirect_url: show_companies_results_path, success: true }
    end

    def create_department
        puts "THESE ARE MY PARAMS #{params}"
        @departments = []
        params[:data].each do |department| 
        @department = Department.create(name: department[:name])
        @departments << @department
        end
        # if @department.save
            # p "The departments are created and saved #{@departments}"
            # p @departments
            render json:{ redirect_url: show_departments_results_path, success: true }
        # else
            # render json:{ success: false }
        # end
    end

    def create_user
        puts "THESE ARE MY PARAMS #{params}"
        @users = []
        params[:data].each do |user| 
        @user = User.create!(first_name: user[:first_name], last_name: user[:last_name], department: Department.find_by(name: user[:department_name]) || Department.create(name: user[:department_name]), company: Company.find_by(name: user[:company_name]) || Company.create(name: user[:company_name]), role: user[:role], password: '123456', email: user[:email])
        @users << @user
        end
        # if @user.save
            # p "The users are created and saved #{@users}"
            # p @users
            render json:{ redirect_url: show_users_results_path, success: true }
        # else
            # render json:{ success: false }
        # end
    end

    def create_vendor
        puts "THESE ARE MY PARAMS #{params}"
        @vendors = []
        params[:data].each do |vendor| 
            @vendor = Vendor.create!(
                name:vendor[:name],
                address:vendor[:address],
                country:vendor[:country],
                city:vendor[:city],
                website:vendor[:website],
                postal_zip:vendor[:postal_zip])
            @vendors << @vendor
        end
        # if @vendor.save
            # p "The vendors are created and saved"
            # p @vendors
            render json:{ redirect_url: show_vendors_results_path, success: true }
        # else
            # render json:{ success: false }
        # end
    end

    def create_vendor_contact
        puts "THESE ARE MY PARAMS #{params}"
        @contacts = []
        params[:data].each do |contact| 
        @contact = VendorContact.create!(first_name: contact[:first_name], last_name: contact[:last_name], vendor: Vendor.find_by(name: contact[:vendor_name]), email: contact[:email], mobile: contact[:mobile], role: contact[:role])
        @contacts << @contact
        end
        # if @contact.save
            # p "The contacts are created and saved #{@contacts}"
            # p @contacts
            render json:{ redirect_url: show_contacts_results_path, success: true }
        # else
            # render json:{ success: false }
        # end
    end

    def create_employee
        puts "THESE ARE MY PARAMS #{params}"
        @employees = []
        params[:data].each do |employee| 
        @employee = Employee.create!(first_name: employee[:first_name], last_name: employee[:last_name], department: Department.find_by(name: employee[:department_name]) || Department.create(name: employee[:department_name]), company: Company.find_by(name: employee[:company_name]) || Company.create(name: employee[:company_name]), email: employee[:email], mobile: employee[:mobile], role: employee[:role])
        @employees << @employee
        end
            render json:{ redirect_url: show_employees_results_path, success: true }
    end

    def show_companies_results
        @companies = Company.all
    end
    def show_departments_results
        @departments = Department.all
    end
    def show_users_results
        @users = User.all
    end
    def show_vendors_results
        @vendors = Vendor.all
    end
    def show_contacts_results
        @contacts = VendorContact.all
    end
    def show_employees_results
        @employees = Employee.all
    end

end
