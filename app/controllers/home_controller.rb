class HomeController < ApplicationController
	layout false
  def index
  	@current_time = Time.now
  	@users = User.sorted
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new({:user_name => "Defualt"})
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
end
 def update
     @user = User.find(params[:id])
   if @user.update_attributes(user_params)
      redirect_to(:action => 'show', :id => @user.id)
    else
      render('edit')
    end
end
  def delete


    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  def admin
  end
private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
