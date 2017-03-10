class QuestionsController < ApplicationController
  def new
    @type = params[:semantic]
    @state = "init_state"
  end

  def next_page
    # state pattern would be much better, this is a bit ugly
    if @state == "init_state"
      @state = :distortion_visible_state
    elsif @state == "distortion_visible_state"
      @state = :semantic_recognition_state
    elsif @state == "semantic_recognition_state"
      @state = :describe_details_state
    elsif @state == "describe_details_state"
      @state = :finished
    end
  end
end