def nyc_pigeon_organizer(pigeon_data)
  # write your code here!
  uniq_pigeons_array = pigeon_data.collect {|k,v| v.collect {|l,b| b}}.flatten.uniq
  attribute_types_array = pigeon_data.keys

  intermediate_hash = uniq_pigeons_array.collect do |pigeon|
      {pigeon => attribute_types_array.collect do |attribute_key|
        {attribute_key => pigeon_data[attribute_key].select {|k,v| v.include?(pigeon)}.keys.collect {|str| str.to_s}}
      end}
    end

  output_hash = Hash.new
  attrib_hash = Hash.new

  intermediate_hash.each do |pigeon|
  	pigeon.values.flatten.each {|k| attrib_hash.merge!(k)}
  	output_hash.merge!({pigeon.keys[0] => attrib_hash})
  	attrib_hash = {}
  end

  output_hash
end
