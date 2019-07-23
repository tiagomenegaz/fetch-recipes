class PopulateSpaceWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "WIP"
  end
end
