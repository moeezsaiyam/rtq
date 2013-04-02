module ImagesHelper

  def slider_link(image)
    options = {:class => "slider-image"}
    options[:target] = "_blank" unless image.url == "#"
    link_to(image_tag(image.photo.url(:medium)), url_for(image.url), options)
  end

end
