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
        format.html do
          redirect_to new_challenge_solution_path(challenge),
          notice: "Failed to create new solution: #{solution.errors.full_messages}"
        end
      end
    end
  end

  def edit
    @challenge = Challenge.find(params[:challenge_id])
    @solution = Solution.find(params[:id])
  end

  def update
    challenge = Challenge.find(params[:challenge_id])
    solution = Solution.find(params[:id])

    respond_to do |format|
      if solution.update(solution_params)
        format.html do
          redirect_to challenge_solution_path(challenge_id: challenge.id, id: solution.id),
          notice: 'Updated solution'
        end
      else
        format.html do
          redirect_to edit_challenge_solution_path(challenge_id: challenge.id, id: solution.id),
          notice: "Failed to update solution: #{solution.errors.full_messages}"
        end
      end
    end
  end

  def destroy
    challenge = Challenge.find(params[:challenge_id])
    solution = Solution.find(params[:id])

    respond_to do |format|
      if solution.destroy
        format.html { redirect_to challenge_solutions_path(challenge), notice: 'Deleted solution'}
      else
        format.html do
          redirect_to challenge_solution_path(challenge_id: challenge.id, id: solution.id),
          notice: "Failed to delete solution: #{solution.errors.full_messages}"
        end
      end
    end
  end

  private

  def solution_params
    params.require(:solution).permit(:description, :gist)
  end
end
