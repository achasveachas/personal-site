6.times do |i|
    project = Project.new
    project.name = Faker::App.name
    project.description = Faker::Hipster.paragraph
    project.demo_url = Faker::Internet.url
    project.demo_username = "testuser"
    project.demo_password = "testpassword"
    project.repo = Faker::Internet.url(host: "github.com")
    project.blog_post = Faker::Internet.url(host: "blog.yechiel.me")
    project.blog_title = Faker::Hipster.sentence
    project.save
end

# Sample talks data
talks_data = [
  {
    title: "Building Modern Rails Applications",
    description: "A deep dive into modern Rails development practices, including best practices for API design, testing strategies, and deployment patterns.",
    conference_name: "RailsConf 2024",
    talk_date: Date.new(2024, 5, 15),
    youtube_link: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    blog_post_link: "https://blog.yechiel.me/building-modern-rails",
    blog_post_title: "Best Practices for Modern Rails Development"
  },
  {
    title: "The Art of Code Review",
    description: "How to conduct effective code reviews that improve code quality while fostering team collaboration and learning.",
    conference_name: "Tech Leadership Summit",
    talk_date: Date.new(2024, 3, 10),
    youtube_link: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    blog_post_link: "https://blog.yechiel.me/art-of-code-review",
    blog_post_title: "How to Master Code Reviews for Better Teams"
  },
  {
    title: "From Bootcamp to Senior Engineer",
    description: "My journey from coding bootcamp graduate to senior software engineer, including lessons learned and career advice.",
    conference_name: "DevCamp NYC",
    talk_date: Date.new(2023, 11, 8),
    picture_url: "https://via.placeholder.com/800x450/4A90E2/FFFFFF?text=DevCamp+NYC+2023"
  },
  {
    title: "Testing in Production: Best Practices",
    description: "Safe strategies for testing in production environments, including feature flags, canary deployments, and monitoring.",
    conference_name: "QA World Conference",
    talk_date: Date.new(2023, 9, 22),
    youtube_link: "https://youtu.be/dQw4w9WgXcQ",
    blog_post_link: "https://blog.yechiel.me/testing-in-production",
    blog_post_title: "Safe Testing in Production: A Comprehensive Guide"
  },
  {
    title: "Workshop: Introduction to Ruby on Rails",
    description: "A hands-on workshop for beginners covering Rails fundamentals, MVC architecture, and building your first web application.",
    conference_name: "Local Dev Meetup",
    talk_date: Date.new(2023, 6, 5),
    picture_url: "https://via.placeholder.com/800x450/50C878/FFFFFF?text=Rails+Workshop"
  },
  {
    title: "Scaling Rails Applications",
    description: "Techniques for scaling Rails applications to handle millions of users, including database optimization, caching strategies, and architecture patterns.",
    conference_name: "Ruby Summit 2023",
    talk_date: Date.new(2023, 4, 18),
    youtube_link: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  }
]

talks_data.each do |talk_attrs|
  Talk.find_or_create_by(title: talk_attrs[:title]) do |talk|
    talk.description = talk_attrs[:description]
    talk.conference_name = talk_attrs[:conference_name] 
    talk.talk_date = talk_attrs[:talk_date]
    talk.youtube_link = talk_attrs[:youtube_link]
    talk.blog_post_link = talk_attrs[:blog_post_link]
    talk.blog_post_title = talk_attrs[:blog_post_title]
    talk.picture_url = talk_attrs[:picture_url]
  end
end