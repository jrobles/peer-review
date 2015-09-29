class GithubController < ApplicationController
  def index
        require 'json'
        client = Octokit::Client.new(:client_id => ENV['GITHUB_KEY'], :client_secret => ENV['GITHUB_SECRET'])
        repo = client.repo 'josemrobles/peer-review'
        pulls = repo.rels[:pulls]
        @requests = pulls.get().data
        @debug = @requests

        @requests = @requests.collect { |item| 
                {:id => item.id, :title => item.title, :url => item.html_url, :author => item.user.login } 
        }.to_json
        render :json => @requests
  end
end
