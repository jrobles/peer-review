class GithubController < ApplicationController
  def index
  end

  def orgs
	@orgs = client.orgs
  end

  def repos
  	org =  CGI::unescape(params[:org_name])
  	@repos = client.org_repos org, {:type => 'member'}
	@repos.each do |repo|
		if repo.private === false
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

	# Get the number of votes for each PR
	@pull_requests.each do |pull_request|
		numVotes = PullRequestApproval.getNumApprovals(pull_request.id)
		if (numVotes == 1)
			pull_request.statusClass = "one_vote"
		elseif (numVotes > 1) 
			pull_request.statusClass = "two_votes"
		else 
			pull_request.statusClass = "no_votes"
		end
	end
  end

  def pull
  	org =  CGI::unescape(params[:repo])
	pr = CGI::unescape(params[:pid])
	@pull = client.pull_request org,pr
	@comments = client.pull_request_comments org,pr
	@commits = client.pull_commits org,pr

	#render :text => @pull.inspect
  end
end
