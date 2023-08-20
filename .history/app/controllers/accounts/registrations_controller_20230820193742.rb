class Accounts::RegistrationsController < DeviseController
  def new
    if user_signed_in?
      redirect_to dashboard_path # Redirect to a different page if the user is already signed in
    else
      super
    end
  end
end
