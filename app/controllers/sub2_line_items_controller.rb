class Sub2LineItemsController < ApplicationController
  before_action :set_sub2_line_item, only: [:show, :edit, :update, :destroy]

  # GET /sub2_line_items
  # GET /sub2_line_items.json
  def index
    @sub2_line_items = Sub2LineItem.all
  end

  # GET /sub2_line_items/1
  # GET /sub2_line_items/1.json
  def show
  end

  # GET /sub2_line_items/new
  def new
    @sub2_line_item = Sub2LineItem.new
  end

  # GET /sub2_line_items/1/edit
  def edit
  end

  # POST /sub2_line_items
  # POST /sub2_line_items.json
  def create
    @sub2_line_item = Sub2LineItem.new(sub2_line_item_params)

    respond_to do |format|
      if @sub2_line_item.save
        format.html { redirect_to @sub2_line_item, notice: 'Sub2 line item was successfully created.' }
        format.json { render :show, status: :created, location: @sub2_line_item }
      else
        format.html { render :new }
        format.json { render json: @sub2_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub2_line_items/1
  # PATCH/PUT /sub2_line_items/1.json
  def update
    respond_to do |format|
      if @sub2_line_item.update(sub2_line_item_params)
        format.html { redirect_to @sub2_line_item, notice: 'Sub2 line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub2_line_item }
      else
        format.html { render :edit }
        format.json { render json: @sub2_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub2_line_items/1
  # DELETE /sub2_line_items/1.json
  def destroy
    @sub2_line_item.destroy
    respond_to do |format|
      format.html { redirect_to sub2_line_items_url, notice: 'Sub2 line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub2_line_item
      @sub2_line_item = Sub2LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub2_line_item_params
      params.require(:sub2_line_item).permit(:product_id, :sub2_category_id)
    end
end
