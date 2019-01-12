class Resume < ApplicationRecord
  validates :description, presence: true
  mount_uploader :attachment, AttachmentUploader

  belongs_to :user
  belongs_to :job
end
