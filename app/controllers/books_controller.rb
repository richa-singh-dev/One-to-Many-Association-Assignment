class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    def home
        render json: "Books Home"
    end

    def create
        @author = Author.find_by(id: params[:author_id])
        @book = @author.book.create(name: params[:name], 
            published_date: params[:date])

        render json: @book
    end


    def show
        @books = Book.all
        # respond_to do |format|
        #     format.json  { render :json => @books.to_json(:include => [:author])}
        # end

        # render json: Book.select('*').joins(:author)

        render :json => @books, :include => [:author]
    
    end

    def update
        @book = Book.find_by(id: params[:id])
        if(@book == nil)
            render json: {"message": "Author not found"}
        else
            if params[:name] 
                @book.name = params[:name]
            end

            if params[:email]
                @book.published_date = params[:date]
            end

            @book.save

            render json: Book.all
        end
    end

    def delete
        book = Book.find_by(id:params[:id])
        if book != nil
            book.destroy
        end

        render json: Book.all
    end

end
