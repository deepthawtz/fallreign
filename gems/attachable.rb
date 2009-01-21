require "ftools"
module Attachable
  include FileUtils
  
  def attachments
    @attachments = Attachment.all(:attachment_type => self.class, :attachment_id => self.id)
  end                                                                                       
  def attachment
    @attachment
  end
  def attachment=(value)
    @attachment = value
    unless value.empty?
      attachment = Attachment.create( :attachment_type => self.class,
                                      :attachment_id   => self.id,
                                      :filename        => @attachment[:filename],
                                      :content_type    => @attachment[:content_type],
                                      :size            => @attachment[:size]
      )
      
      path = File.join('public', 'uploads', "#{attachment.id}")
      File.makedirs(path)
      mv(@attachment[:tempfile].path, File.join(path, attachment.filename))
    end
  end             
end