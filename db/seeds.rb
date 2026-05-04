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

talks_data = [
  {
    title: "Building Modern Rails Applications",
    description: "A comprehensive deep dive into modern Rails development practices that will transform how you build web applications. We'll explore cutting-edge API design patterns, including RESTful endpoints, GraphQL integration, and microservices architecture. This talk covers advanced testing strategies using RSpec, Capybara, and factory patterns that ensure robust, maintainable code. We'll also discuss deployment automation using Docker, CI/CD pipelines, and blue-green deployments on platforms like Heroku and AWS. Along the way, we'll examine real-world case studies of Rails applications serving millions of users, performance optimization techniques including database indexing and query optimization, caching strategies with Redis and Memcached, and security best practices to protect against common vulnerabilities. Whether you're a junior developer looking to level up or a senior engineer wanting to stay current with the latest Rails ecosystem, this session will provide actionable insights you can immediately apply to your projects.",
    conference_name: "RailsConf 2024",
    talk_date: Date.new(2024, 5, 15),
    youtube_link: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    blog_post_link: "https://blog.yechiel.me/building-modern-rails",
    blog_post_title: "Best Practices for Modern Rails Development",
    slides_url: "https://speakerdeck.com/yechiel/building-modern-rails-applications"
  },
  {
    title: "The Art of Code Review",
    description: "Code reviews are more than just catching bugs – they're a powerful tool for knowledge sharing, maintaining code quality, and building stronger development teams. In this session, we'll explore the psychology behind effective code reviews and learn practical techniques that go far beyond simply checking for syntax errors. We'll discuss how to provide constructive feedback that helps team members grow, strategies for reviewing different types of changes from small bug fixes to major architectural decisions, and how to balance thoroughness with development velocity. The talk includes real examples of before-and-after code review comments, discusses common pitfalls that lead to defensive behavior or hurt feelings, and provides frameworks for conducting reviews that are both educational and encouraging. We'll also cover tooling and automation that can enhance the review process, including static analysis tools, automated testing integration, and how to set up review workflows that work for both remote and co-located teams.",
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
    picture_url: "https://via.placeholder.com/800x450/4A90E2/FFFFFF?text=DevCamp+NYC+2023",
    slides_url: "https://docs.google.com/presentation/d/1abc123/edit"
  },
  {
    title: "Testing in Production: Best Practices",
    description: "Testing in production doesn't have to be scary or dangerous when done right. This talk breaks down proven strategies for safely validating your applications in real-world environments while maintaining system stability and user confidence. We'll start with feature flags and how to use them effectively for gradual rollouts, A/B testing, and emergency rollbacks. You'll learn about canary deployments, blue-green deployment strategies, and how to implement robust monitoring and alerting systems that catch issues before users do. The session covers different types of production testing including synthetic monitoring, real user monitoring, chaos engineering principles, and load testing strategies that don't bring down your systems. We'll also discuss the cultural and organizational changes needed to embrace production testing, how to build confidence in your team, and frameworks for making go/no-go decisions during deployments. Real case studies from companies like Netflix, Facebook, and Amazon will illustrate these concepts in action, showing both successes and failures that led to better practices. By the end of this session, you'll have a toolkit of techniques and the confidence to test safely in production environments.",
    conference_name: "QA World Conference",
    talk_date: Date.new(2023, 9, 22),
    youtube_link: "https://youtu.be/dQw4w9WgXcQ",
    blog_post_link: "https://blog.yechiel.me/testing-in-production",
    blog_post_title: "Safe Testing in Production: A Comprehensive Guide",
    slides_url: "https://slideshare.net/yechiel/testing-in-production-best-practices"
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
  talk = Talk.find_or_initialize_by(title: talk_attrs[:title])
  talk.description = talk_attrs[:description]
  talk.conference_name = talk_attrs[:conference_name] 
  talk.talk_date = talk_attrs[:talk_date]
  talk.youtube_link = talk_attrs[:youtube_link]
  talk.blog_post_link = talk_attrs[:blog_post_link]
  talk.blog_post_title = talk_attrs[:blog_post_title]
  talk.picture_url = talk_attrs[:picture_url]
  talk.slides_url = talk_attrs[:slides_url]
  talk.save!
end