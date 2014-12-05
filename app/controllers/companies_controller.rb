class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    authorize @companies
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
    authorize @company
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    authorize @company
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = current_user.companies.build(company_params)
    authorize @company
      if @company.save
        flash[:notice] = 'Company was successfully created.'
        redirect_to @company
      else
        flash[:error] = "There was an error saving the company. Please try again."
        render :new
      end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    authorize @company
    if @company.update(company_params)
      flash[:notice] = 'Company was successfully created.'
      redirect_to @company
    else
      flash[:error] = "There was an error updating the company. Please try again."
      render :new
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :description)
    end
end
