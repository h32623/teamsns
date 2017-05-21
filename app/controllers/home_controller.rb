require 'mailgun' 

class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def write
    post = Post.new
    post.email = params[:email]
    post.title = params[:title]
    post.content = params[:content]
    post.image_url = params[:pic]
    
    uploader = AvatarUploader.new
    uploader.store!(params[:pic])
    
    post.image_url = uploader.url
    
    if post.invalid?
      @error_message = post.errors.messages
    else
      post.save
      redirect_to '/'
    end

  end
  
  def post_title
     @one_post = Post.find(params[:p_id])
  end
  
  def update
    @one_post = Post.find(params[:p_id])
  end
  
  def update_post
    @one_post = Post.find(params[:p_id])
    @one_post.title = params[:title]
    @one_post.content = params[:content]
    @one_post.save
    
    redirect_to '/'
  end
  
  def destroy
    one_post = Post.find(params[:p_id])
    one_post.destroy
    
    redirect_to '/'
  end
  
  def comment_create
    comment = Comment.new
    comment.email = params[:email]
    comment.content = params[:content]
    comment.post_id = params[:p_id]
    #comment = one_post.comments.create(email: params[:email], content: params[:content])
    comment.save
    
    redirect_to "/post_title/#{params[:p_id]}"
  end
  
  def comment_update
    @one_post = Post.find(params[:p_id])
    @one_comment = Post.find(params[:p_id]).comments.find(params[:c_id])
  end
  
  def comment_update_post
    one_comment = Post.find(params[:p_id]).comments.find(params[:c_id])
    one_comment.email = params[:email]
    one_comment.content = params[:content]
    one_comment.save
    
    redirect_to "/post_title/#{params[:p_id]}"
  end
  
  def comment_destroy
    comment = Post.find(params[:p_id]).comments.find(params[:c_id])
    comment.destroy
    
    redirect_to "/post_title/#{params[:p_id]}"
  end
  
  def post_like
    like = Like.new
    like.post_id = params[:p_id]
    like.like_count = 0
    
    like.save
    
    
    redirect_to '/post_title/#{params[:p_id]}'
  end
  
  def like
    
    one_like = Post.find(params[:p_id]).likes
    
    if one_like.empty? 
      like = Like.new
      like = Post.find(params[:p_id]).likes.create(like_count: 1)
      like.save      
    
    else
      one_like = Post.find(params[:p_id]).likes.find(params[:l_id])
      one_like.like_count += 1
      one_like.save
    end

    redirect_to :back
  end
  
  def mail
    @one_post = Post.find(params[:p_id])
  end
  
  def mail_write


    @title = params[:title]
    @email = params[:email]
    @content = params[:content]
    

    mg_client = Mailgun::Client.new("key-2f4ec2ed682b67a6abff684d0d78a2c2")
    
    message_params =  {
                       from: 'bob@example.com',
                       to:   @email,
                       subject: @title,
                       text:    @content
                      }
    
    result = mg_client.send_message('sandbox88da7df9e6074ae4b0079ec1e7b3b6d0.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']    
    

    redirect_to '/'
    
  end  
end