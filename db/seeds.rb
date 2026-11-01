guest = User.find_or_create_by!(email: "guest@example.com") do |user|
  user.password = "guestpassword123"
  user.password_confirmation = "guestpassword123"
end

customer_data = [
  { name: "佐藤 美咲", phone: "090-0000-0001", email: "misaki.sato@example.com" },
  { name: "鈴木 健", phone: "090-0000-0002", email: "ken.suzuki@example.com" },
  { name: "田中 葵", phone: "090-0000-0003", email: "aoi.tanaka@example.com" }
]

customers = {}
customer_data.each do |data|
  customer = Customer.find_or_create_by!(email: data[:email]) do |record|
    record.name = data[:name]
    record.phone = data[:phone]
  end
  customers[data[:email]] = customer
end

history_data = [
  {
    email: "misaki.sato@example.com",
    type: "受電",
    history: "蓄電池アプリの初期設定について問い合わせ。設定手順を案内した。",
    days_ago: 0,
    hour: 10
  },
  {
    email: "misaki.sato@example.com",
    type: "架電",
    history: "初期設定後の動作確認のため連絡。正常に利用できることを確認した。",
    days_ago: 1,
    hour: 14
  },
  {
    email: "ken.suzuki@example.com",
    type: "受電",
    history: "太陽光発電の発電量表示について問い合わせ。確認方法を案内した。",
    days_ago: 2,
    hour: 11
  },
  {
    email: "ken.suzuki@example.com",
    type: "受電",
    history: "停電時の蓄電池の動作について質問。取扱説明書の確認箇所を案内した。",
    days_ago: 3,
    hour: 15
  },
  {
    email: "aoi.tanaka@example.com",
    type: "架電",
    history: "点検日程について連絡。希望日を確認し、担当部署への引き継ぎを案内した。",
    days_ago: 4,
    hour: 13
  },
  {
    email: "aoi.tanaka@example.com",
    type: "受電",
    history: "製品の保証期間について問い合わせ。保証内容の確認方法を説明した。",
    days_ago: 5,
    hour: 16
  }
]

history_data.each do |data|
  Interaction.find_or_create_by!(
    customer: customers.fetch(data[:email]),
    user: guest,
    history: data[:history]
  ) do |interaction|
    interaction.interaction_type = data[:type]
    interaction.occurred_at = data[:days_ago].days.ago.change(
      hour: data[:hour],
      min: 0,
      sec: 0
    )
  end
end

puts "サンプル顧客3件・対応履歴6件を準備しました。"
