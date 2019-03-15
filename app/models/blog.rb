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

    belongs_to :topic
end
