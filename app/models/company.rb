class Company < ActiveRecord::Base
  #use searchkick to search this model
  searchkick autocomplete: ['name']

  has_many :comments
  belongs_to :user

  default_scope { 
    order('created_at DESC')
  }
end
