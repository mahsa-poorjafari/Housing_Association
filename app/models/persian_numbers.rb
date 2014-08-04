module PersianNumbers 
  def persian_numbers(*args)
    args.each do |arg|
      define_method "#{arg.to_s}=" do |str|
        str=str.to_english
        super(str)
      end
    end    
  end 

  def persian_dates(*args)

    args.each do |arg|
      define_method "#{arg.to_s}_fa=" do |str|
        if str.class == String
          str = str.to_english
          if(/^\d\d\d\d.(\d\d|\d).(\d\d|\d)$/.match str)
            dl = str.to_english.split("/")
            fa_date = JalaliDate.new(dl[0].to_i,dl[1].to_i,dl[2].to_i)

            self.try("#{arg}=",fa_date.to_gregorian ) 
            self.try("#{arg}")
          end     
        end  
      end  

      define_method "#{arg.to_s}_fa" do
        JalaliDate.new(self.try(arg.to_s)) if self.try(arg.to_s).present?
      end
    end
  end 

end
