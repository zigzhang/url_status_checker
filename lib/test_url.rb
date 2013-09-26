module TestUrl

  require 'net/http'
  def test_url(uri_str)
  	
  	  uri = URI(uri_str)
	  http = Net::HTTP.get_response(uri) # => String

	  test = http.code


	  return test
  end

end