
class ImportMoviesJob < ApplicationJob
  queue_as :default

  def perform(json_data)
    Movie.bulk_import_from_file(json_data)
  end
end
