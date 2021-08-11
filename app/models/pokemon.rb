class Pokemon < ApplicationRecord
    validates :name, :type_one, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, presence: true
end
