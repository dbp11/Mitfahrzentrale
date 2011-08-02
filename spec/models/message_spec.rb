# encoding: utf-8
require 'spec_helper'

describe Message do
  before(:each) do
    @attr ={
      :message => "fjfskfsfsefefsffse",
      :writer_id => 123,
      :receiver_id => 321,
      :delete_writer => false,
      :delete_receiver => false
    }
  end

  #Test ob Validation funktionieren
  it "Kontrolle der Beschränkung true,true" do
    no_right_delete = Message.new(@attr.merge(:delete_writer => true, :delete_receiver => true))
    no_right_delete.should_not be_valid
  end

  it "Kontrolle der Validation delete_receiver" do
    no_delete_receiver = Message.new(@attr.merge(:delete_receiver => nil))
    no_delete_receiver.should_not be_valid
  end

  it "Kontrolle der Validation delete_writer" do
    no_delete_writer = Message.new(@attr.merge(:delete_writer => nil))
    no_delete_writer.should_not be_valid
  end
end
