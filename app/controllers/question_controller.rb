class QuestionController < ApplicationController
  def new
    session[:type] = params[:semantic]
  end

  def question
    session[:state] =
        case session[:state]
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
            if TrainingController.is_training
              TrainingController.set_training(false)
              render ready_path
            else
              render new_images_path
            end
          else
            'distortion_visible'
        end

    @state = session[:state]
  end
end