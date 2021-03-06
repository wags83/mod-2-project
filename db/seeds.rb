
User.all.each { |user| user.destroy} 
Portfolio.all.each { |p| p.destroy} 
Investment.all.each { |i| i.destroy} 
Comment.all.each { |i| i.destroy} 


10.times do |i| 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Kpop.girl_groups, email: Faker::Internet.email, password: "a")
end
# user2 = User.create(first_name: "John", last_name: "Block", username: "JohnB", email: "JohnB@yahoo.com", password: "a")
# user3 = User.create(first_name: "Rick", last_name: "Sanchez", username: "RSanchez", email: "Rick.Sanchez@rickandmorty.com", password: "a")
# user4 = User.create(first_name: "Morty", last_name: "Smith", username: "Morty", email: "Morty@gmail.com", password: "a")
# user5 = User.create(first_name: "Summer", last_name: "Smith", username: "S.Smith", email: "Summer@gmail.com.com", password: "a")

20.times do |i|
    cash = rand(10000..100000)
    Portfolio.create(portfolio_name: Faker::Games::Pokemon.name, initial_cash: cash, current_cash: cash, user_id: User.all.sample.id)
end


# portfolio1 = Portfolio.create(portfolio_name: "Aggressive", initial_cash: 10000, current_cash: 10000, user_id: User.all.sample.id)
# portfolio2 = Portfolio.create(portfolio_name: "Conservative", initial_cash: 100000, current_cash: 100000, user_id: User.all.sample.id)
# portfolio3 = Portfolio.create(portfolio_name: "High Yield", initial_cash: 20000, current_cash: 20000, user_id: User.all.sample.id)
# portfolio4 = Portfolio.create(portfolio_name: "Bond", initial_cash: 10000, current_cash: 10000, user_id: User.all.sample.id)
# portfolio5 = Portfolio.create(portfolio_name: "Aggressive", initial_cash: 50000, current_cash: 50000, user_id: User.all.sample.id)
# portfolio6 = Portfolio.create(portfolio_name: "Conservative", initial_cash: 40000, current_cash: 40000, user_id: User.all.sample.id)
# portfolio7 = Portfolio.create(portfolio_name: "Aggressive", initial_cash: 10000, current_cash: 10000, user_id: User.all.sample.id)
# portfolio8 = Portfolio.create(portfolio_name: "Conservative", initial_cash: 125000, current_cash: 125000, user_id: User.all.sample.id)
# portfolio9 = Portfolio.create(portfolio_name: "Bond", initial_cash: 25000, current_cash: 25000, user_id: User.all.sample.id)
# portfolio10 = Portfolio.create(portfolio_name: "High Yield", initial_cash: 10000, current_cash: 10000, user_id: User.all.sample.id)
Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-01-01",portfolio_id: Portfolio.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-02-01",portfolio_id: User.all.sample.id, num_shares: 30)
 Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-03-01",portfolio_id: User.all.sample.id, num_shares: 25)
 Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 20)
Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-02-01",portfolio_id: User.all.sample.id, num_shares: 30)
 Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-05-01",portfolio_id: User.all.sample.id, num_shares: 25)
Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-06-01",portfolio_id: User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-08-01",portfolio_id: User.all.sample.id, num_shares: 30)
Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 25)
Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-02-01",portfolio_id: User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-02-01",portfolio_id: User.all.sample.id, num_shares: 30)
 Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 25)
 Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 30)
 Investment.create(symbol:  "G", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 25)
 Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 30)
Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 25)
Investment.create(symbol: "C", purchase_price: 100, current_price: 80, purchase_date: "2020-01-01",portfolio_id:  User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "GE", purchase_price: 100, current_price: 95, purchase_date: "2020-01-01",portfolio_id:  User.all.sample.id, num_shares: 30)
 Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-01-01",portfolio_id: Portfolio.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-02-01",portfolio_id: User.all.sample.id, num_shares: 30)
 Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-03-01",portfolio_id: User.all.sample.id, num_shares: 25)
 Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 20)
Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-02-01",portfolio_id: User.all.sample.id, num_shares: 30)
 Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-05-01",portfolio_id: User.all.sample.id, num_shares: 25)
Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-06-01",portfolio_id: User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-08-01",portfolio_id: User.all.sample.id, num_shares: 30)
Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 25)
Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-02-01",portfolio_id: User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-02-01",portfolio_id: User.all.sample.id, num_shares: 30)
 Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 25)
 Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 30)
 Investment.create(symbol:  "G", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 25)
 Investment.create(symbol: "MSFT", purchase_price: 90, current_price: 80, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "AAPL", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 30)
Investment.create(symbol: "G", purchase_price: 85, current_price: 95, purchase_date: "2020-01-01",portfolio_id: User.all.sample.id, num_shares: 25)
Investment.create(symbol: "C", purchase_price: 100, current_price: 80, purchase_date: "2020-01-01",portfolio_id:  User.all.sample.id, num_shares: 20)
 Investment.create(symbol: "GE", purchase_price: 100, current_price: 95, purchase_date: "2020-01-01",portfolio_id:  User.all.sample.id, num_shares: 30)


20.times do |i|
Comment.create(title: Faker::Marketing.buzzwords, content: Faker::TvShows::SiliconValley.quote, user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
end
# Comment.create(title: "Sick portfolio broham1", content: "Bbbbbb", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham2", content: "Ccccc", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham3", content: "Dcccdd", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham4", content: "Eeeee", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham5", content: "Ffffefe", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham6", content: "Gggge", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham7", content: "HHhhhh", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham8", content: "Iiiiiii", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham9", content: "Jjjjj", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham10", content: "K", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham11", content: "AaaaaaaaaaaaaaaLllllkjaaaaaaaaaa", user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)
# Comment.create(title: "Sick portfolio broham12", content: Faker::TvShows::SiliconValley.quote, user_id: User.all.sample.id, portfolio_id: Portfolio.all.sample.id)

