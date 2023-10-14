class MainController < ApplicationController
  def home
    puts "hello world"
    Rails.application.config.assets.paths
  end

  def about
  end

  def contact
  end

  def menu
  end
end
