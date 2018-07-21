require "kansuji/version"

  NUMS_HASH = { 0 => "零", 1 => "一", 2 => "二", 3 => "三", 4 => "四", 5 => "五", 6 => "六", 7 => "七", 8 => "八", 9 => "九"}
  UNIT_HASH = { 10 ** 1 => "十", 10 ** 2 => "百", 10 ** 3 => "千"}
  EXP_HASH = { 10 ** 4  => '万', 10 ** 8 => "億", 10 ** 12 => "兆" , 10 ** 16 => "京", 10 ** 20 => "垓", 10 ** 24 => "𥝱", 10 ** 28 => "穣", 10 ** 32 => "溝", 10 ** 36 => "澗", 10 ** 40 => "正", 10 ** 44 => "載", 10 ** 48 => "極", 10 ** 52 => "恒河沙", 10 ** 56 => "阿僧祇", 10 ** 60 => "那由他", 10 ** 64 => "不可思議", 10 ** 68 => "無量大数", 10 ** 72 => "那由多" }
  class Numeric
    def to_kansuji rs = []
      return rs.join << NUMS_HASH[0] if self == 0 || self == ""
      reverse_array = self.to_s.reverse.split('').each_slice(4).reverse_each
      arr_size = reverse_array.size
      rs.join if reverse_array.each do | val |
        next (arr_size -= 1) if val.reverse.join().to_i == 0
        if val.reverse.join() != 0
          rs << val.reverse.join().to_i.group_f_to
          rs << EXP_HASH[10 ** (4 * (arr_size - 1))]
        end
        arr_size -= 1
      end
    end

    def group_f_to arr_input = self.to_s.split(''), curr = ''
      begin
        next if arr_input[0].to_i == 0
        return (curr += NUMS_HASH[arr_input[0].to_i].to_s) if arr_input.length == 1
        next (curr += UNIT_HASH[10**(arr_input.length-1)].to_s) if arr_input[0].to_i == 1 && arr_input[1] != 0
        curr += (NUMS_HASH[arr_input[0].to_i] + UNIT_HASH[10**(arr_input.length-1)]).to_s
      end while arr_input.slice!(0)
      curr
    end
  end

  class String
    def to_number result = 0, temp2 = []
      result = 0 if self == "零"
      EXP_HASH.each { |key, val|  self.sub!(val,'\&,') }
      temp1 = self.split(",")
      temp1.each { |num| temp2 << num.split(",") if EXP_HASH.each{ |key, val| num.sub!(val,',\&') }}
      return result if temp2.each do |num|
        ac_num = 0
        kan2num = 1
        kan2num = EXP_HASH.key(num[1]) if num[1]
        UNIT_HASH.each { |key, val| num[0].sub!(val,'\&,') }
        temp3 = num[0].split(",")
        (result += ac_num * kan2num) if temp3.each do |n|
            next (ac_num += (NUMS_HASH.key(n[0]).to_i) * (UNIT_HASH.key(n[1]))) if n[1]
            ac_num += NUMS_HASH.key(n[0]).to_i  + UNIT_HASH.key(n[0]).to_i
        end
      end
    end
  end
