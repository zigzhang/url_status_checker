module TestUrl

  require 'net/http'
  def test_url(uri_str)
  	
  	  uri = URI(uri_str)
	  http = Net::HTTP.get_response(uri) # => String

	  case http
	  when Net::HTTPSuccess then
	    test = http.code
	  when Net::HTTPRedirection then
	    test = "Redirected"
	  else
	    test = http.code
	  end

	  return test
  end

end