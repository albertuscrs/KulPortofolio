# == Schema Information
#
# Table name: blogs
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  status     :integer          default("draft")
#  topic_id   :bigint(8)
#

class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1 }
    extend FriendlyId
    friendly_id :title, use: :slugged

    #:title and :body cannont be empty
    validates_presence_of :title, :body 
    #:topic is now just optional
    belongs_to :topic, optional: true

    def self.special_blogs
        all
    end

    def self.featured_blogs
        limit(2)
    end
end
