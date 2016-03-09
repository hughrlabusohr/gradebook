json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :student_id, :email, :password_digest
  json.url teacher_url(teacher, format: :json)
end
