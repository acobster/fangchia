class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :get_layout


  private

  # Get the appropriate layout for the current request
  def get_layout
    # don't use a layout at all when fulfilling AJAX requests,
    # otherwise use the normal app layout
    params[:ajax].present? ? false : 'application'
  end

  # Load environment variables
  def load_env
    Dotenv.load('.env')
  end
end
