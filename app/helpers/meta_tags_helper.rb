module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end

  def meta_keywords
    content_for?(:meta_keywords) ? content_for(:meta_keywords) : DEFAULT_META["meta_description"]
  end

  def meta_title_blog(article)
    article.blog_meta.find_by(title: "title")&.content || article.title
  end

  def meta_description_blog(article)
    description = article.blog_meta.find_by(title: "description")&.content || article.content
    return description.truncate(150, separator: ' ')

  end

  def meta_keywords_blog(article)
    article.blog_tags.empty? ? meta_keywords : article.blog_tags.display_tags_with_coma
  end

end
