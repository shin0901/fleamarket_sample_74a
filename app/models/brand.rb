class Brand < ActiveHash::Base
  self.data = [
    { id: 1, name: "Louis Vuitton / ルイ・ヴィトン" },
    { id: 2, name: "HERMES / エルメス" },
    { id: 3, name: "CHANEL / シャネル" },
    { id: 4, name: "Dior / ディオール" },
    { id: 5, name: "SAINT LAURENT / サンローラン" },
    { id: 6, name: "GUCCI / グッチ" },
    { id: 7, name: "PRADA / プラダ" },
    { id: 8, name: "MIU MIU / ミュウミュウ" },
    { id: 9, name: "FENDI / フェンディ" },
    { id: 10, name: "Cartier / カルティエ" },
    { id: 11, name: "Tiffany / ティファニー" },
    { id: 12, name: "BVLGARI / ブルガリ" },
    { id: 13, name: "Christian louboutin / ルブタン" },
    { id: 14, name: "Jimmy Choo / ジミーチュウ" },
    { id: 15, name: "Manolo Blahnik / マノロ・ブラニク" },
    { id: 16, name: "Salvatore Ferragamo / フェラガモ"},
    { id: 17, name: "COACH / コーチ"},
    { id: 18, name: "BURBERRY / バーバリー"},
    { id: 19, name: "BALENCIAGA / バレンシアガ"},
    { id: 20, name: "Chloe / クロエ"},
    { id: 21, name: "CELINE / セリーヌ"},
    { id: 22, name: "LOEWE / ロエベ"},
    { id: 23, name: "Giorgio Armani / アルマーニ"},
    { id: 24, name: "Dolce＆Gabbana / ドルガバ"},
    { id: 25, name: "Stella McCartney / ステラ"},
    { id: 26, name: "Valentino / ヴァレンティノ"},
    { id: 27, name: "TORYBURCH / トリーバーチ"},
    { id: 28, name: "MICHAEL KORS / マイケルコース"},
    { id: 29, name: "LONGCHAMP / ロンシャン"},
    { id: 30, name: "FURLA / フルラ"},
    { id: 31, name: "UNIQLO / ユニクロ"},
    { id: 32, name: "MUJI / 無印良品"}

  ]
  include ActiveHash::Associations
  has_many :products

end
