class Company < ActiveRecord::Base
  #use searchkick to search this model
  searchkick

  has_many :comments
  belongs_to :user

  default_scope { 
    order('created_at DESC')
  }
end
