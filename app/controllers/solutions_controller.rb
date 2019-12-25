class SolutionsController < ApplicationController
  before_action :set_challenge, except: [:show]
  before_action :set_solution, only: [:show, :edit, :update, :destroy]

  def index
    @solutions = @challenge.solutions
  end

  def show
  end

  def new
    @solution = Solution.new
  end

  def create
    solution = Solution.new(solution_params)
    solution.user = current_user
    solution.language = @challenge.language
    solution.challenge = @challenge

    respond_to do |format|
      if solution.save
        format.html do
          redirect_to challenge_solution_path(challenge_id: @challenge.id, id: solution.id),
          notice: 'Created new solution'
        end
      else
        format.html do
          redirect_to new_challenge_solution_path(@challenge),
          notice: "Failed to create new solution: #{solution.errors.full_messages}"
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html do
          redirect_to challenge_solution_path(challenge_id: @challenge.id, id: @solution.id),
          notice: 'Updated solution'
        end
      else
        format.html do
          redirect_to edit_challenge_solution_path(challenge_id: @challenge.id, id: @solution.id),
          notice: "Failed to update solution: #{@solution.errors.full_messages}"
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      if @solution.destroy
        format.html { redirect_to challenge_solutions_path(@challenge), notice: 'Deleted solution'}
      else
        format.html do
          redirect_to challenge_solution_path(challenge_id: @challenge.id, id: @solution.id),
          notice: "Failed to delete solution: #{@solution.errors.full_messages}"
        end
      end
    end
  end

  private

  def solution_params
    params.require(:solution).permit(:description, :gist)
  end

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def set_solution
    @solution = Solution.find(params[:id])
  end
end
