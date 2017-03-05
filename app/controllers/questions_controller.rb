class QuestionsController < ApplicationController
  def new
    @type = params[:semantic]
  end

  # Load the next page
  def update
    redirect_to(distortionVisible_path)
    redirect_to(semanticRecognition_path)
    redirect_to(describeObject_path)

    if (@type == "indoor")
      redirect_to(indoorDetails_path)
    elsif (@type == "outdoor_man_made")
      redirect_to(outdoorManMade_path)
    else
      redirect_to(outdoorNatural_path)
    end
  end

end