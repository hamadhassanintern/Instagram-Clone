class Accounts::SessionsController < DeviseController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in) # This is the default flash message when login is successful
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def failure
    flash[:alert] = "Invalid email or password" # Set a custom error message
    redirect_to new_session_path(resource_name)
  end
end
