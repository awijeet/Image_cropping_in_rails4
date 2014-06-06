class Blog < ActiveRecord::Base
  has_attached_file :image, :styles => { :small => "100x100#", :large => "500x500>" }, :default_url => "/images/:style/missing.png", :processors => [:cropper]
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
    
  def reprocess_avatar
    image.reprocess!
  end
  
  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
  end
  
  
end
