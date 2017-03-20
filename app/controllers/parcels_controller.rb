class ParcelsController < ApplicationController
  before_action :set_parcel, only: [:show, :edit, :update, :destroy]

  # GET /parcels
  # GET /parcels.json
  def index
    @parcels = Parcel.order("created_at DESC").paginate(page: params[:page])
    
  end

  # GET /parcels/1
  # GET /parcels/1.json
  def show
  end

  # GET /parcels/new
  def new
    @parcel = Parcel.new
  end
  
  def search
    @parcels = Parcel.find_by(params[:search][:search_type].to_sym => "#{params[:search][:search_key]}")
    @search_type = params[:search][:search_type]
    @search_key = params[:search][:search_key]
    
    render "index"
  end



  # GET /parcels/1/edit
  def edit
  end

  # POST /parcels
  # POST /parcels.json
  def create
    @parcel = Parcel.new(parcel_params)

    respond_to do |format|
      if @parcel.save
        format.html { redirect_to @parcel, notice: 'Parcel was successfully created.' }
        format.json { render :show, status: :created, location: @parcel }
      else
        format.html { render :new }
        format.json { render json: @parcel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parcels/1
  # PATCH/PUT /parcels/1.json
  def update
    respond_to do |format|
      if @parcel.update(parcel_params)
        format.html { redirect_to @parcel, notice: 'Parcel was successfully updated.' }
        format.json { render :show, status: :ok, location: @parcel }
      else
        format.html { render :edit }
        format.json { render json: @parcel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcels/1
  # DELETE /parcels/1.json
  def destroy
    @parcel.destroy
    respond_to do |format|
      format.html { redirect_to parcels_url, notice: 'Parcel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parcel
      @parcel = Parcel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parcel_params
      params.require(:parcel).permit(:name, :quantity, :phone, :courier, :remakrs)
    end
    
    def search_params
      params.require(:search).permit(:search_key, :search_type)
    end
  
end
