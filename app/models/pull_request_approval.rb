class PullRequestApproval < ActiveRecord::Base

	def self.getNumApprovals(prId)
		@votes = PullRequestApproval.where(:prId => prId).count	
	end
end
