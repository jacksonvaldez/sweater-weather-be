class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_404

  private

  def render_404(exception)
    render json: { errors: exception.record.errors }, status: 404
  end
end
