class WeighIn
  include Mongoid::Document
  include Mongoid::Timestamps
  field :weight, :type => Float
  field :body_fat, :type => Float
  field :waist, :type => Float
  field :right_mid_bicept, :type => Float
  field :left_mid_bicept, :type => Float
  field :hips, :type => Float
  field :right_mid_thigh, :type => Float
  field :left_mid_thigh, :type => Float

  def display_fields
    dup = fields.clone.with_indifferent_access
    [:created_at, :updated_at, :_id, :_type].each do |attr|
      dup.delete(attr)
    end
    dup
  end
end
