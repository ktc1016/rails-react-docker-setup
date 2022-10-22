class ArticleSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower 
  attributes :title, :long_title
end
