# frozen_string_literal: true

# Users Controller controls user data
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :check_admin_permission, only: :index
  before_action :check_admin_or_self_permission, except: %i[index new create]
  skip_before_action :authenticate, only: %i[new create]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html do
          flash[:notice] = 'User was successfully created'
          unless session[:current_user_id]
            session[:current_user_id] = @user.id
            redirect_to root_path
          end
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          flash[:notice] = 'User was successfully updated'
          redirect_to @user
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      flash[:notice] = 'User was successfully destroyed.'
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def check_admin_permission
    unless @current_user.admin
      respond_to do |format|
        format.all { render html: '405: Method Not Allowed', status: :method_not_allowed }
      end
    end
  end

  def check_admin_or_self_permission
    unless @current_user.admin || current_user.id == params[:id].to_i
      respond_to do |format|
        format.all { render html: '405: Method Not Allowed', status: :method_not_allowed }
      end
    end
  end
end
