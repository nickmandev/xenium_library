ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

       column do
         panel "Info" do
           para "Welcome to Library."
         end
       end
     end
  end
end

ActiveAdmin.register Book do
  sidebar "Reviews", only: [:edit] do
    ul do
     li link_to "Make a review", new_admin_book_review_path(params[:id])
    end
  end
  permit_params :title, :description, :isbn, :picture
    form do |f|
      f.inputs "Book Details" do
        f.input :title
        f.input :description
        f.input :isbn
        f.input :picture
      end
      f.submit :Submit
    end
end

ActiveAdmin.register Review do
  permit_params :text, :rating, :book_id
  belongs_to :book
end


