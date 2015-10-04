require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  test 'fill_color no gizmos' do
    assert_equal "#dddddd", Family.new.fill_color
  end

  test 'fill_color 1 lit gizmos' do
    assert_equal "#0000ff", family(:gizmos => [{:status => true, :color => "#0000FF"}]).fill_color
  end

  test 'fill_color 1 unlit gizmos' do
    assert_equal "#dddddd", family(:gizmos => [{:status => false, :color => "#FF0000"}]).fill_color
  end

  test 'fill_color 2 lit gizmos' do
    assert_equal "#ff00ff", family(:gizmos => [{:status => true, :color => "#FF0000"},
                                               {:status => true, :color => "#0000ff"}]).fill_color
  end

  test 'fill_color 2 lit 1 unlit gizmos' do
    assert_equal "#ff00ff", family(:gizmos => [{:status => true, :color => "#FF0000"},
                                               {:status => false, :color => "#00ff00"},
                                               {:status => true, :color => "#0000ff"}]).fill_color
  end

  # #stroke_color
  test 'stroke_color works' do
    assert_equal "#000000", Family.new.stroke_color
  end
end
