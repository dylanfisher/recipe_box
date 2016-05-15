class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :confirm, :confirm_update]
  before_action :set_box_styles, only: [:show, :edit]

  def index
  end

  def edit
    authorize @user
  end

  def show
    if current_user == @user && @user.not_activated?
      # TODO get flash to work
      redirect_to action: 'confirm', error: 'You need to confirm your account details before continuing.'
      return
    end
    @uploaded_recipes  = Recipe.uploaded_by(@user)
    @collected_recipes = Recipe.collected_by(@user)
  end

  # PATCH/PUT /user/1
  # PATCH/PUT /user/1.json
  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [@user], notice: 'Your profile was saved.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    authorize @user
    if @user.activated?
      # TODO get flash to work
      redirect_to action: 'show', notice: 'You already confirmed your account details.'
      return
    end
  end

  # PATCH/PUT /signup/confirm/1
  # PATCH/PUT /signup/confirm/1.json
  def confirm_update
    authorize @user
    @user.activating = true
    @user.slug = nil
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [@user], notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'confirm' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :email,
                                   :avatar,
                                   :slug,
                                   :location,
                                   :activated,
                                   :website,
                                   :greeting,
                                   box_attributes: [:id, :background_color])
    end

    def set_box_styles
      @box = @user.box
      @box_background_colors = Box::BackgroundColor::COLORS
      @application_body_styles["background-color"] = @box.background_color if @box.background_color.present?
    end
end
