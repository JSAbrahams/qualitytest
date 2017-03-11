class QuestionController < ApplicationController
  def new
    session[:type] = params[:semantic]
  end

  def question
    @state = session[:state].nil? ? 'semantic_recognition_state' : session[:state]
  end

  def next_page
    @state = case session[:state]
               when 'distortion visible_state' then
                 'semantic_recognition_state'
               when 'semantic_recognition_state' then
                 case session[:type]
                   when 'indoor' then
                     'indoor_detail_state'
                   when 'outdoor_natural' then
                     'outdoor_natural_detail_state'
                   else
                     'outdoor_man_made_detail_state'
                 end
               when 'indoor_detail_state', 'outdoor_natural_detail_state', 'outdoor_man_made_detail_state' then
                 'describe_object_state'
               else
                 'question_done_state'
             end
  end
end