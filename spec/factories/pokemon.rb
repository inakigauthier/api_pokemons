FactoryBot.define do
    factory :pokemon do
        name { "Bulbasaur_factory" }
        type_one { "Grass" }
        type_two { "Poison" }
        total { 318 }
        hp { 45 }
        attack { 49 }
        defense { 49 }
        sp_atk { 65 }
        sp_def { 65 }
        speed { 45 }
        generation { 1 }
        legendary { false }
    end
end