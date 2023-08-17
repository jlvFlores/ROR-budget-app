# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@image_path = 'https://media.istockphoto.com/id/1135322593/es/vector/apertura-de-la-mano-cloche-de-plata.jpg?s=1024x1024&w=is&k=20&c=Tu_1Lj9SUXmxQzZhDjL7i6P9M23TYzg6_VubQyTG018='

@user = User.create(name: 'user', email: 'user@example.com', password: '123456')

@category = Category.create(user: @user, name: 'category', icon: @image_path)
@operation = Operation.create(author: @user, name: 'operation', amount: 100)

@operation_categories = OperationCategory.create(operation: @operation, category: @category)