require 'test_helper'

class ColorTest < ActiveSupport::TestCase
  test "#new without hash" do
    assert_equal "#00ff00", c("00ff00").to_s
  end

  test "#new with hashe" do
    assert_equal "#ff0000", c("#ff0000").to_s
  end

  test "#new uppercase" do
    assert_equal "#0000ff", c("0000FF").to_s
  end

  test "#new lowercase" do
    assert_equal "#0000ff", c("0000ff").to_s
  end

  test "#new abbreviation" do
    assert_equal "#ff0000", c("r").to_s
  end  

  test "#new integer" do
    assert_equal "#ff0000", c(4).to_s
  end

  test "#to_s" do
    assert_equal "#ff0000", "#{c("r")}"
  end

  test "#light white" do
    assert c("w").light?
  end

  test "#light rg" do
    assert c("ffff00").light?
  end

  test "#light black" do
    assert !c("n").light?
  end

  test "#light red" do
    assert !c("r").light?
  end

  test "#contrast" do
    assert_equal "#ffffff", c("n").contrast.to_s
    assert_equal "#ffffff", c("r").contrast.to_s
    assert_equal "#ffffff", c("g").contrast.to_s
    assert_equal "#ffffff", c("b").contrast.to_s
    assert_equal "#000000", c("#ff00ff").contrast.to_s
    assert_equal "#000000", c("w").contrast.to_s
  end

  private

  def c(c, h = nil)
    h ? Color.new(c, h) : Color.new(c)
  end
end
