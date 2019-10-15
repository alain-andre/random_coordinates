require "test_helper"

class RandomCoordinatesTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RandomCoordinates::VERSION
  end

  def test_it_should_return_kml_valid_coordinates
    coordinates = RandomCoordinates.at({lat: 46.77, lng: 2.834}, 1000, 'test/poly/france-hexa.kml')
    assert coordinates.is_a? Array
    assert_equal 2, coordinates.size
    coordinates.each{ |lt| assert lt.is_a? Float }
  end

  def test_it_should_return_coordinates
    coordinates = RandomCoordinates.at({lat: 46.77, lng: 2.834}, 1000)
    assert coordinates.is_a? Array
    assert_equal 2, coordinates.size
    coordinates.each{ |lt| assert lt.is_a? Float }
  end
end
