class AgencyContactsController < ApplicationController
  before_action :set_agency
  before_action :set_agency_contact, only: [:show, :edit, :update, :destroy]

  # GET /agency_contacts
  # GET /agency_contacts.json
  def index
    @agency_contacts = AgencyContact.all
  end

  # GET /agency_contacts/1
  # GET /agency_contacts/1.json
  def show
  end

  # GET /agency_contacts/new
  def new
    @agency_contact = AgencyContact.new
  end

  # GET /agency_contacts/1/edit
  def edit
  end

  # POST /agency_contacts
  # POST /agency_contacts.json
  def create
    @agency_contact = AgencyContact.new(agency_contact_params)

    respond_to do |format|
      if @agency_contact.save
        format.html { redirect_to @agency, notice: 'Agency contact was successfully created.' }
        format.json { render :show, status: :created, location: @agency_contact }
      else
        format.html { render :new }
        format.json { render json: @agency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agency_contacts/1
  # PATCH/PUT /agency_contacts/1.json
  def update
    respond_to do |format|
      if @agency_contact.update(agency_contact_params)
        format.html { redirect_to @agency, notice: 'Agency contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @agency_contact }
      else
        format.html { render :edit }
        format.json { render json: @agency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agency_contacts/1
  # DELETE /agency_contacts/1.json
  def destroy
    @agency_contact.destroy
    respond_to do |format|
      format.html { redirect_to agency_contacts_url, notice: 'Agency contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end

    def set_agency_contact
      @agency_contact = AgencyContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_contact_params
      params.require(:agency_contact).permit(:agency_id, :name, :mobile, :is_admin)
    end
end
