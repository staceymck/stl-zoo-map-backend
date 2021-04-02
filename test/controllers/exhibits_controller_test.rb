require 'test_helper'

class ExhibitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exhibit = exhibits(:one)
  end

  test "should get index" do
    get exhibits_url, as: :json
    assert_response :success
  end

  test "should create exhibit" do
    assert_difference('Exhibit.count') do
      post exhibits_url, params: { exhibit: { description: @exhibit.description, name: @exhibit.name, species_fact: @exhibit.species_fact, zone_id: @exhibit.zone_id } }, as: :json
    end

    assert_response 201
  end

  test "should show exhibit" do
    get exhibit_url(@exhibit), as: :json
    assert_response :success
  end

  test "should update exhibit" do
    patch exhibit_url(@exhibit), params: { exhibit: { description: @exhibit.description, name: @exhibit.name, species_fact: @exhibit.species_fact, zone_id: @exhibit.zone_id } }, as: :json
    assert_response 200
  end

  test "should destroy exhibit" do
    assert_difference('Exhibit.count', -1) do
      delete exhibit_url(@exhibit), as: :json
    end

    assert_response 204
  end
end
