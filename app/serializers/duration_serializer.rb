class DurationSerializer < ActiveModel::Serializer
  attributes :id, :project, :time, :duration, :branch
  has_one :user
end
