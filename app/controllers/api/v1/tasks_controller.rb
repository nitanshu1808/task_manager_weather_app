module Api
  module V1
    class TasksController < Api::V1::ApplicationController
      before_action :find_task, only: %i[show update destroy]

      def create
        @task = @current_user.tasks.build(task_params)
        if @task.save
          render json: @task, status: :created
        else
          render json: { errors: @task.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        render json: @task, status: :ok
      end

      def update
        unless @task.update(task_params)
          render json: { errors: @task.errors.full_messages },
                 status: :unprocessable_entity
        end
        render json: @task, status: :ok
      end

      def destroy
        @task.destroy
        render json: { message: "Task id#{@task.id} deleted successfully" }
      end

      private

      def find_task
        @task = @current_user.tasks.find_by(id: params[:id])
        not_found unless @task.present?
      end

      def task_params
        params.require(:task).permit(:title, :description, :due_date)
      end
    end
  end
end
