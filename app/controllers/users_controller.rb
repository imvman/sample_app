class UsersController < ApplicationController
 before_action :signed_in_user, only: [:edit, :update]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user,     only: :destroy
  def new
	@user = User.new
  end
  
  def create
	@user = User.new(user_params)
	if @user.save
		flash[:success] =  "Welcome to the Sample App!"
		redirect_to @user
	else
		render 'new'
	end
  end
  def index 
	#@users = User.all
	@users = User.paginate(page: params[:page])
  end
  
  def show
	@user = User.find(params[:id])
	@microposts = @user.microposts.paginate(page: params[:page])
  end
  def edit
	#@user =  User.find(params[:id])
  end
  def update
	#@user =  User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
	  flash[:success] = "Profile updated"
	  sign_in @user
	  redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
	#User.find(params[:id]).destroy
	user = User.find(params[:id])
	user.destroy
	flash[:success] = "Delete User: #{user.name}!"
	redirect_to users_url
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
	
	# before 
	# def signed_in_user
	    # unless signed_in?
        # store_location
        # redirect_to signin_url, notice: "Please sign in."
      # end
	# end
	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
	def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end
