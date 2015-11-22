require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  test 'fill no gizmos' do
    assert_equal "#dddddd", Family.new.fill.to_s
  end

  test 'fill 1 lit gizmos' do
    assert_equal "#0000ff", family(:gizmos => [{:status => true, :color => "b"}]).fill.to_s
  end

  test 'fill 1 unlit gizmos' do
    assert_equal "#dddddd", family(:gizmos => [{:status => false, :color => "r"}]).fill.to_s
  end

  test 'fill 2 lit gizmos' do
    assert_equal "#ff00ff", family(:gizmos => [{:status => true, :color => "r"},
                                               {:status => true, :color => "b"}]).fill.to_s
  end

  test 'fill 2 lit 1 unlit gizmos' do
    assert_equal "#ff00ff", family(:gizmos => [{:status => true, :color => "r"},
                                               {:status => false, :color => "g"},
                                               {:status => true, :color => "b"}]).fill.to_s
  end

  test 'fill 3 lit gizmos' do
    assert_equal "#ffffff", family(:gizmos => [{:status => true, :color => "r"},
                                               {:status => true, :color => "g"},
                                               {:status => true, :color => "b"}]).fill.to_s
  end

  test 'stroke works' do
    assert_equal "#000000", Family.new.stroke.to_s
  end
end
