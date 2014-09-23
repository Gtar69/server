class SubmitformsController < ApplicationController
require "uri"
require "net/http"
  def index
    params = {"utf8"=>"✓", "authenticity_token"=>"OsO+WEYCZRM5CA4fsDdQsZ6rZ5tJ3DMjP4G9jop6SHU=",
      "servernode"=> { "name" => "dwdw", "status" =>"dw" }, "commit"=>"Create Servernode"}

    uri = URI('http://localhost:3000/servernodes')
    #x = CGI::escapeHTML(params)
    Net::HTTP.post_form(uri, params)
  end

end

