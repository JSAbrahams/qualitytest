class PagesController < ApplicationController
  def index
    @title = "Home"
    if params[:user].nil? && params[:campaign].nil? && params[:mw].nil?
      session[:campaign] = 2
      session[:userid] = rand(1..1000)
      session[:images] = CampaignSet.find(session[:campaign]).images
      session[:scale] = CampaignSet.find(session[:campaign]).scale
      #randomize images
      session[:images] = session[:images].split(" ").shuffle
      session[:img_num] = '-1';

      session[:view_time] = NIL
      session[:question] = NIL
      session[:training] = true
      params[:semantic] = NIL
      redirect_to newuser_path
    elsif session[:campaign] == 2 # session[:campaign] = params[:campaign]
      session[:userid] = params[:user].to_s
      @finalstring = params[:mw] += params[:user] += "8c25a8f5e42c00a6f814f45ac764084f4b20a5c476be47ac2a674b82d0ba541f"
      session[:vcode] = Digest::SHA2.hexdigest(@finalstring)
      session[:vcode] = "mw-" + session[:vcode].to_s
      session[:images] = CampaignSet.find(session[:campaign]).images
      session[:scale] = CampaignSet.find(session[:campaign]).scale
      #randomize images
      session[:images] = session[:images].split(" ").shuffle
      session[:img_num] = '-1';

      session[:microworkers] = '1'
      session[:content] = nil
    end
  end

  def intro
    @title = "Instructions"
  end

  def help
    @title = "Help"
  end

  def about
    @title = "About"
  end

  def contact
  end

  def end
    session[:userid] = nil
    session[:campaign] = nil
    session[:images] = nil
    session[:img_num] = nil
    session[:training] = nil
    session[:scale] = nil
    session[:microworkers] = nil
    session[:content] = nil
  end

  def training
    @title = "Training"
    @score = Score.new
    if session[:training] == nil
      session[:training] = 'start'
    elsif session[:training] == 'start'
      session[:training] = 'finish'
    elsif session[:training] == 'finish'
      redirect_to ready_path
    end
  end

  def trainreco
    @title = "Training"
  end

  def trainaest
    @title = "Training"
  end

  def trainend
    @title = "Training"
  end

  def ready
    @title = "Begin Test"
  end

  def totraining
    @title = "Training"
    session[:training] = nil
  end

  def endsubtask
  end

  def intro0
  end

end
