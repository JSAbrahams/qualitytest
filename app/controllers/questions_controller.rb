class QuestionsController < ApplicationController
  def new
    @type = params[:semantic]
    @state = :init_state
    render :layout => 'SemanticRecognition'
  end

  def next_page
    # state pattern would be much better, this is a bit ugly
    if state == :init_state
      render :layout => 'semanticRecognition'
      @state = :distortion_visible_state

    elsif state == :distortion_visible_state
      render :layout => 'distortionVisible'
      @state = :semantic_recognition_state

    elsif state == :semantic_recognition_state
      if type == :indoor
        render :layout => 'indoorDetails'
      elsif type == :outdoor_natural
        render :layout => 'outdoorNaturalDetails'
      elsif type == :outdoor_man_made
        render :layout => 'outdoorManMadeDetails'
      end
      @state = :describe_details_state

    elsif state == :describe_details_state
      render :ready_path
      @state = :finished
    end
  end
end