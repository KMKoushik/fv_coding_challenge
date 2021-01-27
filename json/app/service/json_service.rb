class JsonService
  def initialize(json_a, json_b)
    @json_a = json_a
    @json_b = json_b
  end

  def compare
    compare_object(@json_a, @json_b).round 2
  end

  def keys(json_one, json_two)
    key_arr = json_one.keys
    json_two.keys.each do |b_key|
      key_arr.push b_key unless key_arr.include?(b_key)
    end

    key_arr
  end

  def compare_object(json_one, json_two)
    total = 0
    correct = 0
    keys(json_one, json_two).each do |key|
      total += 1
      if json_one[key].is_a?(Array) && json_two[key].is_a?(Array)
        correct += compare_array(json_one[key], json_two[key])
      elsif json_one[key].is_a?(Hash) && json_two[key].is_a?(Hash)
        correct += compare_object(json_one[key], json_two[key])
      elsif json_one[key] == json_two[key]
        correct += 1
      end
    end

    correct.to_f / total
  end

  def compare_array(arr_1, arr_2)
    total = 0
    correct = 0
    len = arr_1.length > arr_2.length ? arr_1.length : arr_2.length
    for i in (0..(len - 1))
      total += 1
      if arr_1[i].is_a?(Hash) && arr_2[i].is_a?(Hash)
        correct += compare_object(arr_1[i], arr_2[i])
      elsif arr_1[i] == arr_2[i]
        correct += 1
      end
    end

    correct.to_f / total
  end
end