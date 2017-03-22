class UsersController < ApplicationController

  def new
    @title = "Register"
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to intro_path
    else
      render 'new'
    end
  end

  def content
    @title = "Question"
    if session[:content].nil?
      session[:content] = 1
    else
      session[:content] = 2
    end
  end

  def update
    if session[:validation] == 1
      user = User.find_by(id: session[:userid])
      user.validation_1 = params[:answer] == 'zebras' ? 1 : 0
      user.save

      session[:validation] = 2
      session[:img_num] = session[:img_num].to_i + 1
      redirect_to show_path
    else
      user = User.find_by(id: session[:userid])
      user.validation_2 = params[:answer] == 'car' ? 1 : 0
      user.save

      session[:validation] = nil
      session[:img_num] = session[:img_num].to_i + 1
      redirect_to show_path
    end
  end

  def crowdsourceuser
    @user = User.new(:name => session[:userid], :email => "", :campaign_id => session[:campaign],)
    @user.age = params[:user][:age]
    @user.gender = params[:user][:gender]
    @user.content1=""
    @user.content2=""
    @user.start_time = Time.now.strftime("%I:%M:%S %z")
    @user.save

    puts 'At ' + @user.start_time.to_s + 'User user_id: [' + session[:userid] + '] gets Campaign campaign_id: [' +
             session[:campaign] + ']'

    redirect_to intro_path
  end

  private

  def user_params
    params.require(:user).permit(:content1, :content2, :id, :campaign_id, :start_time,
                                 :name, :email, :gender, :age)
  end

end
