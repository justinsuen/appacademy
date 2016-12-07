Cat.destroy_all
Cat.create(birth_date: "2015/01/16", color: "black", name: "Carl", sex: "F", description: "She's a cat")
Cat.create(birth_date: "2015/03/20", color: "black", name: "Justin", sex: "F", description: "She's a cat")
Cat.create(birth_date: "2013/01/20", color: "black", name: "Alice", sex: "F", description: "She's a cat")
Cat.create(birth_date: "2015/02/24", color: "white", name: "Joyce", sex: "F", description: "She's a cat")
Cat.create(birth_date: "2010/01/15", color: "white", name: "Sam", sex: "M", description: "He's a cat")
Cat.create(birth_date: "2014/12/01", color: "white", name: "Lebron", sex: "M", description: "He's a cat")
Cat.create(birth_date: "2012/08/24", color: "white", name: "Kobe", sex: "M", description: "He's a cat")

CatRentalRequest.destroy_all
CatRentalRequest.create(cat_id: 6, start_date: "2015/09/24", end_date: "2015/10/02")
CatRentalRequest.create(cat_id: 6, start_date: "2016/08/24", end_date: "2016/08/02") #this should fail
CatRentalRequest.create(cat_id: 6, start_date: "2016/09/24", end_date: "2016/10/02")
CatRentalRequest.create(cat_id: 6, start_date: "2016/09/22", end_date: "2016/09/28")
