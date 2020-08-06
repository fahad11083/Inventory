module TonsToner
  class PrintQueue
    def submit ( print_job )
      puts "send the job off for printing"
    end
      
    def cancel( print_job )
      puts " Stop the print job"
    end
  end

  class Administration
    def power_off
      puts "Turns this laser printer off"
    end
  
    def start_self_test
      puts "Test the laseer printer"
    end
  end
end
