class GithubController < ApplicationController
  def index
  end

  def pulls
 	repo = client.repo 'KSCTECHNOLOGIES/realtimeprocess-development'
  	pulls = repo.rels[:pulls]
  	@requests = pulls.get().data
	@requests_json = @requests.collect { |item| 
   		{:id => item.id, :title => item.title, :url => item.html_url, :author => item.user.login } 
   	}.to_json
  end

  def repos
  end

end
