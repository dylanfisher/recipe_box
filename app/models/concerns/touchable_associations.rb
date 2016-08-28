# Autosaves associations by updating their updated_at column. This busts
# the cache key of all associated records whenever a related record is updated.

require 'active_support/concern'

module TouchableAssociations

  extend ActiveSupport::Concern

  included do
    after_save :touch_habtm_associations!

    private

      def touch_habtm_associations!
        self.class.reflect_on_all_associations(:has_and_belongs_to_many).each do |association|
          if self.send(association.name).any?
            self.send(association.name).update_all(updated_at: Time.now)
          end
        end
      end
  end

end
