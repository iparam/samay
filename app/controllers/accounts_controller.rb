class AccountsController < ApplicationController
  
  before_filter :authenticate_user!,:except=>[:new,:create]
 # before_filter :load_account,:except=>[:new,:create]
  
  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new
		@account.users.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end
  
  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
     respond_to do |format|
      if @account.save
        
        format.html { redirect_to "http://#{@account.name}.#{request.domain}#{request.port_string}/login", notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
end
