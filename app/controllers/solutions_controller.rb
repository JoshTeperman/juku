class SolutionsController < ApplicationController
  def index
    @challenge = Challenge.find(params[:challenge_id])
    @solutions = @challenge.solutions
  end
end
