require 'test_helper'

class ListTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert List.new.valid?
  end
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

