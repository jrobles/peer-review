class CreatePullRequestApprovals < ActiveRecord::Migration
  def change
    create_table :pull_request_approvals do |t|
      t.integer :prId
      t.integer :approverId
      t.datetime :dateApproved

      t.timestamps null: false
    end
  end
end
