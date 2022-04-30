class GenresController < ApplicationController
    def index
        genres = Genre.all
        render json: genres
    end

    def show
        genre = Genre.find(params[:id])
        render json: genre
    end

    def create
        genre = Genre.new(genre_params)
        if genre.save
            render json: genre
        else 
            render json: { error: 'Unable to create genre'}, status: 400
        end
    end

    def update
        genre = Genre.find(params[:id])
        if genre
            genre.update(genre_params)
            render json: genre, status: 200
        else
            render json: {error: 'Unable to update genre'}, status: 400
        end
    end

    def destroy
        genre = Genre.find(params[:id])
        if genre
            genre.destroy
            render json: genre, status: 200
        else
            render json: {error: 'Unable to delete genre'}, status: 400
        end
    end

    private

    def genre_params
        params.permit(:name)
    end
end
