class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:destroy, :show, :edit, :update]

  def index
    @challenges = Challenge.all
  end

  def show
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Created new challenge' }
      else
        format.html { redirect_to new_challenge_path, notice: "Error creating portfolio: #{@challenge.errors.full_messages}" }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to challenge_path(@challenge), notice: 'Updated challenge' }
      else
        format.html { redirect_to edit_challenge_path(@challenge), notice: "Error saving challenge: #{@challenge.errors.full_messages}" }
      end
    end
  end

  def destroy
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description)
  end
end
