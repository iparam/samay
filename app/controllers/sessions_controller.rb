class SessionsController < Devise::SessionsController
skip_before_filter :load_account
def destroy
  
end

end
