class User < ActiveRecord::Base
  has_many :api_key
  belongs_to :profile
  has_one :leader
end
