class AuthorsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def home
        render html: "Author Home"
    end

    def create
        author = Author.create(name: params[:name], 
            email: params[:email],
             phone: params[:email])

        render json: author
    end

    def show
        if params[:author_id]
            @author = Author.find_by(id: params[:author_id])
            render :json => @author, :include => [:book]
        else
            @authors = Author.all
            render json: @authors
        end
    end

    def update
        @author = Author.find_by(id: params[:id])
        if(@author == nil)
            render json: {"message": "Author not found"}
        else
            if params[:name] 
                @author.name = params[:name]
            end

            if params[:email]
                @author.email = params[:email]
            end

            if params[:phone]
                @author.phone = params[:phone]
            end

            @author.save

            render json: Author.all
        end

    end
    

    def delete
        author = Author.find_by(id:params[:id])
        if author != nil
            author.destroy
        end

        render json: Author.all
    end
        
end
