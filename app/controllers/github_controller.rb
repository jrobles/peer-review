class GithubController < ApplicationController
  def index
  end

  def pulls
 	repo = client.repo 'KSCTECHNOLOGIES/realtimeprocess-development'
  	pulls = repo.rels[:pulls]
  	@pull_requests = pulls.get().data
  end

  def pull
	@pull = client.pull_request 'KSCTECHNOLOGIES/realtimeprocess-development','1981'
  end

  def repos
  end

end
