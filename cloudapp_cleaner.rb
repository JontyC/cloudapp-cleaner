require 'httparty'

class CloudAppCleaner
  include HTTParty

  @username = 'your_username'
  @password = 'your_password'

  base_uri 'http://my.cl.ly'
  digest_auth @username, @password

  def self.stats
    stats = get("/account/stats", headers: {"Accept" => "application/json"})
    puts "Drops: #{stats['items']}, Views: #{stats['views']}"
  end

  def self.delete_drops
    self.stats

    drops = get("/items?page=1&per_page=100", headers: {"Accept" => "application/json"})
    # drops = drops.select { |d| d["private"] == true } #if you only want to delete private drops

    if drops.empty?
      false
    else
      drops.each_with_index do |drop, i|
        href = drop["href"]
        puts "#{i+1}. DELETING: #{href}"
        delete(href, headers: {"Accept" => "application/json"})
      end
    end
  end
end

# lazy pagination :|
loop do
  break if CloudAppCleaner.delete_drops == false
end

CloudAppCleaner.stats