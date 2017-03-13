class QuestionController < ApplicationController
  def question
    session[:type] = params[:semantic]
    session[:question] =
        case session[:question]
          when 'distortion_visible' then
            'semantic_recognition'
          when 'semantic_recognition' then
            case session[:type]
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
              redirect_to(ready_path)
            else
              redirect_to(new_images_path)
            end
            'distortion_visible'
          else
            'distortion_visible'
        end

    @question = session[:question]
  end
end