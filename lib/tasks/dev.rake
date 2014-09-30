require 'rest-client'
namespace :dev do
  desc "create 48 new Android Server Nodes "
  task :demo => :environment do
    for i in 2..48 do
      server_name = "test0" + i.to_s
      s = Servernode.create(:name=> server_name, :status => "Available")
      s.save!
      p = {:servernode => {:name => server_name,:status => "Available"}}
      #RestClient.post("http://localhost:3000/servernodes",p)
    end
  end

end