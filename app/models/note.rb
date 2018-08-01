class Note < ApplicationRecord
    # Setup notebook/notes relationship
    belongs_to :notebook
    # Set title any time a note is saved
    after_save :set_title

    # all following methods in this class are private (inaccessible to outside objects)
    private

    # Title will be "Note created {created_at}" if title is blank (nil or empty string) any time a note is saved
    def set_title
        if self.title.blank?
            self.title ="Note created" + self.created_at.strftime("%F")
            self.save
        end
    end
end
