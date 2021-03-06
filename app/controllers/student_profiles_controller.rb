class StudentProfilesController < ApplicationController
  before_action :set_student_profile, only: [:show, :edit, :update, :destroy]

  # GET /student_profiles
  # GET /student_profiles.json
  def index
    @student_profiles = StudentProfile.all.order("full_name ASC").page(params[:page]).per(10)
  end

  # GET /student_profiles/1
  # GET /student_profiles/1.json
  def show
  end

  # GET /student_profiles/new
  def new
    @student_profile = StudentProfile.new
    # @student_profile.build_university_education ##this pre-generated line causes error, not sure why?
  end

  # GET /student_profiles/1/edit
  def edit
  end

  # POST /student_profiles
  # POST /student_profiles.json
  def create
    @student_profile = StudentProfile.new(student_profile_params)
    @student_profile.user = current_user
    @student_profile.setup_full_name
    respond_to do |format|
      if @student_profile.save
        format.html { redirect_to @student_profile, notice: 'Student profile was successfully created.' }
        format.json { render :show, status: :created, location: @student_profile }
      else
        format.html { render :new }
        format.json { render json: @student_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_profiles/1
  # PATCH/PUT /student_profiles/1.json
  def update

    respond_to do |format|
      if @student_profile.update(student_profile_params)
        @student_profile.setup_full_name
        format.html { redirect_to @student_profile, notice: 'Student profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_profile }
      else
        format.html { render :edit }
        format.json { render json: @student_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_profiles/1
  # DELETE /student_profiles/1.json
  def destroy
    @student_profile.destroy
    respond_to do |format|
      format.html { redirect_to student_profiles_url, notice: 'Student profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_profile
      @student_profile = StudentProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_profile_params
      params.require(:student_profile).permit(:title, :first_name, :last_name, :full_name, :letters, :profile_pic, :post_nominal_titles, :bio, :work_history, :resume, :connections)
    end
end
