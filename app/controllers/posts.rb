# will handle all post-related routes including:
# Show all posts
# Show one posts
# Create posts
# Edit existing posts
# Delete existing post

get '/posts/:post_id' do
  @single_post = Post.find(params[:post_id])

  show_one_post(@single_post)
end

post '/posts/new' do
  @body = params[:body]
  @tags = params[:tags]
  @title = params[:title]

  @post = Post.create(title: @title, body: @body)

  if @post.valid? && (has_commas?(@tags) || one_or_no_tag?(@tags))
    @tags_array = strip_commas(@tags) #removes all white spaces and rejoins as array

    @tags_array.each do |tag|
      @post.tags << Tag.find_or_create_by_name(tag)
    end

    redirect '/'
  elsif @post.valid?
    @message = "Tags must be separated by commas"

    erb :index
  else
    @message = @post.errors.full_messages.first

    erb :index
  end
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id])
  @id = @post.id
  @body = @post.body
  @title = @post.title
  @tags_array = @post.tags.map { |tag| tag.name }

  erb :edit_page
end

get '/posts/delete/:id' do
  "ITS DELETED"
end

helpers do
  def one_or_no_tag?(string)
    string.split.length <= 1
  end

  def has_commas?(string)
    string.include?(',')
  end

  def strip_commas(array)
    array.split(',').map { |word| word.strip }
  end

  def show_one_post(post)
    @post = post
    erb :index
  end
  
  def compact!(hash)
    hash.delete_if { |k,v| !v }
  end
end