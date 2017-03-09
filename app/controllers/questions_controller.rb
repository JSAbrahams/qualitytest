class QuestionsController < ApplicationController
  @type = params[:semantic]
  @state = :init_state
  @question = :dynamicPage

  def next_page
    # state pattern would be much better, this is a bit ugly
    if state == :init_state
      @state = :distortion_visible_state
    elsif state == :distortion_visible_state
      @state = :semantic_recognition_state
    elsif state == :semantic_recognition_state
      @state = :describe_details_state
    elsif state == :describe_details_state
      @state = :finished
    end
  end

  protected

  def dynamicPage
    # state pattern would be much better, this is a bit ugly
    if state == :init_state
      'semanticRecognition'

    elsif state == :distortion_visible_state
      'distortionVisible'

    elsif state == :semantic_recognition_state
      if type == :indoor
        'indoorDetails'
      elsif type == :outdoor_natural
        'outdoorNaturalDetails'
      elsif type == :outdoor_man_made
        'outdoorManMadeDetails'
      end
      @state = :describe_details_state

    elsif state == :describe_details_state
      'done' # will give an error
      @state = :finished
    end
  end
end