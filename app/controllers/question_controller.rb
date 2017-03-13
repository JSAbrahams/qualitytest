class QuestionController < ApplicationController
  def new
    session[:type] = params[:semantic]
  end

  def question
    @state = session[:state]
    session[:state] =case session[:state]
                       when 'distortion visible', NIL then
                         'semantic_recognition'
                       when 'semantic_recognition' then
                         case session[:type]
                           when 'indoor' then
                             'indoor_detail'
                           when 'outdoor_natural' then
                             'outdoor_natural_detail'
                           else
                             'outdoor_man_made_detail'
                         end
                       when 'indoor_detail', 'outdoor_natural_detail', 'outdoor_man_made_detail' then
                         'describe_object'
                       else
                         'question_done'
                     end
  end
end