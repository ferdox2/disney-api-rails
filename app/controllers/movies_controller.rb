class MoviesController < ApplicationController
    def index
        movies = Movie.all
        render json: movies
    end

    def show
        movie = Movie.find(params[:id])
        render json: movie
    end

    def create
        movie = Movie.new(movie_params)
        if movie.save
            render json: movie
        else 
            render json: { error: 'Unable to create movie'}, status: 400
        end
    end

    def update
        movie = Movie.find(params[:id])
        if movie
            movie.update(movie_params)
            render json: movie, status: 200
        else
            render json: {error: 'Unable to update movie'}, status: 400
        end
    end

    def destroy
        movie = Movie.find(params[:id])
        if movie
            movie.destroy
            render json: movie, status: 200
        else
            render json: {error: 'Unable to delete movie'}, status: 400
        end
    end

    private

    def movie_params
        params.permit(:title, :creation_date, :rating)
    end
end
