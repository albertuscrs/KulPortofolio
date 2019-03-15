# == Schema Information
#
# Table name: topics
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
    validates_presence_of :title

    has_many :blogs
end
