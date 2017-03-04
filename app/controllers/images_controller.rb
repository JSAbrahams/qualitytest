class ImagesController < ApplicationController

  def new
    if session[:img_num].to_i < (session[:images].length-1)
      if (session[:img_num]).to_i == 5 || (session[:img_num]).to_i == 19
        redirect_to content_path
      else
        session[:img_num] = session[:img_num].to_i + 1 #increment image id
      end
      #redirect_to show_path
    else
      redirect_to end_path
    end

    #if session[:img_num].to_i < session[:images].length
    @score = Score.new
    #set image to be shown
    print 'IMAGES AND IMG_NUM'
    print session[:images]
    print session[:img_num]
    print session[:img_num].to_i
    a = session[:images]
    b = session[:img_num].to_i
    print a
    print b
    print "\n"
    print (a[3]).to_i
    print "\n"
    print (a[b.to_i]).to_i
    @img = Image.find((session[:images][(session[:img_num].to_i)].to_i))
  end

  private

  def score_params
    params.require(:score).permit(:score, :img_id, :user_id, :scale, :recognizability)
  end

end