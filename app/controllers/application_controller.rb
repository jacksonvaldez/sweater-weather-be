class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_error
  rescue_from ActiveRecord::RecordNotFound, with: :render_error

  private

  def render_error(exception)
    render json: ErrorSerializer.return_errors([exception.message]), status: 404
  end
end
