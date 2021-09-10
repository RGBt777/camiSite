class TrandetailsController < ApplicationController
  before_action :set_trandetail, only: [:show, :edit, :update, :destroy]

  # GET /trandetails
  # GET /trandetails.json
  def index
    @trandetails = Trandetail.all
  end

  # GET /trandetails/1
  # GET /trandetails/1.json
  def show
  end

  # GET /trandetails/new
  def new
    @trandetail = Trandetail.new
	@sales_choice = Sales.order("id").collect do |c| [c.id]end
  	@product_choice = Product.order("productname").collect do |p| [p.productname, p.id]end

  end

  # GET /trandetails/1/edit
  def edit
  	@Sales_choice = Sales.order("Sales_id").collect do |c| [c.Sales_id, c.id]end
  	@product_choice = Product.order("productname").collect do |p| [p.productname, p.id]end

  end

  # POST /trandetails
  # POST /trandetails.json
  def create
    @trandetail = Trandetail.new(trandetail_params)

    respond_to do |format|
      if @trandetail.save
        format.html { redirect_to @trandetail, notice: 'Trandetail was successfully created.' }
        format.json { render :show, status: :created, location: @trandetail }
      else
        format.html { render :new }
        format.json { render json: @trandetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trandetails/1
  # PATCH/PUT /trandetails/1.json
  def update
    respond_to do |format|
      if @trandetail.update(trandetail_params)
        format.html { redirect_to @trandetail, notice: 'Trandetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @trandetail }
      else
        format.html { render :edit }
        format.json { render json: @trandetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trandetails/1
  # DELETE /trandetails/1.json
  def destroy
    @trandetail.destroy
    respond_to do |format|
      format.html { redirect_to trandetails_url, notice: 'Trandetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trandetail
      @trandetail = Trandetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trandetail_params
      params.require(:trandetail).permit(:transaction_id, :product_id, :saleprice, :prodqty)
    end
end
