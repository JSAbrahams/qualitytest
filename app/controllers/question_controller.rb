class QuestionController < ApplicationController

  def question
    @user_id = session[:userid]
    @image_id = session[:image_ids][session[:img_num].to_i].to_i
    @view_time = session[:view_time].to_i

    puts 'view_time: ' + @view_time.to_i.to_s

    session[:question] =
        case session[:question]
          when 'distortion_visible' then
            if !session[:training] && !session[:training].nil?
              score = Score.find_by(user_id: @user_id, img_id: @image_id, viewtime: @view_time)
              score.distortion = params[:distortion_visible].to_s == 'yes' ? 1 : 0
              score.quality = params[:scale_ACR]
              score.description = params[:describe_object]
              score.save
            end
            'semantic_recognition'

          when 'semantic_recognition' then
            if !session[:training] && !session[:training].nil?
              score = Score.find_by(user_id: @user_id, img_id: @image_id, viewtime: @view_time)
              score.semantic = params[:semantic_recognition]
              score.save
            end
            case params[:semantic_recognition]
              when 'indoor' then
                'indoor_detail'
              when 'outdoor_natural' then
                'outdoor_natural_detail'
              else
                'outdoor_man_made_detail'
            end

          when 'indoor_detail' then
            if !session[:training] && !session[:training].nil?
              score = Score.find_by(user_id: @user_id, img_id: @image_id, viewtime: @view_time)
              score.detail = params[:indoor_detail]
              save_score(score)
            end
            reset

          when 'outdoor_natural_detail' then
            if !session[:training] && !session[:training].nil?
              score = Score.find_by(user_id: @user_id, img_id: @image_id, viewtime: @view_time)
              score.detail = params[:outdoor_natural_detail]
              save_score(score)
            end
            reset

          when 'outdoor_man_made_detail' then
            if !session[:training] && !session[:training].nil?
              score = Score.find_by(user_id: @user_id, img_id: @image_id, viewtime: @view_time)
              score.detail = params[:outdoor_man_made_detail]
              save_score(score)
            end
            reset

          else
            if !session[:training] && !session[:training].nil?
              Score.create user_id: @user_id, img_id: @image_id, viewtime: @view_time,
                           start_time: Time.now.strftime("%I:%M:%S")
            end
            puts 'created score: ' + session[:score].to_s

            'distortion_visible'
        end

    puts 'User user_id: [' + session[:userid].to_s + '] is now viewing question [' + session[:question].to_s + ']'
    @question = session[:question]
  end

  def save_score (score)
    score.end_time = Time.now.strftime("%I:%M:%S")
    score.save
  end

  def reset
    if session[:training].nil? or session[:training] == true
      session[:training] = false
      redirect_to ready_path
    else
      redirect_to new_image_path
    end
  end
end