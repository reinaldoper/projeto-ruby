class SubmitScoresInBulkJob < ApplicationJob
  queue_as :default

  def perform(scores_data)
    Movie.submit_scores_in_bulk(scores_data)
  end
end