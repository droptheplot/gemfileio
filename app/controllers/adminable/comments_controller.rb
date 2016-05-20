class Adminable::CommentsController < Adminable::ResourcesController
  def fields
    [
      Adminable::Fields::Integer.new(:id, form: false),
			Adminable::Fields::Text.new(:body),
      Adminable::Fields::BelongsTo.new(:user),
      Adminable::Fields::BelongsTo.new(:project),
			Adminable::Fields::Datetime.new(:created_at, form: false)
    ]
  end
end
