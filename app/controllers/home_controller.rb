class HomeController < ApplicationController
  def index
    html = File.read(Rails.root.join('public/index.html').to_s)
    render html: html.html_safe
  end
end