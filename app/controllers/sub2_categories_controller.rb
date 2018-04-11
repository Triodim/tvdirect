class Sub2CategoriesController < ApplicationController
  before_action :set_sub2_category, only: [:show, :edit, :update, :destroy]

  # GET /sub2_categories
  # GET /sub2_categories.json
  def index
    @sub2_categories = Sub2Category.all
  end

  # GET /sub2_categories/1
  # GET /sub2_categories/1.json
  def show
  end

  # GET /sub2_categories/new
  def new
    @sub2_category = Sub2Category.new
  end

  # GET /sub2_categories/1/edit
  def edit
  end

  # POST /sub2_categories
  # POST /sub2_categories.json
  def create
    @sub2_category = Sub2Category.new(sub2_category_params)

    respond_to do |format|
      if @sub2_category.save
        format.html { redirect_to @sub2_category, notice: 'Sub2 category was successfully created.' }
        format.json { render :show, status: :created, location: @sub2_category }
      else
        format.html { render :new }
        format.json { render json: @sub2_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub2_categories/1
  # PATCH/PUT /sub2_categories/1.json
  def update
    respond_to do |format|
      if @sub2_category.update(sub2_category_params)
        format.html { redirect_to @sub2_category, notice: 'Sub2 category was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub2_category }
      else
        format.html { render :edit }
        format.json { render json: @sub2_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub2_categories/1
  # DELETE /sub2_categories/1.json
  def destroy
    @sub2_category.destroy
    respond_to do |format|
      format.html { redirect_to sub2_categories_url, notice: 'Sub2 category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub2_category
      @sub2_category = Sub2Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub2_category_params
      params.require(:sub2_category).permit(:name, :url, :sub1_category_id)
    end
end
