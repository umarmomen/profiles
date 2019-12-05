class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @true_classes = User.courses_list

    @name_filter = params[:name_filter]
    @course_filter = params[:course_filter]
    course_filter_not_present = @course_filter.blank?
    name_filter_not_present = @name_filter.blank?

    if course_filter_not_present and name_filter_not_present
      @users = User.all
    elsif name_filter_not_present
      @users = User.where("courses ILIKE ?", "%#{@course_filter}%")
    elsif course_filter_not_present
      @users = User.where("name ILIKE ?", "%#{@name_filter}%")
    else
      @users = User.where("courses ILIKE ?", "%#{@course_filter}%").where("name ILIKE ?", "%#{@name_filter}%")
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @true_classes = User.courses_list
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if params[:user][:secret_key] == User.get_secret_key
      if /\A[\w+\-.]+@berkeley.edu/.match(params[:user][:email])
        @user = User.new(user_params)

        respond_to do |format|
          if @user.save
            format.html { redirect_to edit_user_path(@user), notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:notice] = "Please use your Berkeley Email."
        redirect_to new_user_path
      end
    else
      flash[:notice] = "Wrong Secret Key."
      redirect_to new_user_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if (current_user == nil) || (@user.id != current_user.id)
        format.html { redirect_to @user, notice: "Unauthorized update." }
        format.json { render :show, status: :ok, location: @user }
      else
        if @user.update(user_params)
          format.html { redirect_to @user, notice: "Profile successfully updated!" }
          format.json { render :show, status: :ok, location: @user }
          if params[:courses]
            @user.courses = params[:courses].join(' ')
            @user.save
          end
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,
        :name, :major, :image, :philosophy, :courses, :about)
    end
end
