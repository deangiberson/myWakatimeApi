class HeartbeatSerializer < ActiveModel::Serializer
  attributes :id, :entity, :entity_type, :time, :project, :branch, :language, :dependencies, :lines, :lineno, :cursorpos, :is_write, :is_debugging
  has_one :user
end
