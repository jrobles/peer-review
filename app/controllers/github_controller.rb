class GithubController < ApplicationController
  def index
  end

  def orgs
	@orgs = client.orgs
  end

  def repos
  	org =  CGI::unescape(params[:org_name])
  	@repos = client.org_repos org
	@repos.each do |repo|
		if repo.private === true
			repo.visibility = "Public"
		else
			repo.visibility = "Private"
		end
	end
  end

  def pulls
  	data = CGI::unescape(params[:repo])
 	repo = client.repo data
  	pulls = repo.rels[:pulls]
  	@pull_requests = pulls.get().data
  end

  def pull
  	org =  CGI::unescape(params[:repo])
	pr = CGI::unescape(params[:pid])
	@pull = client.pull_request org,pr
	@comments = client.pull_request_comments org,pr
  end
end
