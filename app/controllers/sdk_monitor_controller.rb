class SdkMonitorController < ApplicationController

require 'test_url'
include TestUrl

before_filter :authenticate


  def index

  end

  def test
    @url_list = ["http://api.r1sdk.com/", 
      "http://api.r1sdk.com/applications/361988d0-77a5-0130-64dd-22000ac40812/manifest.json?log=false",
      "http://sdk.via.me/packs/4d292bf0_d624_0130_22fa_22000afc0b0e.json?log=false"]

    if params[:url]
      @result = [params[:url], test_url(params[:url])]
    else
      @result = ["error", "error"]
    end

    if request.xhr?
      render :json => {
        :result => @result
      }
    end
  end

end
