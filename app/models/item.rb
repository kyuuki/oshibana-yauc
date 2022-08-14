class Item < ApplicationRecord
  validates :number,
    presence: true
  validates :name,
    presence: true,
    length: { in: 1..40 }

  # ヤフオクの商品名
  def yauc_name
    "押し花素材 No.#{self.number}: #{name}"
  end

  # ヤフオクの説明
  def yauc_detail_html
    html = <<-"HTML"
「#{name}」の押し花素材になります。<BR>
乾燥剤をいれてお送りします。<BR>
<BR>
参考までに使用例を「<A HREF="https://goo.gl/fsegtD">押し花ブログ</A>」にて紹介させていただいております。<BR>
素材や使用方法について質問がありましたら、ブログのコメント欄でも受けて受けておりますので、お気軽にお問い合わせください。<BR>
<BR>
■発送方法</STRONG>
・定形外郵便（送料 120 円）<BR>
※複数同時に落札された場合は<B> 1 つ分の送料 120 円のみで結構です</B>。差分はこちらで負担させていただきます。<BR>
※家庭の事情で発送が遅れる場合もございますので、速達など急ぎで商品を必要とされる方は入札をご遠慮ください。<BR>
    HTML
  end
end
