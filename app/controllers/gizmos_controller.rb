class GizmosController < ApplicationController
  before_action :set_gizmo, only: [:show, :edit, :update, :destroy]

  # GET /gizmos
  # GET /gizmos.json
  def index
    @gizmos = Gizmo.all
  end

  # GET /gizmos/1
  # GET /gizmos/1.json
  def show
  end

  # GET /gizmos/new
  def new
    @gizmo = Gizmo.new(gizmo_params)
    @families = Family.all
  end

  # GET /gizmos/1/edit
  def edit
    @families = Family.all
  end

  # POST /gizmos
  # POST /gizmos.json
  def create
    @gizmo = Gizmo.new(gizmo_params)

    respond_to do |format|
      if @gizmo.save
        format.html { redirect_to @gizmo.family || @gizmo, notice: 'Gizmo was successfully created.' }
        format.json { render :show, status: :created, location: @gizmo }
      else
        format.html { render :new }
        format.json { render json: @gizmo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gizmos/1
  # PATCH/PUT /gizmos/1.json
  def update
    respond_to do |format|
      if @gizmo.update(gizmo_params)
        format.html { redirect_to @gizmo, notice: 'Gizmo was successfully updated.' }
        format.json { render :show, status: :ok, location: @gizmo }
      else
        format.html { render :edit }
        format.json { render json: @gizmo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gizmos/1
  # DELETE /gizmos/1.json
  def destroy
    @gizmo.destroy
    respond_to do |format|
      format.html { redirect_to gizmos_url, notice: 'Gizmo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gizmo
      @gizmo = Gizmo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gizmo_params
      params[:gizmo] ? params.require(:gizmo).permit(:name, :status, :color, :family_id) : {}
    end
end
