class ArticlesController < ApplicationController
    def new
       @article = Article.new 
    end

    def create 
        # render plain: params[:article].inspect
        a = article_params[:title]
        puts "Here is the a = #{a.class}"
        # puts "Here is the b = #{a[:title].class}"

        @article = Article.new(article_params)
        #puts(@article)
        # @article.save

        #redirect to the show template 
        # redirect_to articles_path(@article)

        if @article.save
            puts "here in the if loop"
            puts (:notice)
            flash[:notice] = "Article was successfully created"
            puts "#{flash}"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end 

    def show
        # puts "here i am at show --------------"
        # puts "Here is the id #{params[:id]}"
        @article = Article.find(params[:id])  
        # puts "#{@article} here is the article"
    end

    def index    
        @articles = Article.all
    end

    def edit 
        @article = Article.find(params[:id])
    end

    def update 
        @article = Article.find(params[:id])

        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated"
            # puts "#{flash}"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was successfully deleted"
        puts "I was here for"
        #redirect_to article_path
    end



    private 
    #bascially it is returing me a template of object the helps in making a Article object so like article object needs title and description the this will be passed due to the help of that object
    def article_params
        # puts "in the article_params #{:article}"
        # puts :article
        params.require(:article).permit(:title, :description)
    end
end
