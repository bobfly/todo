class List < ActiveRecord::Base
    attr_accessible :name, :list_date, :description, :user_id, :assigned_to
  belongs_to :user
end
