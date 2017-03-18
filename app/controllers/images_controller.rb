class ImagesController < ApplicationController

  def new
    # depending on the campaign id, selects the next condition in the sequences, which links to a different table
    # which has a presentation time, and an image id, which links to an image path (unique for each image +
    # distortion level)
    @img_num = session[:img_num].to_i

    if @img_num < (session[:image_ids].length-1)
      if @img_num == 5 || @img_num == 19
        redirect_to content_path
      else
        session[:img_num] = @img_num + 1 #increment image id
      end
      #redirect_to show_path
    else
      redirect_to end_path
    end

    #if session[:img_num].to_i < session[:images].length
    @score = Score.new
    #set image to be shown
    @img = Image.find(session[:image_ids][@img_num].to_i)
    session[:view_time] = Viewtime.find(session[:view_time_ids][@img_num].to_i)

    puts 'User user_id: [' + session[:user_id].to_s + ']'
    puts 'Viewing image_id: [' + session[:image_ids][@img_num].to_s+ '], image: [' +
             Image.find(session[:image_ids][@img_num].to_i).to_s + ']'
    puts 'With viewtime_id: [' + session[:view_time_ids][@img_num].to_s+ '], view time: [' +
             Viewtime.find(session[:view_time_ids][@img_num].to_i).to_s + ']'
  end

  private

  def score_params
    params.require(:score).permit(:score, :img_id, :user_id, :scale, :recognizability)
  end

end