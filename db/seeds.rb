# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "f@f",
    password: "aaaaaa"
)

Customer.create!(
    last_name: "山田",
    first_name: "花子",
    last_name_kana: "ヤマダ",
    first_name_kana: "ハナコ",
    email: "p@p",
    post_code: "12345678",
    address: "テスト",
    phone_number: "654876",
    password: "pppppp",
    is_withdraw: false
)

Genre.create!(
    name: "ケーキ"
)

Genre.create!(
    name: "プリン"
)

Genre.create!(
    name: "焼き菓子"
)

Genre.create!(
    name: "キャンディ"
)

Item.create!(
    genre_id: 1,
    name: "イチゴのショートケーキ",
    description: "イチゴのショートケーキです",
    without_tax_price: 600,
    is_sale: true
)

Item.create!(
    genre_id: 1,
    name: "オリジナルショートケーキ",
    description: "オリジナルショートケーキです",
    without_tax_price: 3000,
    is_sale: true
)
Item.create!(
    genre_id: 2,
    name: "抹茶のプリン",
    description: "抹茶のプリンです",
    without_tax_price: 800,
    is_sale: true
)

Item.create!(
    genre_id: 3,
    name: "瀬戸内レモンのマドレーヌ",
    description: "瀬戸内レモンのマドレーヌです",
    without_tax_price: 200,
    is_sale: true
)

Item.create!(
    genre_id: 4,
    name: "抹茶のキャンディ",
    description: "抹茶のキャンディです",
    without_tax_price: 100,
    is_sale: true
)

Item.create!(
    genre_id: 4,
    name: "チョコレートのキャンディ",
    description: "チョコレートのキャンディです",
    without_tax_price: 100,
    is_sale: false
)