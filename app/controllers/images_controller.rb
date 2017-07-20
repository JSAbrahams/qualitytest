class ImagesController < ApplicationController

  def new
    # depending on the campaign id, selects the next condition in the sequences, which links to a different table
    # which has a presentation time, and an image id, which links to an image path (unique for each image +
    # distortion level)

    @img_num = session[:img_num].to_i
    if @img_num >= (session[:image_ids].length - 1)
      return redirect_to end_path
    end

    if session[:training] || session[:training].nil?
      @img = Image.find(-1)
      session[:view_time] = 107
      puts 'User shown training image: ' + @img.filepath.to_s
      return
    end

    @score = Score.new
    #set image to be shown
    @img = Image.find(session[:image_ids][@img_num].to_i)
    session[:view_time] = Viewtime.find(session[:view_time_ids][@img_num].to_i).viewtime

    # Redirect if correct image number and validation is 1 or 2
    if (@img_num == 5 && session[:validation] == 1) || (@img_num == 12 && session[:validation] == 2)
      return redirect_to content_path
    end

    puts 'User user_id: [' + session[:user_id].to_s + ']'
    puts 'showing image ' + @img_num.to_s
    puts 'Viewing image_id: [' + session[:image_ids][@img_num].to_s+ '], image: [' + @img.filepath.to_s + ']'
    puts 'With viewtime_id: [' + session[:view_time_ids][@img_num].to_s+ '], view time: [' +
             session[:view_time].to_s + ']'

    @img_num = @img_num + 1 #increment image id
    session[:img_num] = @img_num
  end

  private

  def score_params
    params.require(:score).permit(:score, :img_id, :user_id, :scale, :recognizability)
  end

end