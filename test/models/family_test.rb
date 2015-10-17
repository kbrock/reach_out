require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  test 'fill_color no gizmos' do
    assert_equal "#dddddd", Family.new.fill_color.to_s
  end

  test 'fill_color 1 lit gizmos' do
    assert_equal "#0000ff", family(:gizmos => [{:status => true, :color => "b"}]).fill_color.to_s
  end

  test 'fill_color 1 unlit gizmos' do
    assert_equal "#dddddd", family(:gizmos => [{:status => false, :color => "r"}]).fill_color.to_s
  end

  test 'fill_color 2 lit gizmos' do
    assert_equal "#ff00ff", family(:gizmos => [{:status => true, :color => "r"},
                                               {:status => true, :color => "b"}]).fill_color.to_s
  end

  test 'fill_color 2 lit 1 unlit gizmos' do
    assert_equal "#ff00ff", family(:gizmos => [{:status => true, :color => "r"},
                                               {:status => false, :color => "g"},
                                               {:status => true, :color => "b"}]).fill_color.to_s
  end

  # #stroke_color
  test 'stroke_color works' do
    assert_equal "#000000", Family.new.stroke_color.to_s
  end
end
