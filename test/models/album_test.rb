require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "Album cannot be from the future" do
    album = Album.new(title: 'Zonoscope', released: 2200)
    assert_not album.save
    assert_includes album.errors, :released
  end

  test "Albums with good date ranges are valid" do
    assert albums(:just_young_enough).valid?
    assert albums(:from_current_year).valid?
  end

  test "Album ages are calculated correctly" do
    assert_equal albums(:fourteen_years_old).age, 14
    assert_equal albums(:from_current_year).age, 0
  end

  test "Albums w/o a release should return nil from age" do
    assert_equal albums(:no_release).age, nil
  end

  test "Album.released_this_year includes all albums released this year" do
    assert_includes Album.released_this_year, albums(:from_current_year)
  end

  test "Album.released_this_year only includes albums released this year" do
    # albums.select {|album| album.released != Time.now.year }.each do |album|
    albums.each do |album|
      if album.released != Time.now.year
        assert_not_includes Album.released_this_year, album
      end
    end
  end

  test "Album.released_this_year omits albums with no release year" do
    assert_not_includes Album.released_this_year, albums(:no_release)
  end







  test "Album can be assigned an artist" do
    album = Album.create!(title: "foo")
    artist = Artist.create!(name: "bar")

    album.artist = artist
    assert album.save
    # album.update!(artist: artist)

    assert_equal album.artist_id, artist.id
    assert_includes artist.albums, album
  end

  test "Create an album w/ valid data" do
    album = Album.new(title: "foo")
    assert album.valid?
  end

  test "Cannot create an album with no title" do
    album = Album.new
    assert_not album.valid?
  end

  test "Create two albums with different titles" do
    album1 = Album.create!(title: "foo")
    album2 = Album.new(title: "bar")
    assert album2.valid?
  end

  test "Cannot create two albums with the same title" do
    album1 = Album.create!(title: "foo")
    album2 = Album.new(title: "foo")
    assert_not(album2.valid?)
  end
end
