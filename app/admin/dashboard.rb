ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    columns do
       columns do
            panel 'Recent Notes' do
                ul do
                    Note.order(created_at: :desc).first(5).map do |note|
                     li link_to(note.title, admin_note_path(note))
                    end
                end
            end
        end
        columns do
            panel 'Info' do
               para 'Welcome to your Note application.'
            end
        end
    end
    columns do
        columns do
            panel 'Your Subjects' do
                ul do
                    Subject.order(name: :asc).map do |subject|
                     li link_to(subject.name, admin_subject_path(subject))
                    end
                end
            end
        end
    end
  end # content
end
