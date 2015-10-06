class GithubController < ApplicationController
  def index
  end

  def orgs
	@orgs = client.orgs
  end

  def repos
  	org =  CGI::unescape(params[:org_name])
  	@repos = client.repos org
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
  end


end
