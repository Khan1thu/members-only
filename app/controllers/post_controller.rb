class PostController < ApplicationController
    def index
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_new_path
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(user_params)
            redirect_to @post
        else
            render :edit
        end
    end

    def post_params
        params.require(:post).permit(:title,:body)
    end
end
