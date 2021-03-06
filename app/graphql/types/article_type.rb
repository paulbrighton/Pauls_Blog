module Types
  class ArticleType < GraphQL::Schema::Object
    description "An article"
    field :id, ID, null: false
    field :slug, String, null: false
    field :title, String, null: false
    field :author, String, null: false
    field :text, String, null: false
    field :comments, [CommentType], null: true
    field :created_at, String, null: false
    field :updated_at, String, null: false
    field :image, String, null: false

    def image
      Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    end
  end
end