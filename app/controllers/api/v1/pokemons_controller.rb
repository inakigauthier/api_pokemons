module Api
  module V1
    class PokemonsController < ApplicationController
      def index
        pokemons = Pokemon.page(params[:page]||1).per(params[:per_page]||20)
        render json: {status: 'SUCCESS', messsage: 'Loaded pokemons', data:pokemons}, status: :ok
      end

      def show
        pokemon = Pokemon.find(params[:id])
        render json: {status: 'SUCCESS', messsage: 'Loaded pokemon', data:pokemon}, status: :ok
      end

      def create
        pokemon = Pokemon.new(pokemon_params)
        if pokemon.save
          render json: {status: 'SUCCESS', message: 'Pokemon saved', data:pokemon}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Pokemon not saved', data:pokemon.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        pokemon = Pokemon.find(params[:id])
        pokemon.destroy
        render json: {status: 'SUCCESS', message: 'Pokemon deleted', data:pokemon}, status: :ok
      end

      def update
        pokemon = Pokemon.find(params[:id])
        if pokemon.update(pokemon_params)
          render json: {status: 'SUCCESS', message: 'Pokemon updated', data:pokemon}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Pokemon not updated', data:pokemon.errors}, status: :unprocessable_entity
        end
      end

      private

      def pokemon_params
        params.permit(:name, :type_one, :type_two, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
      end

    end
  end
end