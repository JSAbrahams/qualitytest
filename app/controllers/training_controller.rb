class TrainingController < ApplicationController
  def is_training
    @training = session[:training].nil? ? false : session[:training]
  end

  def set_training(training)
    session[:training] = training
  end

end