class LeaderSerializer < ActiveModel::Serializer
  attributes :id, :rank
  has_one :user
end
