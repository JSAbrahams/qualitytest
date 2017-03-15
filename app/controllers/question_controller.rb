class QuestionController < ApplicationController

  def question
    puts 'parameters: ', params

    session[:question] =
        case session[:question]
          when 'distortion_visible' then
            'scale_ACR'
          when 'scale_ACR' then
            'semantic_recognition'
          when 'semantic_recognition' then
            case params[:semantic]
              when 'indoor' then
                'indoor_detail'
              when 'outdoor_natural' then
                'outdoor_natural_detail'
              else
                'outdoor_man_made_detail'
            end
          when 'indoor_detail', 'outdoor_natural_detail', 'outdoor_man_made_detail' then
            'describe_object'
          when 'describe_object'
            # question done
            if session[:training].nil? or session[:training] == true
              session[:training] = false
              redirect_to ready_path
            else
              redirect_to new_image_path
            end
          else
            'distortion_visible'
        end

    @question = session[:question]
  end
end