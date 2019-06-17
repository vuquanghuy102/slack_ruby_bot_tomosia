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

Question.create!([{
  title: "Hôm nay bạn cảm thấy thế nào?"
},
{
  title: "Sếp bạn có đáng yêu không?"
},
{
  title: "Đòi sếp tăng lương?"
}])

Answer.create!([{
  content: "Khỏe lắm",
  question_id: "1"
},
{
  content: "Hơi khỏe thôi",
  question_id: "1"
},
{
  content: "Mệt",
  question_id: "1"
},
{
  content: "Siêu đáng yêu",
  question_id: "2"
},
{
  content: "Siêu đáng ghét",
  question_id: "2"
},
{
  content: "Tăng",
  question_id: "3"
},
{
  content: "Thôi",
  question_id: "3"
}])

User.create!([{
  email: "huy@gmail.com",
  real_name: "Huy",
  phone: "0123456789"
},
{
  email: "A@gmail.com",
  real_name: "A",
  phone: "0127584939"
},
{
  email: "B@gmail.com",
  real_name: "B",
  phone: "0123478939"
}])

Answesheet.create!([{
  question_title: "Hôm nay bạn cảm thấy thế nào?",
  question_id: "1",
  real_name: "Huy",
  user_id: "1",
  answer_content: "Khỏe lắm",
  answer_id: "1",
  date: "2019-06-14"
},
{
  question_title: "Hôm nay bạn cảm thấy thế nào?",
  question_id: "1",
  real_name: "A",
  user_id: "2",
  answer_content: "Hơi khỏe thôi",
  answer_id: "2",
  date: "2019-06-14"
},
{
  question_title: "Hôm nay bạn cảm thấy thế nào?",
  question_id: "1",
  real_name: "B",
  user_id: "3",
  answer_content: "Mệt",
  answer_id: "3",
  date: "2019-06-14"
},
{
  question_title: "Sếp bạn có đáng yêu không?",
  question_id: "2",
  real_name: "Huy",
  user_id: "1",
  answer_content: "Siêu đáng yêu",
  answer_id: "4",
  date: "2019-06-15"
},
{
  question_title: "Sếp bạn có đáng yêu không?",
  question_id: "2",
  real_name: "A",
  user_id: "2",
  answer_content: "Siêu đáng ghét",
  answer_id: "5",
  date: "2019-06-15"
},
{
  question_title: "Sếp bạn có đáng yêu không?",
  question_id: "2",
  real_name: "B",
  user_id: "3",
  answer_content: "Siêu đáng ghét",
  answer_id: "5",
  date: "2019-06-15"
},
{
  question_title: "Đòi sếp tăng lương?",
  question_id: "3",
  real_name: "Huy",
  user_id: "1",
  answer_content: "Tăng",
  answer_id: "6",
  date: "2019-06-16"
},
{
  question_title: "Đòi sếp tăng lương?",
  question_id: "3",
  real_name: "A",
  user_id: "2",
  answer_content: "Tăng",
  answer_id: "6",
  date: "2019-06-16"
},
{
  question_title: "Đòi sếp tăng lương?",
  question_id: "3",
  real_name: "B",
  user_id: "3",
  answer_content: "Thôi",
  answer_id: "7",
  date: "2019-06-15"
}])
