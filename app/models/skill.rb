# == Schema Information
#
# Table name: skills
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  percent_utilized :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Skill < ApplicationRecord
    include Placeholder
    validates_presence_of :title, :percent_utilized

    #after def new in controller automaticly run
    after_initialize :set_defaults

    #setting the defaults
    def set_defaults
        self.badge ||= Placeholder.image_generator(height: '250', width: '250')
    end
end
