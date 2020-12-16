class Article < ApplicationRecord
  belongs_to :user
  after_save :contact_edited

  def contact_edited
    if (self.edited_article == true)
      user = self.user
      ContactMailer.with(user: user, article: self).when_edited.deliver_later

      self.update(edited_article: false)
    end
  end
end
