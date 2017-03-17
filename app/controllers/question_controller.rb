class QuestionController < ApplicationController

  def question
    puts 'parameters: ', params

    session[:question] =
        case session[:question]
          when 'distortion_visible' then
            storeInDataBase 'distortion_visible', params[:distortion_visible]
            'scale_ACR'
          when 'scale_ACR' then
            storeInDataBase 'scale_ACR', params[:scale_ACR]
            'semantic_recognition'
          when 'semantic_recognition' then
            storeInDataBase 'semantic_recognition', params[:semantic_recognition]
            case params[:semantic]
              when 'indoor' then
                'indoor_detail'
              when 'outdoor_natural' then
                'outdoor_natural_detail'
              else
                'outdoor_man_made_detail'
            end
          when 'indoor_detail' then
            storeInDataBase 'detail', params[:indoor_detail]
            'describe_object'
          when 'outdoor_natural_detail' then
            storeInDataBase 'detail', params[:outdoor_natural_detail]
            'describe_object'
          when 'outdoor_man_made_detail' then
            storeInDataBase 'detail', params[:outdoor_man_made_detail]
            'describe_object'
          when 'describe_object'
            # question done
            storeInDataBase 'describe_object', params[:describe_object]
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

  private

  def storeInDataBase (type, value)
    puts 'stored type ' + type.to_s + ' with value ' + value.to_s + ' for image ' +
             session[:img_num].to_s + ' for user ' + session[:userid].to_s
  end
end