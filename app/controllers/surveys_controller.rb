class SurveysController < ApplicationController

#  def index
 #   @survey = Survey.all
#  end

#  def show
 #   @survey = Survey.find_by(id: params["id"])
  #  @questions = @survey.questions
#  end

  def new
    @song = Song.find_by(id: params["song_id"])
    @survey = Survey.new
  end

  def show
    @song = Song.find_by(id: params["id"])
  end

  def create
    @song = Song.find_by(id: params["song_id"])
    survey_params = params.require(:survey).permit(:answer)
    @survey = @song.survey.new(survey_params)
    @survey.user = current_user
    if @survey.save
      redirect_to @song, notice: "Thanks for answering the survey!"
    else
      render "new"
    end
  end

end