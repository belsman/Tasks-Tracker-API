class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[show update destroy]

  # GET /measurements
  def index
    @measurements = Measurement.all

    @filtered_measurement = @measurements.filter { |m| m.user_id == current_user.id }
    render json: @filtered_measurement
  end

  # GET /measurements/1
  def show
    render json: @measurement
  end

  # POST /measurements
  def create
    @measurement = current_user.measurements.new(measurement_params)

    if @measurement.save
      render json: @measurement, status: :created, location: @measurement
    else
      render json: @measurement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /measurements/1
  def update
    if @measurement.update(measurement_params)
      render json: @measurement
    else
      render json: @measurement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /measurements/1
  def destroy
    @measurement.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def measurement_params
    params.require(:measurement).permit(:reading, :coding, :running, :movie, :project)
  end
end
