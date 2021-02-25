require 'faker'

CATEGORIES = %w[одяг іграшки догляд транспорт дитяча].freeze
SUBCATEGORIES_CLOSE = %w[верхній взуття спортивний штани кофти рубашки сукні футболки купальники інше].freeze
SUBCATEGORIES_TOYS = %w[мякі розвиваючі конструктори пазли книжки радіокеровані машинки ляльки інше].freeze
SUBCATEGORIES_CARE = %w[столики ванночки горшки підгузники інше].freeze
SUBCATEGORIES_TRANSPORT = %w[машини біговели ходунки коляски автокрісла велосипеди ролики самокати інше].freeze
SUBCATEGORIES_CHILDRENS = %w[ліжечка манежі столики комоди шкафи інше].freeze
KINDS = %w[обміняю подарую].freeze

categories = CATEGORIES.map do |c|
  Category.create( { name: c } )
end
SUBCATEGORIES_CLOSE.map do |sc|
  Subcategory.create(
    {
      name: sc,
      category: categories[0]
    }
  )
end
SUBCATEGORIES_TOYS.map do |sc|
  Subcategory.create(
    {
      name: sc,
      category: categories[1]
    }
  )
end
SUBCATEGORIES_CARE.map do |sc|
  Subcategory.create(
    {
      name: sc,
      category: categories[2]
    }
  )
end
SUBCATEGORIES_TRANSPORT.map do |sc|
  Subcategory.create(
    {
      name: sc,
      category: categories[3]
    }
  )
end
SUBCATEGORIES_CHILDRENS.map do |sc|
  Subcategory.create(
    {
      name: sc,
      category: categories[4]
    }
  )
end

products = 1000.times.map do
  category = categories.sample
  Product.create(
    {
      name: Faker::Commerce.product_name,
      category: category,
      subcategory: category.subcategories.to_a.sample,
      description: Faker::Markdown.emphasis,
      kind: KINDS.sample
    }
  )
end