# frozen_string_literal: true

module Employees
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    # def after_sign_in_path_for(_current_employee)
    # employee_path
    # end

    # GET /resource/sign_in
    # def new
    # super
    # end

    # POST /resource/sign_in
    def create
      @employee = Employee.new(employee_params)
      @employee = current_employee
      # @employee.number_of_available_kudos = current_employee.number_of_available_kudos - Kudo.where(giver: current_employee).count
      @employee.save(employee_params)
      redirect_to '/employee'
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
    private

    def employee_params
      params.require(:employee).permit(:email, :password, :number_of_available_kudos)
    end
  end
end
