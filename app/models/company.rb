class Company < ActiveRecord::Base
  # use acts_as_votable for voting
  acts_as_votable

  #use searchkick to search this model
  searchkick

  has_many :comments
  belongs_to :user

  default_scope { 
    order('created_at DESC')
  }
end
