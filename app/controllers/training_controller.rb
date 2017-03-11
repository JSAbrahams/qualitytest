class TrainingController < ApplicationController
  def new
    @training = true
  end

  public

  def self.is_training
    @training
  end

  def self.set_training(training)
    @training = training
  end

end