namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_jobs
    # make_authors
    # make_microposts
    # make_relationships
  end
end

def make_jobs
  99.times do |n|
    title  = Faker::Company.name
    Job.create!(:title => title)
  end
end

# def make_authors
#   99.times do |n|
#     name  = Faker::Name.name
#     Author.create!(:name => name)
#   end
# end

# def make_microposts
#   User.all(:limit => 6).each do |user|
#     50.times do
#       content = Faker::Lorem.sentence(5)
#       user.microposts.create!(:content => content)
#     end
#   end
# end

# def make_relationships
#   users = User.all
#   user  = users.first
#   following = users[1..50]
#   followers = users[3..40]
#   following.each { |followed| user.follow!(followed) }
#   followers.each { |follower| follower.follow!(user) }
# end