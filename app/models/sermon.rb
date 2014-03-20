class Sermon < ActiveRecord::Base

  default_scope order('date desc, created_at desc')

  validates_presence_of :title, :author, :date, :audio
  mount_uploader :audio, AudioUploader

  def date=(attribute)
    if attribute.class == String
      write_attribute :date, Date.strptime(attribute, "%m/%d/%Y")
    else
      write_attribute :date, attribute
    end
  end
end