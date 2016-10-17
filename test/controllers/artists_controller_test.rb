require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  test "should get the new form for a new artist" do
    get :new
    assert_response :success
    assert_template :new

    artist = assigns(:artist)
    assert_not_nil artist
    assert_nil artist.id
  end

  test "Show a non-extant artist" do
    artist_id = 12345
    # Bogus artist ID shouldn't be in the DB, otherwise test is invalid.
    assert_raises ActiveRecord::RecordNotFound do
      Artist.find(artist_id)
    end

    get :show, { id: artist_id }
    assert_response :not_found
  end

  test "Show the requested artist" do
    artist_id = artists(:cut_copy).id
    get :show, { id: artist_id }
    assert_response :success
    assert_template :show

    artist = assigns(:artist)
    assert_not_nil artist
    assert_equal artist.id, artist_id
  end
end
