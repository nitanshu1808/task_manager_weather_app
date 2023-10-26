class TasksController < ApplicationController
  def index
    @tasks = ::TaskAdaptor.new(current_user).build
    @jwt = JsonWebToken.encode({ user_id: current_user.id })
  end
end
