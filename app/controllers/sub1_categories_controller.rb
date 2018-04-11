class Sub1CategoriesController < ApplicationController
  before_action :set_sub1_category, only: [:show, :edit, :update, :destroy]

  # GET /sub1_categories
  # GET /sub1_categories.json
  def index
    @sub1_categories = Sub1Category.all
  end

  # GET /sub1_categories/1
  # GET /sub1_categories/1.json
  def show
  end

  # GET /sub1_categories/new
  def new
    @sub1_category = Sub1Category.new
  end

  # GET /sub1_categories/1/edit
  def edit
  end

  # POST /sub1_categories
  # POST /sub1_categories.json
  def create
    @sub1_category = Sub1Category.new(sub1_category_params)

    respond_to do |format|
      if @sub1_category.save
        format.html { redirect_to @sub1_category, notice: 'Sub1 category was successfully created.' }
        format.json { render :show, status: :created, location: @sub1_category }
      else
        format.html { render :new }
        format.json { render json: @sub1_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub1_categories/1
  # PATCH/PUT /sub1_categories/1.json
  def update
    respond_to do |format|
      if @sub1_category.update(sub1_category_params)
        format.html { redirect_to @sub1_category, notice: 'Sub1 category was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub1_category }
      else
        format.html { render :edit }
        format.json { render json: @sub1_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub1_categories/1
  # DELETE /sub1_categories/1.json
  def destroy
    @sub1_category.destroy
    respond_to do |format|
      format.html { redirect_to sub1_categories_url, notice: 'Sub1 category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub1_category
      @sub1_category = Sub1Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub1_category_params
      params.require(:sub1_category).permit(:name, :url, :category_id)
    end
end
