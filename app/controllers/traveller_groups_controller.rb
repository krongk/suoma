class TravellerGroupsController < ApplicationController
  before_action :set_traveller_group, only: [:show, :edit, :update, :destroy]

  # GET /traveller_groups
  # GET /traveller_groups.json
  def index
    @traveller_groups = TravellerGroup.all
  end

  # GET /traveller_groups/1
  # GET /traveller_groups/1.json
  def show
    
  end

  # GET /traveller_groups/new
  def new
    @traveller_group = TravellerGroup.new
  end

  # GET /traveller_groups/1/edit
  def edit
  end

  # POST /traveller_groups
  # POST /traveller_groups.json
  def create
    @traveller_group = TravellerGroup.new(traveller_group_params)

    respond_to do |format|
      if @traveller_group.save
        format.html { redirect_to @traveller_group, notice: 'Traveller group was successfully created.' }
        format.json { render :show, status: :created, location: @traveller_group }
      else
        format.html { render :new }
        format.json { render json: @traveller_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traveller_groups/1
  # PATCH/PUT /traveller_groups/1.json
  def update
    respond_to do |format|
      if @traveller_group.update(traveller_group_params)
        format.html { redirect_to @traveller_group, notice: 'Traveller group was successfully updated.' }
        format.json { render :show, status: :ok, location: @traveller_group }
      else
        format.html { render :edit }
        format.json { render json: @traveller_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traveller_groups/1
  # DELETE /traveller_groups/1.json
  def destroy
    @traveller_group.destroy
    respond_to do |format|
      format.html { redirect_to traveller_groups_url, notice: 'Traveller group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traveller_group
      @traveller_group = TravellerGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traveller_group_params
      params.require(:traveller_group).permit(:trip_id, :agency_contact_id, :trav_date, :price_receivable, :price_received, :price_for_sb)
    end
end
