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
    if @frinds = Friend.where(sender_id: params[:receiver_id], receiver_id:  current_user.id).present?
      redirect_to my_request_path
      else
      @frinds = Friend.create(sender_id: current_user.id, receiver_id: params[:receiver_id], is_sender: true)
      redirect_to students_url 
    end
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
    @frind = Friend.where(sender_id: params[:sender_id], receiver_id: current_user.id).last
    @frind.update(is_accept: true)
    @room = Room.create(sender_id: params[:sender_id], receiver_id: current_user.id)
    redirect_to students_path
   end

  def my_request
    @receive = current_user.receive_requests
  end
end
