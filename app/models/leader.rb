class Leader < ActiveRecord::Base
  belongs_to :user
  has_one :running_total
end
