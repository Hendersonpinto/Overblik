class IntegrationsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
  
    def index
    end
  
    def csv
  
    end
  end
  