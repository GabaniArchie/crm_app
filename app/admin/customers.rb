ActiveAdmin.register Customer do
  permit_params :full_name, :phone, :email, :notes, :image

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone
      f.input :email
      f.input :notes
      f.input :image, as: :file  # File input for image uploads
    end
    f.actions
  end

  # To show the image in the show view
  show do
    attributes_table do
      row :full_name
      row :phone
      row :email
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image)
        else
          "No image uploaded"
        end
      end
    end
    active_admin_comments
  end
end
