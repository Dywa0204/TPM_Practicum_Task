class Groceries {
  String name;
  String description;
  String price;
  String stock;
  String discount;
  String storeName;
  String productUrl;
  List<String> productImageUrls;
  String reviewAverage;

  Groceries({
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.discount,
    required this.storeName,
    required this.productUrl,
    required this.productImageUrls,
    required this.reviewAverage
  });
}

var groceryList = [
  Groceries(
      name: 'Morinaga Chil Kid 3 Vanila 800g',
      description: "Morinaga Chil Kid Platinum Vanila 800g Susu Formula Pertumbuhan Anak Usia 1-3 Tahun \nMorinaga Chil Kid Platinum MoriCare+ Triple Bifidus susu pertumbuhan untuk Si Kecil di usia 1 – 3 tahun. Memiliki Inovasi Unggulan yang mengandung Moricare Zigma berupa sinergi nutrisi antara faktor Kecerdasan Multitalenta (alfa laktalbumin, AA DHA, Kolin, Fosfolipid, Zat Besi, Omega 3 & Omega 6), faktor Pertahanan Tubuh (Triple Bifidus, Nukleotida & Serat GOS) dan faktor Tumbuh Kembang Optimal (Magnesium, Vitamin D, Kalsium, Vitamin & Mineral) dengan Formula Disempurnakan untuk mendukung Si Kecil meraih mimpi besarnya sejak dini karena #WaktuTakBisaKembali.",
      price: "252.000",
      stock: "178",
      discount: "7%",
      storeName: "Morinaga Official Shop",
      productUrl: "https://www.tokopedia.com/morinagaofficial/chil-kid-platinum-moricare-vanilla-800gr",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/8/23/6422ccd9-32e9-441b-9321-8eecf9d1c2c8.jpg",
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/8/23/562f2c0f-e608-4331-affb-e3abc984cddb.jpg",
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/8/23/deb32904-d36c-4bbf-8f37-ded3e0ea864d.jpg",
      ],
      reviewAverage: "5"
  ),
  Groceries(
      name: 'ROMA Sari Gandum Family Pack [240 g]',
      description: "Roma Sari Gandum merupakan biskuit yang terbuat dari gandum pilihan. Biskuit ini juga mengandung susu bergizi, membuatnya lezat dan sehat. Nikmati biskuit bersama teh di sore hari dapat mencerahkan hari Anda. Kemasan Family Pack 240 gr.",
      price: "12.000",
      stock: "79",
      discount: "0%",
      storeName: "Mayora Official Store",
      productUrl: "https://tokopedia.link/oScHIGU5Ptb",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2021/10/15/41b8886a-0ce0-43b6-8706-7d2809664a6a.jpg",
        "https://images.tokopedia.net/img/cache/900/product-1/2020/4/10/3150060/3150060_c8baa490-0b5b-4ceb-80ef-d018cdc86556.jpg",
        "https://images.tokopedia.net/img/cache/900/product-1/2020/4/10/3150060/3150060_8671a04e-a3ed-49d0-8c9f-7a8f3b55fe35.jpg",
       ],
      reviewAverage: "4.5"
  ),Groceries(
      name: 'Whiskas Makanan Kucing Pouch Adult Tuna 80 gr',
      description: "Whiskas Makanan Kucing Pouch Adult Tuna 80 gram \nKeunggulan: \n1. Kalsium dan fosfor untuk pertumbuhan tulang yang kuat dan tubuh yang sehat.\n2. Antioksidan untuk mendukung sistem kekebalan.\n3. Protein berkualitas dari ikan asli sebagai sumber energi untuk aktivitasnya.\n4. Teksturnya yang lunak dan lembut mudah dikunyah dan aman bagi lambung anak kucing.",
      price: "8.000",
      stock: "160",
      discount: "3%",
      storeName: "Topserba Official Store",
      productUrl: "https://tokopedia.link/YWFkvcd6Ptb",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/8/3/cbd09a6f-86a3-43f1-b2fc-dff13581d331.jpg"
       ],
      reviewAverage: "4.9"
  ),Groceries(
      name: 'Beras Diabetes Organik JATILUWIH Low GI Beras Diet pouch 1 kg - Pouch 1 kg',
      description: "Beras Diabetes Organik JATILUWIH Adalah beras organik asli dari Bali yang dipanen dari lahan organik terbaik di lereng gunung Batukaru Tabanan, Bali.",
      price: "38.000",
      stock: "22",
      discount: "10%",
      storeName: "JDSEHAT",
      productUrl: "https://tokopedia.link/hyupRpm6Ptb",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/7/20/18b462ae-09c6-497e-80ed-1652fc1a0a32.png",
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/7/15/e73b1d64-9d9e-4362-849e-b3a04a0b798f.jpg",
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/7/15/abf23893-b6ee-4ce8-996a-1fc10f13ad2a.jpg",
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/7/15/a1c057a0-546f-44e4-8749-51f69f539d59.png",
       ],
      reviewAverage: "5"
  ),Groceries(
      name: 'Minyak Goreng Sovia 2 L',
      description: "Sovia adalah minyak goreng berkualitas yang diproses dari kelapa sawit pilihan yang mengandung vitamin A dan vitamin D, juga dilengkapi 1.9g omega 6 dan 5.7g omega 9 per sajian. Wilmar International Ltd (Wilmar Group) adalah produsen minyak goreng terbesar di Indonesia dengan merek Sania, Fortune, Siip, Sovia, Mahkota, Ol'eis, Bukit Zaitun, Goldie, dan Camilla.",
      price: "30.200",
      stock: "1000",
      discount: "10%",
      storeName: "KedaiMart Official Store",
      productUrl: "https://tokopedia.link/uO6O2Bu6Ptb",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/hDjmkQ/2022/4/28/24a0dc8b-e1e9-4a9a-8851-95aef834dea5.jpg",
       ],
      reviewAverage: "4.9"
  ),Groceries(
      name: 'The Duck King Sauce - Chili Oil',
      description: "The Duck King Sauce Chili Oil [185 g] adalah minyak cabai khas sichuan dengan cincangan cabai kasar yang memberikan sensasi khas pedas, asam, dan manis. Cocok untuk setiap masakan, khususnya Oriental Cuisine. Dapat langsung dikonsumsi sebagai saus pendamping mie, nasi goreng, dimsum dan aneka gorengan atau dikreasikan sebagai bumbu masak berbagai hidangan oriental.",
      price: "41.585",
      stock: "16",
      discount: "0%",
      storeName: "The Duck King Official",
      productUrl: "https://tokopedia.link/pLAtdWB6Ptb",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/product-1/2018/9/13/25324651/25324651_7db690ca-4b30-44ca-9e4b-bfd87571bacf_700_700.jpg",
        "https://images.tokopedia.net/img/cache/900/product-1/2019/8/8/20886200/20886200_18699c02-ee97-49cb-b8e5-454f4d393729_1080_1080"
       ],
      reviewAverage: "4.9"
  ),Groceries(
      name: 'AQUA Air Mineral 1500ml x 12 botol (1 box)',
      description: "Air mineral berkualitas yang berasal dari sumber air pegunungan pilihan dan terlindungi. AQUA melindungi keseimbangan alami ekosistem sumber airnya sehingga kekayaan dan kealamian mineralnya terjaga.",
      price: "66.000",
      stock: "90",
      discount: "20%",
      storeName: "AQUA Official Store",
      productUrl: "https://tokopedia.link/3t7IO2I6Ptb",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2022/9/26/8a1a8c3c-341e-4b92-bb52-29ca1db519b1.jpg",
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2021/9/15/a9bc8ae5-e87a-4ca8-9eca-7d68e6b11fe3.jpg",
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2021/11/26/9c3f220c-b4f7-4482-a897-1cf0f4c10780.jpg"
       ],
      reviewAverage: "4.5"
  ),Groceries(
      name: 'Garuda Kacang Kulit',
      description: "Halal",
      price: "33.300",
      stock: "10000",
      discount: "7%",
      storeName: "GarudaFood",
      productUrl: "https://tokopedia.link/QcMBcdQ6Ptb",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2020/10/17/7d657383-c2f6-4b74-890e-2379c2cdccc4.jpg"
       ],
      reviewAverage: "4.5"
  ),Groceries(
      name: 'Nanas kupas',
      description: "Udah jelas ya gausah dijelasin lagi. Jual nanas yang udah dikupas.",
      price: "6.000",
      stock: "52",
      discount: "10%",
      storeName: "AYO BELANJA AYO MASAK - BY CERITA DAPUR BUNDA",
      productUrl: "https://tokopedia.link/EWnc0e36Ptb",
      productImageUrls: [
        "https://images.tokopedia.net/img/cache/900/VqbcmM/2021/3/12/1f2b583a-279c-4574-9a9c-e8a8852521f9.jpg"
       ],
      reviewAverage: "4.9"
  ),
];
