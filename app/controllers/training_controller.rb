class TrainingController < ApplicationController
  def new
    @training = true
  end

  public
  def self.isTraining
    @training
  end

  def self.setTraining(training)
    @training = training
  end

end