class BannersController < ApplicationController
  def show
  @banner = Banner.find(params[:id])
  clicks = @banner.clicks
  @banner.clicks = clicks + 1
  @banner.save
  redirect_to @banner.link
  end
end
