require 'spec_helper'

shared_examples_for "photo_attached" do
  it { should have_attached_file(:photo) }
  # it { should validate_attachment_presence(:photo) } # this is failing due to bug in paperclip             
  it { should validate_attachment_size(:photo).less_than(10.megabytes) }
end