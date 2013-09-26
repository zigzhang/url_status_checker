class SdkMonitorController < ApplicationController

require 'test_url'
include TestUrl

  def test
    @url_list = ["http://techcrunch.com/"]

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
