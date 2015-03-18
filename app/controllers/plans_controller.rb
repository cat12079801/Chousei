class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @plan = Plan.find(params[:id])
    @opinions = Opinion.where("plan_id = ?", params[:id].to_i)
    if !@opinions.nil?
      @detail_opinions = Array.new
      for i in 0..@opinions.length - 1 do
        @detail_opinions[i] = JSON.parse(@opinions[i].opinion)
      end
    end
    @opinion = Opinion.new
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)

    @plan.password = Digest::SHA256.hexdigest @plan.password

    # ActiveSupport のおかげ
    @plan.day_number = (@plan.day_end - @plan.day_start).to_i + 1

    today = Date.today.to_s.gsub("-", "")
    begin
      # random_string はユーザ定義関数
      s = random_string(10)
      @plan.original_url = today + "_" + s
    end
    @plan.cookie = random_string(20)
    cookies[@plan.original_url.to_sym] = {:value => @plan.cookie}


    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params[:plan].permit(:password, :title, :explanation, :day_start, :day_end, :day_out, :enable_time, :time_start, :time_end)
    end

    def random_string(i)
      ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(i).join
    end
end
