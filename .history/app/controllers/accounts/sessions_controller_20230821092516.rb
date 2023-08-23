class Accounts::SessionsController < DeviseController
  def failure
    flash[:alert] = "Invalid email or password"
    redirect_to new_session_path(resource_name)
  end
end
