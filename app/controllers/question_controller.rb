class QuestionController < ApplicationController

  def question
    session[:question] =
        case session[:question]
          when 'distortion_visible' then
            score_in_database 'distortion_visible', params[:distortion_visible]
            'scale_ACR'
          when 'scale_ACR' then
            score_in_database 'scale_ACR', params[:scale_ACR]
            'semantic_recognition'
          when 'semantic_recognition' then
            score_in_database 'semantic_recognition', params[:semantic_recognition]
            case params[:semantic_recognition]
              when 'indoor' then
                'indoor_detail'
              when 'outdoor_natural' then
                'outdoor_natural_detail'
              else
                'outdoor_man_made_detail'
            end
          when 'indoor_detail' then
            score_in_database 'detail', params[:indoor_detail]
            'describe_object'
          when 'outdoor_natural_detail' then
            score_in_database 'detail', params[:outdoor_natural_detail]
            'describe_object'
          when 'outdoor_man_made_detail' then
            score_in_database 'detail', params[:outdoor_man_made_detail]
            'describe_object'
          when 'describe_object'
            # question done
            score_in_database 'describe_object', params[:describe_object]
            if session[:training].nil? or session[:training] == true
              session[:training] = false
              redirect_to ready_path
            else
              redirect_to new_image_path
            end
          else
            'distortion_visible'
        end

    puts 'User user_id: [' + session[:userid].to_s + '] is now viewing question [' + session[:question].to_s + ']'
    @question = session[:question]
  end

  private

  # Only store score in database if not training.
  def score_in_database (type, value)
    if session[:training].nil? or session[:training] == true
      puts 'In training, not storing values in database'
      return
    end

    @type = type
    @value = value
    @image_num = session[:img_num]
    @user_id = session[:userid]
    @view_time = session[:view_time]

    puts 'Storing: (type: [' + @type.to_s + '] value: [' + @value.to_s + '] image_no: [' +
             @image_num.to_s + '] view time: [' + @view_time.to_s + '] user_id: [' + @user_id.to_s + '])'

    # code here

    puts 'Done'
  end
end