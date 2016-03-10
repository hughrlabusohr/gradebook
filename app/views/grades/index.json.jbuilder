json.array!(@grades) do |grade|
  json.extract! grade, :id, :assignment_name, :grade, :student_id, :assignment_date
  json.url grade_url(grade, format: :json)
end
