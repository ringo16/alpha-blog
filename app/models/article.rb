class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maxiumum: 50 }
  validates :description, presence: true, length: { minimum: 10, maxiumum: 300 }

end