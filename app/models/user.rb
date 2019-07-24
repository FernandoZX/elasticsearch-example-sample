# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  first_name        :string
#  last_name         :string
#  last_checkin_week :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Elasticsearch::Model::Proxy

  index_name 'users'

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :first_name
      indexes :last_name
      indexes :last_checkin_week, enabled: false, type: :object
    end
  end
end
