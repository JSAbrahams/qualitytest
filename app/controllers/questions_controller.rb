class QuestionsController < ApplicationController
  def new
    @type = params[:semantic]
    @state = "semantic_recognition_state"
  end

  def next_page
    # state pattern would be much better, this is a bit ugly
    if @state == "semantic_recognition_state" || @state == "finished"
      @state = "distortion_visible_state"
    elsif @state == "distortion_visible_state"
      @state = "semantic_recognition_state"
    elsif @state == "semantic_recognition_state"
      @state = "describe_details_state"
    elsif @state == "describe_details_state"
      @state = "finished"
      if TrainingController.isTraining
        TrainingController.setTraining(false)
        redirect_to(ready_path)
      else
        redirect_to(new_images_path)
      end
    end
  end
end