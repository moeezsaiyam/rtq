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
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
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
        format.html { render :action => "edit" }
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

