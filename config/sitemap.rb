# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.hollyandpine.ca"

SitemapGenerator::Sitemap.create do
  
  ## Static Pages
  
  add about_index_path
  add contact_index_path
  add faq_index_path
  add terms_and_conditions_path
  add new_order_path

  ## Dynamic Pages
  
  # Blogs
  add blogs_path
  Blog.find_each do |blog|
    add blog_path(blog)
  end

  # Services
  [
    'the-classic',
    'the-elevated',
    'the-mrs-claus',
    'the-custom',
    'pickup-and-delivery'
  ].each do |service|
    add services_path(service)
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
