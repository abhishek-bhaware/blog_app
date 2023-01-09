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
        @article.save

        #redirect to the show template 
        redirect_to articles_show(@article)
    end 

    private 
    #bascially it is returing me a template of object the helps in making a Article object so like article object needs title and description the this will be passed due to the help of that object
    def article_params
        puts "in the article_params #{:article}"
        puts :article
        params.require(:article).permit(:title, :description)
    end
end
