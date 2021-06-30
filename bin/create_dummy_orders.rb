Order.transaction do
    (1..15).each do |i|
        Order.create(:name => "quapro83", 
                     :address => "#{i} Da Nag",
                     :email => "customer_#{i}@gmail.com",
                     :pay_type => "Bank Card")
    end
end