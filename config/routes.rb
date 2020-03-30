Rails.application.routes.draw do
  get 'errors/show'
  devise_for :users
  root to: 'pages#index'

  resources :company_licenses
  get '/dashboard', to: 'company_licenses#dashboard'
  get '/integrations', to: 'integrations#index'
  get '/usage', to: 'company_licenses#usage'
  post '/create_results', to: 'company_licenses#create_results'
  get '/show_results/:vendor_id', to: 'company_licenses#show_results', as: 'show_results'
  # get '/show_results', to: 'company_licenses#show_results', as: 'show_results', :defaults => { :format => 'json' }
  
  resources :license_usages, only: [:create]
  # post 'usage', to: 'license_usages#create'
  get 'usage/new/:user_id', to: 'license_usages#new', as: 'new_survey'
  get 'usage/survey/:user_id', to: 'license_usages#survey_user', as: 'survey_user'
  get 'usage/survey_all', to: 'license_usages#survey_all', as: 'survey_all'
  get 'usage/survey_missing', to: 'license_usages#survey_missing', as: 'survey_missing'


  # CSV uploader routes
  get '/show_vendors_results', to: 'flatfiles#show_vendors_results'
  get '/show_companies_results', to: 'flatfiles#show_companies_results'
  get '/show_departments_results', to: 'flatfiles#show_departments_results'
  get '/show_users_results', to: 'flatfiles#show_users_results'
  get '/show_contacts_results', to: 'flatfiles#show_contacts_results'
  get '/show_employees_results', to: 'flatfiles#show_employees_results'
  post '/create_department', to: 'flatfiles#create_department'
  post '/create_company', to: 'flatfiles#create_company'
  post '/create_vendor', to: 'flatfiles#create_vendor'
  post '/create_vendor_contact', to: 'flatfiles#create_vendor_contact'
  post '/create_user', to: 'flatfiles#create_user'
  post '/create_employee', to: 'flatfiles#create_employee'


  # Admin routes
  get 'admin/dashboard', to: 'admin#dashboard'

  # categories
  get 'admin/categories', to: 'admin#categories_index'
  get 'admin/categories/new', to: 'admin#category_new'
  post 'admin/categories', to: 'admin#category_create'
  get 'admin/categories/:id', to: 'admin#category_show', as: 'admin_category'
  get 'admin/categories/:id/edit', to: 'admin#category_edit', as: 'admin_category_edit'
  patch 'admin/categories/:id', to: 'admin#category_update'
  delete 'admin/categories/:id', to: 'admin#category_destroy'

  # sub categories
  get 'admin/sub-categories', to: 'admin#sub_categories_index'
  get 'admin/sub-categories/new', to: 'admin#sub_category_new'
  post 'admin/sub-categories', to: 'admin#sub_category_create'
  get 'admin/sub-categories/:id', to: 'admin#sub_category_show', as: 'admin_sub_categorie'
  get 'admin/sub-categories/:id/edit', to: 'admin#sub_category_edit', as: 'admin_sub_category_edit'
  patch 'admin/sub-categories/:id', to: 'admin#sub_category_update'
  delete 'admin/sub-categories/:id', to: 'admin#sub_category_destroy'

  # companies
  get 'admin/companies', to: 'admin#companies_index'
  get 'admin/companies/new', to: 'admin#company_new'
  post 'admin/companies', to: 'admin#company_create'
  get 'admin/companies/:id', to: 'admin#company_show', as: 'admin_company'
  get 'admin/companies/:id/edit', to: 'admin#company_edit', as: 'admin_company_edit'
  patch 'admin/companies/:id', to: 'admin#company_update'
  delete 'admin/companies/:id', to: 'admin#company_destroy'

  # company licenses
  get 'admin/company-licenses', to: 'admin#company_licenses_index'
  get 'admin/company-licenses/new', to: 'admin#company_license_new'
  post 'admin/company-licenses', to: 'admin#company_license_create'
  get 'admin/company-licenses/:id', to: 'admin#company_license_show', as: 'admin_company_license'
  get 'admin/company-licenses/:id/edit', to: 'admin#company_license_edit', as: 'admin_company_license_edit'
  patch 'admin/company-licenses/:id', to: 'admin#company_license_update'
  delete 'admin/company-licenses/:id', to: 'admin#company_license_destroy'

  # company license accounts
  get 'admin/company-license-accounts', to: 'admin#company_license_accounts_index'
  get 'admin/company-license-accounts/new', to: 'admin#company_license_account_new'
  post 'admin/company-license-accounts', to: 'admin#company_license_account_create'
  get 'admin/company-license-accounts/:id', to: 'admin#company_license_account_show', as: 'admin_company_license_account'
  get 'admin/company-license-accounts/:id/edit', to: 'admin#company_license_account_edit', as: 'admin_company_license_account_edit'
  patch 'admin/company-license-accounts/:id', to: 'admin#company_license_account_update'
  delete 'admin/company-license-accounts/:id', to: 'admin#company_license_account_destroy'

  # departments
  get 'admin/departments', to: 'admin#departments_index'
  get 'admin/departments/new', to: 'admin#department_new'
  post 'admin/departments', to: 'admin#department_create'
  get 'admin/departments/:id', to: 'admin#department_show', as: 'admin_department'
  get 'admin/departments/:id/edit', to: 'admin#department_edit', as: 'admin_department_edit'
  patch 'admin/departments/:id', to: 'admin#department_update'
  delete 'admin/departments/:id', to: 'admin#department_destroy'

  # plans
  get 'admin/plans', to: 'admin#plans_index'
  get 'admin/plans/new', to: 'admin#plan_new'
  post 'admin/plans', to: 'admin#plan_create'
  get 'admin/plans/:id', to: 'admin#plan_show', as: 'admin_plan'
  get 'admin/plans/:id/edit', to: 'admin#plan_edit', as: 'admin_plan_edit'
  patch 'admin/plans/:id', to: 'admin#plan_update'
  delete 'admin/plans/:id', to: 'admin#plan_destroy'

  # license_transactions
  get 'admin/license-transactions', to: 'admin#license_transactions_index'
  get 'admin/license-transactions/new', to: 'admin#license_transaction_new'
  post 'admin/license-transactions', to: 'admin#license_transaction_create'
  get 'admin/license-transactions/:id', to: 'admin#license_transaction_show', as: 'admin_license_transaction'
  get 'admin/license-transactions/:id/edit', to: 'admin#license_transaction_edit', as: 'admin_license_transaction_edit'
  patch 'admin/license-transactions/:id', to: 'admin#license_transaction_update'
  delete 'admin/license-transactions/:id', to: 'admin#license_transaction_destroy'

  # transaction users
  get 'admin/transaction-users', to: 'admin#transaction_users_index'
  get 'admin/transaction-users/new', to: 'admin#transaction_user_new'
  post 'admin/transaction-users', to: 'admin#transaction_user_create'
  get 'admin/transaction-users/:id', to: 'admin#transaction_user_show', as: 'admin_transaction_user'
  get 'admin/transaction-users/:id/edit', to: 'admin#transaction_user_edit', as: 'admin_transaction_user_edit'
  patch 'admin/transaction-users/:id', to: 'admin#transaction_user_update'
  delete 'admin/transaction-users/:id', to: 'admin#transaction_user_destroy'

  # license_usages
  get 'admin/license-usages', to: 'admin#license_usages_index'
  get 'admin/license-usages/new', to: 'admin#license_usage_new'
  post 'admin/license-usages', to: 'admin#license_usage_create'
  get 'admin/license-usages/:id', to: 'admin#license_usage_show', as: 'admin_license_usage'
  get 'admin/license-usages/:id/edit', to: 'admin#license_usage_edit', as: 'admin_license_usage_edit'
  patch 'admin/license-usages/:id', to: 'admin#license_usage_update'
  delete 'admin/license-usages/:id', to: 'admin#license_usage_destroy'

  # licenses
  get 'admin/licenses', to: 'admin#licenses_index'
  get 'admin/licenses/new', to: 'admin#license_new'
  post 'admin/licenses', to: 'admin#license_create'
  get 'admin/licenses/:id', to: 'admin#license_show', as: 'admin_license'
  get 'admin/licenses/:id/edit', to: 'admin#license_edit', as: 'admin_license_edit'
  patch 'admin/licenses/:id', to: 'admin#license_update'
  delete 'admin/licenses/:id', to: 'admin#license_destroy'

  # users
  get 'admin/users', to: 'admin#users_index'
  get 'admin/users/new', to: 'admin#user_new'
  post 'admin/users', to: 'admin#user_create'
  get 'admin/users/:id', to: 'admin#user_show', as: 'admin_user'
  get 'admin/users/:id/edit', to: 'admin#user_edit', as: 'admin_user_edit'
  patch 'admin/users/:id', to: 'admin#user_update'
  delete 'admin/users/:id', to: 'admin#user_destroy'

  # vendors
  get 'admin/vendors', to: 'admin#vendors_index'
  get 'admin/vendors/new', to: 'admin#vendor_new'
  post 'admin/vendors', to: 'admin#vendor_create'
  get 'admin/vendors/:id', to: 'admin#vendor_show', as: 'admin_vendor'
  get 'admin/vendors/:id/edit', to: 'admin#vendor_edit', as: 'admin_vendor_edit'
  patch 'admin/vendors/:id', to: 'admin#vendor_update'
  delete 'admin/vendors/:id', to: 'admin#vendor_destroy'

  # vendor contacts
  get 'admin/vendor-contacts', to: 'admin#vendor_contacts_index'
  get 'admin/vendor-contacts/new', to: 'admin#vendor_contact_new'
  post 'admin/vendor-contacts', to: 'admin#vendor_contact_create'
  get 'admin/vendor-contacts/:id', to: 'admin#vendor_contact_show', as: 'admin_vendor_contact'
  get 'admin/vendor-contacts/:id/edit', to: 'admin#vendor_contact_edit', as: 'admin_vendor_contact_edit'
  patch 'admin/vendor-contacts/:id', to: 'admin#vendor_contact_update'
  delete 'admin/vendor-contacts/:id', to: 'admin#vendor_contact_destroy'

  # Error pages
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#internal_error'

  get '/csv', to: 'integrations#csv'
  get '/log-in', to: 'pages#log-in'
  get 'flatfile', to: 'pages#flatfile', as: 'flatfile'
  
  
end
