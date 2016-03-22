class UserAgentSerializer < ActiveModel::Serializer
  attributes :id, :user_agent, :editor, :version, :os, :last_seen
  has_one :user
end
