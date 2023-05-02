# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product_categories = [
  "ropa",
  "calzado",
  "tecnología",
  "hogar",
  "jardín",
  "belleza",
  "cuidado personal",
  "alimentos",
  "bebidas",
  "deportes",
  "fitness",
  "juguetes",
  "entretenimiento",
  "viajes",
  "turismo",
  "automóviles",
  "motocicletas",
  "mascotas",
  "salud",
  "oficina",
  "manualidades",
  "bebés",
  "niños",
  "libros",
  "revistas",
  "cuidado del hogar",
  "muebles",
  "decoración",
  "joyería",
  "relojes",
  "equipamiento deportivo",
  "instrumentos musicales",
  "oroductos exteriores",
  "camping",
  "herramientas",
  "mejoras hogar",
  "fiestas",
  "eventos",
  "limpieza",
  "equipamiento",
  "viajes",
  "vacaciones",
  "cocina",
  "papelería",
  "construcción",
  "barba",
  "cuidado facial",
  "cabello",
  "dental",
  "piel",
  "maquillaje",
  "suplementos",
  "aromaterapia"
]
product_categories.each { |cat_name| Category.create(name: cat_name)}

if Rails.env.development?
  Admin.create(email: 'user_0@gmail.com',
               password: '123456',
               password_confirmation: '123456',
               name: Faker::Name.first_name , last_name: Faker::Name.middle_name  )
  5.times do
    Provider.create(name: Faker::Company.name,
                    phone: Faker::PhoneNumber.cell_phone,
                    address: Faker::Address.full_address,
                    contact: Faker::Name.name,
                    )
  end
  # Provider.all.each do |provider|
  #   2.times do
  #     random_sample = [1,2,3].sample
  #     tag = product_categories.sample(random_sample)
  #     product = Product.new(name: Faker::Commerce.product_name,
  #                             provider_id: provider.id,
  #                             description: Faker::Lorem.paragraph,
  #                             tag_list: tag
  #                             )
  #     if product.tag_list.present? && product.save
  #     price = Faker::Commerce.price
  #     InventoryPurchase.create(product_id: product.id,
  #                              purchase_price: price,
  #                              stock_quantity: [2,4,5].sample,
  #                              selling_price: price + 5)
  #     end
  #   end
  # end




end