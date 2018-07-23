class SamplingsController < ApplicationController
  before_action :set_sampling, only: [:show, :edit, :update, :destroy]
  after_action :write_peso, only: [:show, :edit, :update, :destroy]


  # GET /samplings
  # GET /samplings.json
  def index
    @samplings = Sampling.all.page(params['page']).per(10)
  end

  # GET /samplings/1
  # GET /samplings/1.json
  def show
    peso_medio = @sampling.weighings.average(:peso)
    @sampling.peso = peso_medio
  end

  # GET /samplings/new
  def new
    @sampling = Sampling.new
   
    # @weighing = @sampling.weighings.build
    @weighing =  32.times { |t| @sampling.weighings.build }
  end

  # GET /samplings/1/edit
  def edit
  end

  # POST /samplings
  # POST /samplings.json
  def create
    @sampling = Sampling.new(sampling_params)

    respond_to do |format|
      if @sampling.save
        format.html { redirect_to @sampling, notice: t('create_success') }
        format.json { render :show, status: :created, location: @sampling }
      else
        format.html { render :new }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /samplings/1
  # PATCH/PUT /samplings/1.json
  def update
    respond_to do |format|
      if @sampling.update(sampling_params)
        format.html { redirect_to @sampling, notice: t('update_success') }
        format.json { render :show, status: :ok, location: @sampling }
      else
        format.html { render :edit }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samplings/1
  # DELETE /samplings/1.json
  def destroy
    @sampling.destroy
    respond_to do |format|
      format.html { redirect_to samplings_url, notice: t('destroy_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sampling
      @sampling = Sampling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sampling_params
      params.require(:sampling).permit(:product_id, :data, :peso, :lote, :quantidade_produzida, weighings_attributes: [:id, :peso, :_destroy])
    end


    def write_peso
      peso_medio = @sampling.weighings.average(:peso)
      @sampling.peso = peso_medio
      @sampling.update(peso: peso_medio)
      @sampling.save(peso: peso_medio)
      return peso_medio
    end
end
