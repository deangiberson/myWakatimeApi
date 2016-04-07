class Stat < ActiveRecord::Base
  belongs_to :user
  has_one :best_day, class_name: "StatBestDay", inverse_of: :stat
  has_many :editors, class_name: "StatEditor", inverse_of: :stat
  has_many :languages, class_name: "StatLanguages", inverse_of: :stat
  has_many :operating_systems, class_name: "StatOperatingSystem", inverse_of: :stat
  has_many :projects, class_name: "StatProject", inverse_of: :stat
end
