class CreateAnswesheets < ActiveRecord::Migration[5.2]
  def change
    create_table :answesheets do |t|
      t.text :question_title
      t.integer :question_id
      t.string :real_name
      t.integer :user_id
      t.string :answer_content
      t.integer :answer_id
      t.date :date

      t.timestamps
    end
  end
end
