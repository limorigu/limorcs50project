class UsersController < ApplicationController
  def create
    #creates new users
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.handle} successfully created!"
      redirect_to '/'
    else
      flash[:error] = @user.errors.full_messages.join('\n')
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  #updates users' profiles
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success]= "Succesfully updated #{@user.handle}'s profile!' "
      redirect_to '/profile'
    else 
      flash[:error] = @user.errors.full_messages.join("\n")
      render 'edit'
    end 
    
  end

  #saves certain users' posts on their profiles
  def profile
    @user = current_user
    @my_post = Post.where(:user_id => @user.id)
  end

  def edit 
    @user = current_user
  end

  #deletes users' profiles
  def delete
    @user = current_user
    if @user.destroy
      flash[:success]= "Succesfully destroyed #{@user.handle}'s profile!"
    else 
      flash[:error] = @user.errors.full_messages.join("\n")
    end
    redirect_to '/' 
  end

  private 

    def user_params 
      params.require(:user).permit(:handle, :bio, :email, :avatar, :password, :password_confirmation)
    end
end

