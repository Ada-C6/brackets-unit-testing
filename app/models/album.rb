class Album < ActiveRecord::Base
  belongs_to :artist
  validates :title, presence: true, uniqueness: true
  # Release year should be > 1900, <= this year
  validates :released, allow_nil: true,
        numericality: { greater_than: 1900,
                        less_than_or_equal_to: Time.now.year }

  # Number of years since this album was released
  def age
    released ? Time.now.year - released : nil
  end

  # Select all albums released this year
  def self.released_this_year
    where(released: Time.now.year)
  end
end
