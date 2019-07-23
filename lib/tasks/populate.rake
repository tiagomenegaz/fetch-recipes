namespace :populate do
  desc "This task calls Content Delivery API and requests all content and assets in Contentful that belongs to a space"
  task space: :environment do
    PopulateSpaceWorker.new.perform
  end
end
