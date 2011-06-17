class Gift < ActiveRecord::Base
  def self.find_by_code gift_code
    Gift.first(:conditions => ['gift_cod = ?', gift_code])
  end
end
