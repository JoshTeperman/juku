module Users
  class Create
    include Interactor

    delegate :username, :password, :email, :role, to: :context

    def call
      new_user = User.new(
        username: username,
        password: password,
        email: email,
        role: role,
      )

      if new_user.save
        context.user = new_user
      else
        context.fail!(error: 'Failed to create user')
      end
    end
  end
end
