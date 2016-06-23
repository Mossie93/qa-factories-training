Paperclip.interpolates(:placeholder) do |attachment, style|
  ActionController::Base.helpers.image_tag("missing_#{style}.png")
end
