class QuestionsController < ApplicationController
  def new
    @type = params[:semantic]
    @state = :init_state
  end

  def next_page
    # state pattern would be much better, this is a bit ugly
    if state == :init_state
      render :distortionVisible_url
      @state = :distortion_visible_state

    elsif state == :distortion_visible_state
      render :semanticRecognition_path
      @state = :semantic_recognition_state

    elsif state == :semantic_recognition_state
      if type == :indoor
        render :indoorDetails_path
      elsif type == :outdoor_natural
        render :outdoorNatural_path
      elsif type == :outdoor_man_made
        render :outdoorManMade_path
      end
      @state = :describe_details_state

    elsif state == :describe_details_state
      render :describeObject_path
      @state = :finished
    end
  end
end