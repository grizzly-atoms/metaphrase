class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.string :application_domain
      t.string :original_copy
      t.string :code
      t.string :translated_copy

      t.timestamps
    end
  end
end
