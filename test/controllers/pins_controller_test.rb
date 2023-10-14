require "test_helper"

class PinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pin = pins(:one)
  end

  test "should get index" do
    get pins_url
    assert_response :success
  end

  test "should get new" do
    get new_pin_url
    assert_response :success
  end

  test "should create pin" do
    assert_difference('Pin.count') do
      post pins_url, params: { pin: { city_town_village: @pin.city_town_village, latitude: @pin.latitude, longitude: @pin.longitude, postal_code: @pin.postal_code, state_province: @pin.state_province } }
    end

    assert_redirected_to pin_url(Pin.last)
  end

  test "should show pin" do
    get pin_url(@pin)
    assert_response :success
  end

  test "should get edit" do
    get edit_pin_url(@pin)
    assert_response :success
  end

  test "should update pin" do
    patch pin_url(@pin), params: { pin: { city_town_village: @pin.city_town_village, latitude: @pin.latitude, longitude: @pin.longitude, postal_code: @pin.postal_code, state_province: @pin.state_province } }
    assert_redirected_to pin_url(@pin)
  end

  test "should destroy pin" do
    assert_difference('Pin.count', -1) do
      delete pin_url(@pin)
    end

    assert_redirected_to pins_url
  end
end
