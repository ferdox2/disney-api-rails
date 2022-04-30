class CharactersController < ApplicationController
    def index
        characters = Character.all
        render json: characters
    end

    def show
        character = Character.find(params[:id])
        render json: character
    end

    def create
        character = Character.new(character_params)
        if character.save
            render json: character
        else 
            render json: { error: 'Unable to create character'}, status: 400
        end
    end

    def update
        character = Character.find(params[:id])
        if character
            character.update(character_params)
            render json: character, status: 200
        else
            render json: {error: 'Unable to update Character'}, status: 400
        end
    end

    def destroy
        character = Character.find(params[:id])
        if character
            character.destroy
            render json: character, status: 200
        else
            render json: {error: 'Unable to delete Character'}, status: 400
        end
    end

    private

    def character_params
        params.permit(:name, :age, :weight, :history)
    end
end
