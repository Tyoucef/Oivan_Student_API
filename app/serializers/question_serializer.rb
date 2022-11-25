class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :test
end
