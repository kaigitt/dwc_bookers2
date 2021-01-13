class Batch::Hoge
  
  def self.users
    User.all.each do |u|
      puts "ID:#{u.id} NAME:#{u.name}"
    end
  end
end