class PagesController < ApplicationController
  before_action :ensure_logged_in, only: [:private]

  def home
  end

  def private
    username = current_user.name

    conn = Faraday.new(url: "https://api.github.com")

    response = conn.get("/user/repos?access_token=cce71ae4b54fc63ab10e055447c27c6156d4ae52")

    json = JSON.parse(response.body, symbolize_names: true)
    @repos = json
  end
end
