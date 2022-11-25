class Api::ResultController < ApplicationController
	  before_action :set_result, only: %i[ show update destroy ]
  before_action :authenticate_api_user!
  # GET /results
  def index
    @results = result.all

    render json: @results
  end

  # GET /results/1
  def show
    render json: @result
  end

  def studentResult
  	@resultat = Result.find(params[:id_user])
    render json: @resultat
  end

  # POST /results
  def create
    @result = result.new(result_params)

    if @result.save
      render json: @result, status: :created, location: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /results/1
  def update
    if @result.update(result_params)
      render json: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /results/1
  def destroy
    @result.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:score, :id_user, :id_test, :date)
    end
end
