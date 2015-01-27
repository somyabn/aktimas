def csvfileProcess(file)
	productfile=file
 product=CSV.read(productfile, headers:true) 
 return product
end

