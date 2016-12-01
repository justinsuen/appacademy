namespace :URLShortener do
  desc "Prune old ShortenedUrl entries from n minutes ago"
  task prune_old_short_urls: :environment do
    n = ENV['n'].to_i
    puts "Pruning old short urls from #{n} minutes ago..."
    ShortenedUrl.prune_old_short_urls(n)
  end
end
