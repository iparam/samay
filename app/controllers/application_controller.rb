class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :load_account
  
  
  def load_account
  
    if request.subdomain.present?
     @account_subdomain =Account.where("name"=>request.subdomain).limit(1).first 
      if @account_subdomain.present? 
        if current_user
          unless @account_subdomain.users.include?(current_user) 
            redirect_to logout_path  
          end
        end
      else
       redirect_to("http://#{request.domain}#{request.port_string}",:error=>"Account is not present")
      end      
    end  
    
  end
  
  
end
