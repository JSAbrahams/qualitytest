class TrainingController < ApplicationController
  def self.is_training
    @training = session[:training].nil? ? false : session[:training]
  end

  def self.set_training(training)
    session[:training] = training
  end

end