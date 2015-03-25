class Plans::OpinionsController < ApplicationController

  def new
    @opinion = Opinion.new
    @plan = Plan.find_by_original_url(params[:plan_original_url])
    @next_action = 'create'
  end

  def edit
    @opinion = Opinion.find(params[:id])
    @plan = Plan.find_by_original_url(params[:plan_original_url])
    @next_action = 'update'
  end

  def create
    @opinion = Opinion.new(params_confirm)
    @opinion.plan_id = Plan.find_by_original_url(params[:plan_original_url]).id
    @opinion.cookie = random_string(20)
    @opinion.save
    cookies[(params[:plan_original_url] + "_" + @opinion.id.to_s).to_sym] = {:value => @opinion.cookie}

    redirect_to plan_path(params[:plan_original_url])
  end

  def update
    @opinion = Opinion.find(params[:id])
    @opinion.update(params_confirm)
    redirect_to plan_path(params[:plan_original_url])
  end

  def destroy
    Opinion.destroy(params[:id])
    redirect_to plan_path(params[:plan_original_url])
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
