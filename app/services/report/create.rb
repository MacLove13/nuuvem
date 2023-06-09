class Report::Create
  def initialize(user_id, data)
    @user_id = user_id
    @data = data
  end

  def now
    report = Report.create(user_id: @user_id)
    purchase_count = 0
    total_price = 0.0

    @data.each_with_index do |line, index|
      next if index == 0

      Report::Item.create(
        report_id:        report.id,
        purchaser_name:   line[0].to_s,
        item_description: line[1].to_s,
        item_price:       line[2].to_f,
        purchase_count:   line[3].to_i,
        merchant_address: line [4].to_s,
        merchant_name:    line[5].to_s
      )

      purchase_count += line[3].to_i
      total_price += line[2].to_f
    end

    report.update(
      purchase_count: purchase_count,
      total_price: total_price,
    )

    total_price
  end
end
