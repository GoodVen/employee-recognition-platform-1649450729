class KudosController < ApplicationController
  before_action :set_kudo, only: %i[show edit update destroy]

  # GET /kudos
  def index
    @kudos = Kudo.includes(:giver, :receiver).all
    
  end

  # GET /kudos/1
  def show; end

  # GET /kudos/new
  def new
    @kudo = Kudo.new
  end

  # GET /kudos/1/edit
  def edit; end

  # POST /kudos
  def create
    @kudo = Kudo.new(kudo_params)
    @kudo.giver = current_employee

    if @kudo.save
      current_employee.number_of_available_kudos-=1
      current_employee.save

      redirect_to kudos_path, notice: 'Kudo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /kudos/1
  def update
    if @kudo.giver == current_employee
      if @kudo.update(kudo_params)
        redirect_to @kudo, notice: 'Kudo was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to kudos_path, notice: "You can't update this kudo"
    end
  end

  # DELETE /kudos/1
  def destroy
    @kudo.destroy
    
    @kudo.giver.number_of_available_kudos+=1
    @kudo.giver.save
    redirect_to kudos_url, notice: 'Kudo was successfully destroyed.'

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kudo
    @kudo = Kudo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kudo_params
    params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id)
  end
end
