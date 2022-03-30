class UsersController < Devise::RegistrationsController
  layout :set_layout, except: []
  before_action :authenticate_user!, except: %i[]
  before_action :set_user, only: %i[ profile ]

  def profile
    @new_user = User.new
    render 'profile/index'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(current_user.id)
  end

  # Only allow a list of trusted parameters through.
  # def course_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :role, :profile_picture)
  # end

  protected

  def set_layout
    _layout = ""
    if !(current_user)
      _layout = "default"
    else
      _layout = "admin"
    end
    _layout
  end
end
