# just have the index route, which will display homepage

get '/' do
  @all_posts = Post.all
  
  erb :index
end
