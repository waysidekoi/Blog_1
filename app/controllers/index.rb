# just have the index route, which will display homepage
before do
  @all_posts = Post.all(:order => 'created_at desc')
end

get '/' do 
  erb :index
end
