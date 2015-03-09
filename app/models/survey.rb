class Survey < ActiveRecord::Base
  belongs_to :song
  has_many :answers
  #has_many :questions, dependent: :destroy
  #has_many :songs, through: :questions
end