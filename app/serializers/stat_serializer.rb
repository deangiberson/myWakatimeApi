class StatSerializer < ActiveModel::Serializer
  attributes :id, :range, :holidays, :status, :is_already_updating, :is_stuck, :is_up_to_date, :start, :end, :timezone, :timeout, :writes_only, :total_seconds, :daily_average
  has_one :user
end
