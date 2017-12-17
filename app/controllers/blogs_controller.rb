class BlogsController < ApplicationController
before_action :set_blog, only: [:show, :edit, :update, :destroy]
  # destroyアクションを追加

    def index
        @blogs = Blog.all
    end
    
    def new
        @blog = Blog.new
    end
    
    def create
        @blog = Blog.new(blog_params)
        if @blog.save
          # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
            redirect_to blogs_path, notice: "ブログを作成しました！"
        else
            # 入力フォームを再描画します。
            render 'new'
        end
    end

    def show
        @blog = Blog.find(params[:id])
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            redirect_to blogs_path, notice: "ブログを編集しました！"
        else
            render 'edit'
        end
    end
    
    def destroy
        @blog.destroy
        redirect_to blogs_path, notice:"ブログを削除しました！"
    end

    private
    
    def blog_params
        params.require(:blog).permit(:name, :email, :title, :content)
    end
    
    def set_blog
        @blog = Blog.find(params[:id])
    end
    
end