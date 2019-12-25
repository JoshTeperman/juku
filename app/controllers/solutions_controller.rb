class SolutionsController < ApplicationController
  def index
    @challenge = Challenge.find(params[:challenge_id])
    @solutions = @challenge.solutions
  end

  def show
    @solution = Solution.find(params[:id])
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @solution = Solution.new
  end

  def create
    challenge = Challenge.find(params[:challenge_id])
    solution = Solution.new(solution_params)
    solution.user = current_user
    solution.language = challenge.language
    solution.challenge = challenge

    respond_to do |format|
      if solution.save
        format.html do
          redirect_to challenge_solution_path(challenge_id: challenge.id, id: solution.id),
          notice: 'Created new solution'
        end
      else
        format.html { redirect_to new_challenge_solution_path(challenge), notice: "Failed to create new solution: #{solution.errors.full_messages}" }
      end
    end
  end

  private

  def solution_params
    params.require(:solution).permit(:description, :gist)
  end
end
