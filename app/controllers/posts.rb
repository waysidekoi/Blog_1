# will handle all post-related routes including:
# Show all posts
# Show one posts
# Create posts
# Edit existing posts
# Delete existing post

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])

  show_one_post(@post)
end

helpers do
  
   def show_one_post(post)
    @post = post
    erb :index
   end
  
end