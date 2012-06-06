require 'spec_helper'

shared_examples_for "picture_attached" do
  it { should have_attached_file(:picture) }
  # it { should validate_attachment_presence(:picture) } # this is failing due to bug in paperclip             
  it { should validate_attachment_size(:picture).less_than(10.megabytes) }
end