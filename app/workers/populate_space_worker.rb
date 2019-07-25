class PopulateSpaceWorker
  include Sidekiq::Worker

  def perform
    Populate::Content.new.()
  end
end
