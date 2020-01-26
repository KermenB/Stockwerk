json.extract! project, :id, :title, :description, :author, :order, :main_img, :created_at, :updated_at
json.url project_url(project, format: :json)
