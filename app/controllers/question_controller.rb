class QuestionController < ApplicationController
  def new
    session[:type] = params[:semantic].to_s
  end

  def question
    if session[:state].nil?
      session[:state] = 'semantic_recognition_state'
    end

    @state = session[:state]
    @type = session[:type]
  end

  def next_page
    # state pattern would be much better, this is a bit ugly
    if session[:state].nil? || session[:state] == 'semantic_recognition_state' || session[:state] == 'finished'
      session[:state] = 'distortion_visible_state'
    elsif session[:state]== 'distortion_visible_state'
      session[:state] = 'semantic_recognition_state'
    elsif session[:state] == 'semantic_recognition_state'
      session[:state] = 'describe_details_state'
    elsif session[:state] == 'describe_details_state'
      session[:state] = 'finished'
      if TrainingController.isTraining
        TrainingController.setTraining(false)
        redirect_to(ready_path)
      else
        redirect_to(new_images_path)
      end
    end
  end
end