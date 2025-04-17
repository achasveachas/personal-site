6.times do |i|
    project = Project.new
    project.name = Faker::App.name
    project.description = Faker::Hipster.paragraph
    project.demo_url = Faker::Internet.url
    project.demo_username = "testuser"
    project.demo_password = "testpassword"
    project.repo = Faker::Internet.url(hust: "github.com")
    project.blog_post = Faker::Internet.url(host: "blog.yechiel.me")
    project.blog_title = Faker::Hipster.sentence
    project.save
end