require 'rails_helper'

describe 'Pokemon API', type: :request do
	describe 'GET / Pokemons' do
		it 'return all pokemons' do
			FactoryBot.create(:pokemon)

			get '/api/v1/pokemons'

			expect(response).to  have_http_status(:success)
			expect(JSON.parse(response.body).size).to eq(1)
		end
	end

	describe 'POST / Pokemons' do
		let(:valid_params) { 
			{ name: "Bulbasaur_test",
				type_one: "Grass",
				type_two: "Poison",
				total: 318,
				hp: 45,
				attack: 49,
				defense: 49,
				sp_atk: 65,
				sp_def: 65,
				speed: 45,
				generation: 1,
				legendary: false 
			}
		}

		let(:invalid_params) { 
			{ name: "Bulbasaur_test" 
			}
		}

		it 'create a new Pokemon' do
			post '/api/v1/pokemons', params: valid_params
			expect(response).to  have_http_status(:ok)
		end

		it "create a new Pokemon" do
			expect do
			post '/api/v1/pokemons', params: valid_params
			end.to change { Pokemon.count }.by 1
		end

		it 'not create a new Pokemon if missing attributes' do
			post '/api/v1/pokemons', params: invalid_params
			expect(response).to  have_http_status(:unprocessable_entity)
		end

		it "not create a new Pokemon if missing attributes" do
			expect do
			post '/api/v1/pokemons', params: invalid_params
			end.to change { Pokemon.count }.by 0
		end
	end

	describe "PATCH / Pokemons / :id" do
		let(:pokemon) { FactoryBot.create(:pokemon)}


		it "updates a pokemon" do
				patch 'api/v1/pokemons/:id', params: { id: pokemon.id, name: 'New Name' }
				expect(JSON.parse(response.body)["name"]).to eq "New Name"
		end
	end

	describe 'DELETE / Pokemons /:id' do
		let(:pokemon) { FactoryBot.create(:pokemon)}

		it 'delete a pokemon'do
		expect(
			delete "api/v1/pokemons/#{pokemon.id}"

		).to change { Pokemon.count }.from(1).to(0)

		 expect(response).to have_http_status(:ok)
		end
	end

end