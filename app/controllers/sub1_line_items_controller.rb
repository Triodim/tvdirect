class Sub1LineItemsController < ApplicationController
  before_action :set_sub1_line_item, only: [:show, :edit, :update, :destroy]

  # GET /sub1_line_items
  # GET /sub1_line_items.json
  def index
    @sub1_line_items = Sub1LineItem.all
  end

  # GET /sub1_line_items/1
  # GET /sub1_line_items/1.json
  def show
  end

  # GET /sub1_line_items/new
  def new
    @sub1_line_item = Sub1LineItem.new
  end

  # GET /sub1_line_items/1/edit
  def edit
  end

  # POST /sub1_line_items
  # POST /sub1_line_items.json
  def create
    @sub1_line_item = Sub1LineItem.new(sub1_line_item_params)

    respond_to do |format|
      if @sub1_line_item.save
        format.html { redirect_to @sub1_line_item, notice: 'Sub1 line item was successfully created.' }
        format.json { render :show, status: :created, location: @sub1_line_item }
      else
        format.html { render :new }
        format.json { render json: @sub1_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub1_line_items/1
  # PATCH/PUT /sub1_line_items/1.json
  def update
    respond_to do |format|
      if @sub1_line_item.update(sub1_line_item_params)
        format.html { redirect_to @sub1_line_item, notice: 'Sub1 line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub1_line_item }
      else
        format.html { render :edit }
        format.json { render json: @sub1_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub1_line_items/1
  # DELETE /sub1_line_items/1.json
  def destroy
    @sub1_line_item.destroy
    respond_to do |format|
      format.html { redirect_to sub1_line_items_url, notice: 'Sub1 line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub1_line_item
      @sub1_line_item = Sub1LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub1_line_item_params
      params.require(:sub1_line_item).permit(:product_id, :sub1_category_id)
    end
end
