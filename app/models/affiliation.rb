class Affiliation < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :thing, :counter_cache => true
end