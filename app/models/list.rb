class List < ActiveRecord::Base
    attr_accessible :name, :list_date, :description, :user_id, :assigned_to
  belongs_to :user
  has_many :items
end

# == Schema Information
#
# Table name: lists
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  list_date   :date
#  description :string(255)
#  user_id     :integer
#  assigned_to :integer
#  created_at  :datetime
#  updated_at  :datetime
#

