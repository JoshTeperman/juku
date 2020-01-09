module Challenges
  class Create
    include Interactor

    delegate  :title,
              :gist,
              :description,
              :user_id,
              :language_id,
              to: :context

    def call
      new_challenge = Challenge.new(
        title: title,
        gist: gist,
        description: description,
        user_id: user_id,
        language_id: language_id
      )

      if new_challenge.save
        context.challenge = new_challenge
      else
        context.fail!(error: 'Failed to create Challenge')
      end
    end
  end
end
