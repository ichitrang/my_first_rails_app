class CaresController < ApplicationController
  before_action :set_care, only: %i[ show edit update destroy ]

  # GET /cares or /cares.json
  def index
    @cares = Care.all
  end

  # GET /cares/1 or /cares/1.json
  def show
  end

  # GET /cares/new
  def new
    @care = Care.new
  end

  # GET /cares/1/edit
  def edit
  end

  # POST /cares or /cares.json
  def create
    @care = Care.new(care_params)

    respond_to do |format|
      if @care.save
        format.html { redirect_to @care, notice: "Care was successfully created." }
        format.json { render :show, status: :created, location: @care }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @care.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cares/1 or /cares/1.json
  def update
    respond_to do |format|
      if @care.update(care_params)
        format.html { redirect_to @care, notice: "Care was successfully updated." }
        format.json { render :show, status: :ok, location: @care }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @care.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cares/1 or /cares/1.json
  def destroy
    @care.destroy!

    respond_to do |format|
      format.html { redirect_to cares_path, status: :see_other, notice: "Care was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care
      @care = Care.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def care_params
      params.require(:care).permit(:make, :model, :year)
    end
end
