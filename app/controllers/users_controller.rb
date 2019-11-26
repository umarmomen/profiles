class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @name_filter = params[:name_filter]
    @course_filter = params[:course_filter]
    @year_filter = params[:year_filter]

    course_filter_not_present = @course_filter.blank?
    year_filter_not_present = @year_filter.blank?
    name_filter_not_present = @name_filter.blank?


    if course_filter_not_present and year_filter_not_present and name_filter_not_present
      @users = User.all
    elsif course_filter_not_present and name_filter_not_present
      @users = User.where(:year=>@year_filter)
    elsif year_filter_not_present and name_filter_not_present
      @users = User.where("courses like ?", "%#{@course_filter}%")
    elsif course_filter_not_present and year_filter_not_present
      @users = User.where("name like ?", "%#{@name_filter}%")
    elsif name_filter_not_present
      @users = User.where("year = #{@year_filter} AND courses like '#{@course_filter}'")
    else
      @users = User.where("year = #{@year_filter} AND courses like '#{@course_filter}' AND name like '#{@name_filter}'")

    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @true_classes = ["CS61A", "CS61B", "CS61C"]
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
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
        :name, :major, :year, :image, :philosophy, :courses, :about)
    end
end
