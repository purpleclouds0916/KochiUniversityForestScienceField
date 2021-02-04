User.create!(name:  "Example User",
             email: "test@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# 追加のユーザーをまとめて生成する
12.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@test.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

Tag.create([
  { name: 'スライダー' },
  { name: '森林を学ぶ価値' },
  { name: '森林科学領域' },
  { name: '先生の紹介' },
  { name: '授業の紹介' },
  { name: '卒業生の声' },
  { name: '資格' },
  { name: '先生の紹介動画' }
])

users = User.order(:created_at).take(6)
filenames = Dir.open("db/fixtures/",&:to_a)
10.times do
  users.each do |user|
    name  = Faker::Name.name
    birthplace = Faker::Address.city
    job = Faker::Company.name
    sentence1 = Faker::Lorem.sentence(word_count: 2)
    sentence2 = Faker::Lorem.sentence(word_count: 3)
    sentence3 = Faker::Lorem.sentence(word_count: 8)
    sentence4 = Faker::Lorem.sentence(word_count: 100)
    sentence5 = Faker::Lorem.sentence(word_count: 100)
    sentence6 = Faker::Lorem.sentence(word_count: 100)
    sentence7 = Faker::Lorem.sentence(word_count: 100)
    sentence8 = Faker::Lorem.sentence(word_count: 100)
    filename = filenames[5..32].shuffle.first
 file_path = "db/fixtures/#{filename}"
    
    user.posts.create!(tag_id: '6',
      name:name, birthplace: birthplace, job:job, research_field:sentence1, research_office:sentence2,
      reason:sentence4, learning:sentence5, job_description: sentence6, memories:sentence7, original_title:sentence3, original_content:sentence8
    ).images.attach(io: File.open("#{file_path}"),
    filename: "fixtures/#{filename}")
end
end

# Post.create {[
#     {title: nil, content: "技術者として「基本測量（すべての測量の基礎となる測量）」、「公共測量（国又は地方公共団体の実施する測量）」に従事するために必要な国家資格です。 測量士は、「測量に関する計画を作製し、又は実施する者」、 測量士補は、「測量士の作製した計画に従い、測量に従事する者」を指します。測量士補の資格取得後、1年以上の実務経験により測量士に昇格が可能です。", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: "測量士補", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: "https://www.gsi.go.jp/LAW/SHIKEN-sikentoroku.html", teacher_url: nil, url_references: "測量士及び測量士補登録に関する案内 | 国土地理院", lead: nil, tag_id: 7},
#     {title: nil, content: "樹木医とは、樹木の診断・治療、後継樹の保護育成、樹木保護などに関する知識の普及や指導を行う専門家のこと。 樹木医補は、樹木医を目指して樹木学や植物病理学、森林生態学などの基礎的な知識や技術を習得した学生を対象に認定を行ってます。高知大学は樹木医補資格養成機関として認定を受けています。全国で35ある認定大学のうち、四国では高知大学と愛媛大学が対象となっています。（令和2年4月現在）。", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: "樹木医補", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: "http://www.jpgreen.or.jp/jyumokuiho/", teacher_url: nil, url_references: "樹木医補資格認定制度／（一財）日本緑化センター", lead: nil, tag_id: 7},
#     {title: nil, content: "森林情報士とは、空中写真やリモートセンシングからの情報の解析技術、GIS技術等をもちいて森林計画、治山、林道事業、さらには地球温暖化問題の解析などの事業分野に的確に対応できる専門技術者です。 2級は、森林系の大学専門課程修得１年以上、学士、修士、博士など森林・林業に関する資格を有する者を対象としています。高知大学は森林情報士2級養成機関として認定を受けています。全国で7つある認定大学のうち、四国では高知大学のみとなっています（令和2年4月現在）。", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: "森林情報士二級", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: "http://www.jafta.or.jp/contents/jouhoushi/5_list_detail.html", teacher_url: nil, url_references: "一般社団法人日本森林技術協会 Japan Forest Technology Association 森林情報士 大学単位認定制度", lead: nil, tag_id: 7},
#     {title: nil, content: "教員になるための資格です。学校種ごとの教員免許状が必要で、中学校・高等学校は教科ごとの免許状になります。\r\n\t\t\t\t\t\t\t取得要件の違いにより、専修免許状、一種免許状、二種免許状と区分されますが、職務上の差異はありません。", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: "教員免許", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: "", teacher_url: nil, url_references: "", lead: nil, tag_id: 7},
#     {title: nil, content: "学芸員とは、博物館（美術館、歴史民俗資料館、国際交流館、産業資料館、農林業資料館、文書館、文学館、水族館、動・植物園、地質館、各種記念館等）において、資料収集、展示、保存、調査研究、生涯教育、社会教育活動等の専門的活動に携わる職員の総称になります。", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: "学芸員", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: "", teacher_url: nil, url_references: "", lead: nil, tag_id: 7},
#     {title: nil, content: nil, user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: "http://www.kochi-u.ac.jp/agrimar-skg/movie/teachers.mp4", external_url: nil, teacher_url: nil, url_references: nil, lead: nil, tag_id: 8},
#     {title: nil, content: "高知大学森林領域では、地球環境問題、資源問題、エネルギー問題の解決及び自然共生型社会の構築ができる力を学べます。<br><br>なぜなら、高知大学では、生物学だけではなく<span class=\"text__important\">統計学、工学、経済学といった幅広い分野を学習</span>することで、森林の様々な役割（二酸化炭素の吸収・固定、災害防備、空気浄化、林産物の供給etc...）を理解し、さらに、<span class=\"text__important\">卒業研究を通して、応用・発展</span>させることができるからです。\r\n\t\t\t\t\t\t<br><br>また、高知大学では、<span class=\"text__important\">問題の発見能力と解決能力を養うために、実習・演習を重視した授業</span>を行っています。<br><br>だからこそ、森林領域では、<span class=\"text__important\">地球環境問題、資源問題、エネルギー問題の解決及び自然共生型社会の構築ができる力</span>が身につくのです", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: "http://www.kochi-u.ac.jp/agrimar-skg/movie/lesson.mp4", external_url: nil, teacher_url: nil, url_references: nil, lead: nil, tag_id: 5},
#     {title: nil, content: "森林を構成する多様な樹木は、それぞれ様々な個性を持ち、厳しい自然界の競争に打ち勝って今日存在しています。私の研究室では、日本や東南アジアの森林に生育する樹木の個性を森林生態学や生理生態学の観点からひも解き、それを森林の保全や生態系修復・再生に活かす研究に取り組んでいます。", user_id: 1, birthplace: nil, job: "教授", research_office: nil, research_field: nil, name: "市栄 智明", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: nil, teacher_url: "", url_references: nil, lead: nil, tag_id: 4},
#     {title: nil, content: "森林や山の自然に素朴に憧れて森林科学を学ぼうと大学に進学し、山と共に生きる林業技術者のすばらしさに触れ、林業工学（森林利用学）を専門としています。\r\n高知には全国一の先進的林業技術と活気ある現場が多数あり、見学や実習でこれからの森林・林業を学ぶには最適の場所です。", user_id: 1, birthplace: nil, job: "教授", research_office: nil, research_field: nil, name: "鈴木 保志", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: nil, teacher_url: "http://www.cc.kochi-u.ac.jp/~ysuzuki/", url_references: nil, lead: nil, tag_id: 4},
#     {title: nil, content: "木材は、マテリアルとしての機能およびエネルギーとしての機能を提供しています。その中で、紙パルプ分野の中心材料であるセルロースの研究を行っています。\r\n具体的には、紙の機能化、紙おむつのリサイクル、さらにはプラスチック代替材料の研究による社会貢献を目指ています。", user_id: 1, birthplace: nil, job: "准教授", research_office: nil, research_field: nil, name: "市浦 英明", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: nil, teacher_url: "http://www.cc.kochi-u.ac.jp/~ichiura/woodchem/ichiura/ichiurahome.html", url_references: nil, lead: nil, tag_id: 4},
#     {title: nil, content: "持続可能な社会への転換が急務な今、木質資源は再生産可能な資源として注目を浴びています。この木質資源を社会が活用していくためには、森林からの安定的な木材供給の仕組みづくり、育林・伐採・加工・流通を支える社会づくりが必要になります。私は、林業・林産業を題材にしつつ、社会構造や産業構造の分析、各種政策の影響評価等を行い、森林と人とのより良い関係づくりに取り組んでいます。", user_id: 1, birthplace: nil, job: "講師", research_office: nil, research_field: nil, name: "松本 美香", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: nil, teacher_url: "http://www.cc.kochi-u.ac.jp/~matsumoto-mika/", url_references: nil, lead: nil, tag_id: 4},
#     {title: nil, content: "森林を持続的に管理・利用していくために、どのようなスケジュールで間伐などの森林の手入れをするかといった問題を主に扱っています。\r\nまた、森林の管理を行っていくために必要な情報の収集方法や長期的な計画の立て方といった、森林の持続的利用に関連するさまざまな課題を併せて扱っています。\r\n", user_id: 1, birthplace: nil, job: "講師", research_office: nil, research_field: nil, name: "守口海", reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: nil, teacher_url: "https://kfplab.wordpress.com/home/", url_references: nil, lead: nil, tag_id: 4},
#     {title: nil, content: "高知県は雨が非常に多く、木が成長するためにはとても良い環境です。<br><br><span class=\"text__important\">それもあって、高知県の森林率は全国1位の83.4%！</span><br><br>大学から出てすぐが、実習のフィールドです。<span class=\"text__important\">豊かな自然に囲まれた場所で、生態系や持続的な社会についてじっくり学ぶことができます。</span><br><br>また、高知県は昔から林業が非常に栄えており、今なお、その歴史を受け継いでいます。<br><br>そのため、<span class=\"text__important\">行政機関や企業と連携し、地域の人たちと関わりながら林業を学ぶことができます。</span>\r\n\t\t\t\t\t", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: "http://www.kochi-u.ac.jp/agrimar-skg/movie/What-is-a-forest-area.mp4", external_url: nil, teacher_url: nil, url_references: nil, lead: nil, tag_id: 3},
#     {title: "木材は再生可能資源", content: "近年、木のストローの導入やレジ袋の有料化など、プラスチック製品を廃止する動きが強まっています。\r\nさらに、プラスチックの原料となる石油は将来的には枯渇してしまう化石資源です。\r\n持続的な経済発展をしていくためにも、木材のような再生可能資源の積極的な利用の推進、及び研究が必要不可欠です。", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: "", teacher_url: nil, url_references: "", lead: nil, tag_id: 2},
#     {title: "森林は生物の宝庫", content: "世界の陸地面積の約３割を占める森林に、<span class=\"text__important\">陸上の生物種の約８割がその生息・生育を依存</span>しています。<br><br>しかし、1990～2015年までの過去25年間において森林面積は、1.29億haも減少しました。<span class=\"text__important\"> 豊かな生態系を守っていくためにも、持続的な森林利用を考えていく必要</span>があります。", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: "https://www.rinya.maff.go.jp/j/kaigai/attach/pdf/index-2.pdf", teacher_url: nil, url_references: "森林は生物の宝庫:世界森林資源評価（FRA）２０１５-世界の森林はどのように変化しているか", lead: nil, tag_id: 2},
#     {title: "環境資源としての価値は年間70兆円", content: "森林は降った雨を蓄え、浄化をしながら少しずつ川に流します。そして、水と一緒に、たくさんの栄養が、川や海、そして農地に流れます。それにより、魚はもちろん豊かな農作物の生産にも繋がります。\r\nそれ以外にも、森林にはレクリエーションの役割から、キノコや木材の生産など多様な機能があります。そして、これらの機能を経済的価値に換算すると、年間70兆円にもなると言われています。\r\nつまり、豊かな森林を守ることは、私達の豊かな生活を守ることにもつながるのです。", user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: "https://www.maff.go.jp/j/kanbo/kankyo/seisaku/s_senryaku/seibutu_tayo/14/pdf/siryo1-2.pdf", teacher_url: nil, url_references: "森林における生物多様性の保全及び 持続可能な利用の推進方策・平成２１年７月 森林における生物多様性保全の推進方策検討会", lead: nil, tag_id: 2},
#     {title: "木材は再生可能資源", content: nil, user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: nil, teacher_url: nil, url_references: nil, lead: "持続的な社会の構築に木材は必要不可欠です", tag_id: 1},
#     {title: "森林は生物の宝庫", content: nil, user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: nil, teacher_url: nil, url_references: nil, lead: "森林は生態系の保全に重要な役割を担っています", tag_id: 1},
#     {title: "森林の多面的機能", content: nil, user_id: 1, birthplace: nil, job: nil, research_office: nil, research_field: nil, name: nil, reason: nil, learning: nil, job_description: nil, memories: nil, original_title: nil, original_content: nil, video_url: nil, external_url: nil, teacher_url: nil, url_references: nil, lead: "CO2の吸収、空気の浄化など森林には様々な機能があります", tag_id: 1},
# ]}


