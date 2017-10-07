#create a class for blog posting which sets title, content, publish date, and author for each new posting
#You will then have to determine if the user wants to input a new posting
#give your blogpost a parent to organize all the posts which will keep track of how many blogs and what to do with them
#look up how to push new blog posts into an array (#{})
#create a variable to count posts within the correct parent and instance/class variable organization
#create a publish variable that will output posts to the terminal- instance/class?
#make it so the user can enter authorship
class Blog

  @@all_blog_posts = []
  @@num_blog_posts = 0

  def self.all
    @@all_blog_posts
  end

  def self.add(thing)
    @@all_blog_posts <<thing
    @@num_blog_posts += 1
  end

  def self.publish
    @@all_blog_posts.each do |post|
      puts "Title: \n #{post.title}"
      puts "Body: \n #{post.content}"
      puts "Written by: \n #{post.author_name}"
      puts "Published on: \n #{post.created_at}"
    end
end

end

class BlogPost < Blog
  def self.create

    post = new
    puts "Name your blog post:"
    post.title = gets.chomp
    puts "What do you want to write today?"
    post.content = gets.chomp
    puts "Who wrote this lovely blog?"
    post.author_name = gets.chomp
    post.created_at = Time.now
    post.save
  puts "Would you like to create a another new blog post? Answer Y/N."
  create if gets.chomp.downcase == 'y'
  #This will return through the question prompts only if the answer is Y and otherwise it stops
end

def title
  @title
end

def title=(title)
  @title = title
end

def created_at
  @created_at
end

def created_at=(created_at)
  @created_at = created_at
end

def author_name
  @author_name
end
def author_name=(author_name)
  @author_name = author_name
end

def content
  @content
end
def content=(content)
  @content = content
end

def save
  BlogPost.add(self)
end

end

BlogPost.create
all_blog_posts = BlogPost.all
puts all_blog_posts.inspect
BlogPost.publish
