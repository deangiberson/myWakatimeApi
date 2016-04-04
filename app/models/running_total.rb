class RunningTotal < ActiveRecord::Base
  belongs_to :leader
  has_many :language
end
