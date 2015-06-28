class Post < Fire::Model
  has_path_keys :category
  CATEGORIES = %w{ Default News Style }

  class Comment < Fire::NestedModel
    nested_in Post, folder: 'comments'
  end

  def all_comments
    nested_comments || []
  end
end