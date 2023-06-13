class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @users = User.where.not(id: current_user.id)
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new

  end

  # GET /students/1/edit
  def edit
  end

  def add_friend
    @frinds = Friend.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
    redirect_to students_url 
  end

  def delete_request
    @friend = Friend.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first
    @friend.destroy if @friend.present?
    if params[:cancel_request]
      redirect_to my_request_path
    else
     redirect_to students_path
    end
  end

  def accepted_request
    @frind = Friend.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).last
    @frind.update(is_accept: true)
    # room = params[:sender_id] + params[:receiver_id]
    @room = Room.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
    redirect_to students_path
   end

  def my_request
    @receive = current_user.receive_requests
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :description)
    end
end
