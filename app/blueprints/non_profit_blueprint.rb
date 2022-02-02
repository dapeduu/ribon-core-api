class NonProfitBlueprint < Blueprinter::Base
  identifier :id

  fields :updated_at, :created_at, :name, :wallet_address, :impact_description, :link

  field(:logo) do |object|
    ImagesHelper.image_url_for(object.logo)
  end

  field(:main_image) do |object|
    ImagesHelper.image_url_for(object.main_image)
  end

  field(:background_image) do |object|
    ImagesHelper.image_url_for(object.background_image)
  end

  field(:cover_image) do |object|
    ImagesHelper.image_url_for(object.cover_image)
  end
end
