# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.destroy_all
Question.destroy_all
Answer.destroy_all
User.destroy_all
Answesheet.destroy_all

Admin.create!({
  email: "admin@tomosia.com",
  password: "admin@1234"
})


question1 = Question.create(title: "Hôm nay bạn cảm thấy thế nào?")
question2 = Question.create(title: "Sếp bạn có đáng yêu không?")
question3 = Question.create(title: "Đòi sếp tăng lương?")
question4 = Question.create(title: "Test")

answer1 = Answer.create(
  content: "Khỏe lắm",
  question_id: question1.id
)

answer2 = Answer.create(
  content: "Hơi khỏe thôi",
  question_id: question1.id
)

answer3 = Answer.create(
  content: "Mệt",
  question_id: question1.id
)

answer4 = Answer.create(
  content: "Siêu đáng yêu",
  question_id: question2.id
)

answer5 = Answer.create(
  content: "Siêu đáng ghét",
  question_id: question2.id
)

answer6 = Answer.create(
  content: "Tăng",
  question_id: question3.id
)

answer7 = Answer.create(
  content: "Thôi",
  question_id: question3.id
)

user1 = User.create(
  email: "huy@gmail.com",
  real_name: "Huy",
  phone: "0123456789"
)

user2 = User.create(
  email: "A@gmail.com",
  real_name: "A",
  phone: "0127584939"
)

user3 = User.create(
  email: "B@gmail.com",
  real_name: "B",
  phone: "0123478939"
)

Answesheet.create!([{
  question_title: question1.title,
  question_id: question1.id,
  real_name: user1.real_name,
  user_id: user1.id,
  answer_content: answer1.content,
  answer_id: answer1.id,
  date: "2019-06-14"
},
{
  question_title: question1.title,
  question_id: question1.id,
  real_name: user2.real_name,
  user_id: user2.id,
  answer_content: answer2.content,
  answer_id: answer2.id,
  date: "2019-06-14"
},
{
  question_title: question1.title,
  question_id: question1.id,
  real_name: user3.real_name,
  user_id: user3.id,
  answer_content: answer3.content,
  answer_id: answer3.id,
  date: "2019-06-14"
},
{
  question_title: question2.title,
  question_id: question2.id,
  real_name: user1.real_name,
  user_id: user1.id,
  answer_content: answer4.content,
  answer_id: answer4.id,
  date: "2019-06-15"
},
{
  question_title: question2.title,
  question_id: question2.id,
  real_name: user2.real_name,
  user_id: user2.id,
  answer_content: answer5.content,
  answer_id: answer5.id,
  date: "2019-06-15"
},
{
  question_title: question2.title,
  question_id: question2.id,
  real_name: user3.real_name,
  user_id: user3.id,
  answer_content: answer5.content,
  answer_id: answer5.id,
  date: "2019-06-15"
},
{
  question_title: question3.title,
  question_id: question3.id,
  real_name: user1.real_name,
  user_id: user1.id,
  answer_content: answer6.content,
  answer_id: answer6.id,
  date: "2019-06-16"
},
{
  question_title: question3.title,
  question_id: question3.id,
  real_name: user2.real_name,
  user_id: user2.id,
  answer_content: answer6.content,
  answer_id: answer6.id,
  date: "2019-06-16"
},
{
  question_title: question3.title,
  question_id: question3.id,
  real_name: user3.real_name,
  user_id: user3.id,
  answer_content: answer7.content,
  answer_id: answer7.id,
  date: "2019-06-15"
}])
