class SdkMonitorController < ApplicationController

require 'test_url'
include TestUrl

before_filter :authenticate


  def index

  end


  def test
  	@url_list = ["http://api.r1sdk.com/", 
  		"http://api.r1sdk.com/applications/361988d0-77a5-0130-64dd-22000ac40812/manifest.json?log=false"]

  	@result = Array.new

  	@url_list.each do |url|
  		@result.push([url, test_url(url)])
  	end
  end

end
