class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem



  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  # render new.rhtml
  def new
    @user = User.new
  end

   def edit
    @user = User.find(params[:id])
  end

  def create

    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      redirect_back_or_default('/')
      flash[:notice] = "New user has been created."
    else
      render :controller => 'user', :action => 'new'
    end
  end

  # PUT /authors/1
  # PUT /authors/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Your information has been upfdate successfully'
        format.html { redirect_to(logout_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" } unless params[:action_page] == "edit_password"
           format.html { render :action => "change_password" }
      end
    end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
  end

  def change_password
   @user = User.find(params[:id])

  end

end

