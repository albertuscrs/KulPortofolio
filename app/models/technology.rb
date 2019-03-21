# == Schema Information
#
# Table name: technologies
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  portfolio_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Technology < ApplicationRecord
  belongs_to :portfolio
end
