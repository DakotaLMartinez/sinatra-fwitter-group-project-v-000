module Concerns::Slugifiable
  def slug
    self.username.downcase.split(/\W/).reject { |w| w.empty? }.join("-")
  end
end