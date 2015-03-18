class Plans::OpinionsController < ApplicationController

  def new
    @opinion = Opinion.new
    @plan = Plan.find(params[:plan_id])
  end

  def edit
    @opinion = Opinion.find(params[:id])
    @plan = Plan.find(params[:plan_id])
  end

  def create
    @opinion = Opinion.new(params_confirm)
    @opinion.plan_id = params[:plan_id]
    @opinion.cookie = random_string(20)
    @opinion.save
    cookies[(Plan.find(params[:plan_id]).original_url + "_" + @opinion.id.to_s).to_sym] = {:value => @opinion.cookie}

    redirect_to plan_path(params[:plan_id])
  end

  def update
    @opinion = Opinion.find(params[:id])
    @opinion.update(params_confirm)
    redirect_to plan_path(params[:plan_id])
  end

  def destroy
    Opinion.destroy(params[:id])
    redirect_to plan_path(params[:plan_id])
  end

  private
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    def params_confirm
      params[:opinion].permit(:password, :name, :note, :opinion)
    end

    def random_string(i)
      ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(i).join
    end

end
