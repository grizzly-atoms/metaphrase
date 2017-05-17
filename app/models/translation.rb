class Translation < ApplicationRecord
  validates_presence_of :original_copy, :code, :translated_copy
  before_validation :init_defaults

  private

  def init_defaults
    self.application_domain ||= 'default'
  end

end
