class Todo < Menilite::Model
  field :description
  field :done, :boolean
  field :user, :reference

  permit :user_privilege
end
