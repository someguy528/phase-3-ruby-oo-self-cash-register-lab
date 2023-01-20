require "pry"
class CashRegister
    attr_accessor :total , :items , :price_list
    attr_reader :discount
    def initialize(discount=0.00)
        @total = 0 
        @discount = discount
        @items = []
        @price_list = []
    end
    def add_item(title, price, quantity = 1)
        quantity.times {|i| self.items.push(title)}
        self.price_list.push(price * quantity)
        self.total = @price_list.sum
    end
    def apply_discount
        if discount > 0
        self.total = (self.total * ( 1.00 - self.discount/100.00  )).round()
        "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
       
    def void_last_transaction
        # self.items.pop
        self.price_list.pop
        if self.price_list.length > 0 
            self.total = self.price_list.sum 
        else
            self.total = 0.0
        end
    end
end

# alternate solution
# class CashRegister

#     attr_accessor :items, :discount, :total, :last_transaction
  
#     def initialize(discount = 0)
#       @total = 0
#       @discount = discount
#       @items = []
#     end
  
#     def add_item(title, amount, quantity = 1)
#       self.last_transaction = amount * quantity
#       self.total += self.last_transaction
#       quantity.times do
#         self.items << title
#       end
#     end
  
#     def apply_discount
#       if self.discount != 0
#         discount_as_percent = (100.0 - self.discount.to_f) / 100
#         self.total = (self.total * discount_as_percent).to_i
#         "After the discount, the total comes to $#{self.total}."
#       else
#         "There is no discount to apply."
#       end
#     end
  
#     def void_last_transaction
#       self.total -= self.last_transaction
#     end
#   end