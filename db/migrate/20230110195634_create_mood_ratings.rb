class CreateMoodRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :mood_ratings do |t|
      t.integer :score

      t.timestamps
    end
  end
end
