class Admin::ColorSchemesController < Admin::ApplicationController
  before_action :set_color_scheme, only: [:show, :edit, :update, :destroy]

  # GET /admin/color_schemes
  # GET /admin/color_schemes.json
  def index
    @color_schemes = ColorScheme.all
  end

  # GET /admin/color_schemes/1
  # GET /admin/color_schemes/1.json
  def show
  end

  # GET /admin/color_schemes/new
  def new
    @color_scheme = ColorScheme.new
  end

  # GET /admin/color_schemes/1/edit
  def edit
  end

  # POST /admin/color_schemes
  # POST /admin/color_schemes.json
  def create
    @color_scheme = ColorScheme.new(color_scheme_params)

    respond_to do |format|
      if @color_scheme.save
        format.html { redirect_to [:admin, @color_scheme], notice: 'Color scheme was successfully created.' }
        format.json { render action: 'show', status: :created, location: @color_scheme }
      else
        format.html { render action: 'new' }
        format.json { render json: @color_scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/color_schemes/1
  # PATCH/PUT /admin/color_schemes/1.json
  def update
    respond_to do |format|
      if @color_scheme.update(color_scheme_params)
        format.html { redirect_to [:admin, @color_scheme], notice: 'Color scheme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @color_scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/color_schemes/1
  # DELETE /admin/color_schemes/1.json
  def destroy
    @color_scheme.destroy
    respond_to do |format|
      format.html { redirect_to admin_color_schemes_url, notice: 'Color scheme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_scheme
      @color_scheme = ColorScheme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_scheme_params
      params.require(:color_scheme).permit(:title, :color)
    end
end
