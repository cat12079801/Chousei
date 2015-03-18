class Plans::OpinionsController < ApplicationController

  def new
  end

  def edit
  end

  def create
    @opinion = Opinion.new
    # params
    @opinion.name = params[:opinion][:name]
    @opinion.password = Digest::SHA256.hexdigest params[:opinion][:password]
    @opinion.opinion = params[:opinion][:opinion]
    @opinion.note = params[:opinion][:note]

    @opinion.plan_id = params[:id]
    @opinion.cookie = random_string(20)
    @opinion.save
    cookies[(Plan.find(params[:id]).original_url + "_" + @opinion.id.to_s).to_sym] = {:value => @opinion.cookie}

    redirect_to plan_path(params[:plan_id])
  end

  def update
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

    def opinion_params
      #params[:opinion].permit(:password, :title, :explanation, :day_start, :day_end, :day_out, :enable_time, :time_start, :time_end)
    end

    def random_string(i)
      ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(i).join
    end

end
