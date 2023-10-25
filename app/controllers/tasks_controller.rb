class TasksController < ApplicationController
  def index
    @tasks = ::TaskAdaptor.new(current_user).build
  end
end
