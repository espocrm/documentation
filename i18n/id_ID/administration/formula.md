# Bidang yang Dihitung (Rumus)

Pada entity manager dimungkinkan untuk mendefinisikan script (rumus) untuk tipe entitas tertentu. Script ini akan dieksekusi setiap saat sebelum rekaman disimpan.
Ini menyediakan kemampuan untuk secara otomatis mengatur bidang tertentu (atribut) dengan nilai yang berasal dari perhitungan.

Untuk mengedit rumus ikuti menu Administrasi> Manajer Entitas> tarik-ulur di sebelah kanan pada deretan entitas yang dibutuhkan> Rumus.

Anda juga mungkin perlu mengatur bidang, yang seharusnya dihitung, Read-only melalui Manajer Entitas.


## Sintaks

Rumus EspoCRM ditulis dalam bahasa sederhana yang dirancang khusus untuk fitur ini.

Ada operator, fungsi atribut dan nilai yang bisa digunakan dalam rumus. Ekspresi terpisah harus dibatasi oleh karakter `;`.

### Operator

* `=` - penempatan.
* `||` - logika ATAU,
* `&&` - logika DAN,
* `!` - logika TIDAK,
* `+`- penjumlahan numerik,
* `-` - pengurangan numerik,
* `*` - perkalian numerik,
* `/` - divisi numerik,
* `%` - modul numerik,
* `==` - perbandingan sama dengan,
* `!=` - perbandingan tidak sama dengan,
* `>` - perbandingan lebih besar dari,
* `<` - perbandingan lebih kurang dari,
* `>=` - perbandingan lebih besar dari atau sama dengan,
* `<=` - perbandingan kurang dari atau sama dengan.

Prioritas operator:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Atribut

Atribut mewakili nilai bidang dari entitas target. Anda bisa memasukkan atribut yang tersedia dengan mengklik tombol plus.

Ini memungkinkan mengakses atribut entitas terkait dengan format berikut `linkName.attributeName`.


### Fungsi

Format fungsi yang digunakan: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Fungsi yang tidak biasa digunakan tercantum di bawah ini.

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` Jika CONDITION terpenuhi maka lakukan CONSEQUENT. Jika tidak -- maka lakukan ALTERNATIVE.

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` Jika CONDITION terpenuhi maka lakukan CONSEQUENT. Jika tidak - tidak melakukan apapun.

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` Menyatukan dua atau lebih string.

#### string\substring
`string\substring(STRING, START, LENGTH)`  Ekstrak karakter dari STRING pada posisi START dan LENGTH.

Jika LENGTH dihilangkan, substring mulai dari START sampai akhir STRING akan dikembalikan.

Jika LENGTH negatif, maka banyak karakter akan dihilangkan dari akhir STRING.

#### string\\trim
`string\trim(STRING)` Strips whitespace dari awal dan akhir STRING.

#### string\\lowerCase
`string\lowerCase(STRING)` Mengonversi huruf ke huruf kecil. (sejak versi 5.0.0)

#### string\\upperCase
`string\upperCase(STRING)` Mengonversi huruf ke huruf besar. (sejak versi 5.0.0))

#### datetime\\today
`datetime\today()` Mengembalikan tanggal hari ini.

#### datetime\now
`datetime\now()` Mengembalikan waktu sekarang.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` Mengonversi tanggal atau batas waktu VALUE menjadi string yang diformat sesuai dengan pengaturan aplikasi. TIMEZONE dan FORMAT dapat dihilangkan. Jika TIMEZONE dihilangkan maka zona waktu default akan digunakan. Jika FORMAT dihilangkan maka format default akan digunakan.

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Mengembalikan tanggal setiap bulan (1-31). `0` jika VALUE kosong. Jika TIMEZONE dihilangkan maka zona waktu sistem digunakan. (sejak versi 4.7.0)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Mengembalikan bulan (1-12). `0` jika VALUE kosong. Jika TIMEZONE dihilangkan maka zona waktu sistem digunakan. (sejak versi 4.7.0)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Mengembalikan tahun. `0` jika VALUE kosong. Jika TIMEZONE dihilangkan maka zona waktu sistem digunakan. (sejak versi 4.7.0)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Mengembalikan jam (0-23). `-1` jika VALUE kosong. Jika TIMEZONE dihilangkan maka zona waktu sistem digunakan. (sejak versi 4.7.0)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Mengembalikan menit (0-59). `-1` jika VALUE kosong. Jika TIMEZONE dihilangkan maka zona waktu sistem digunakan. (sejak versi 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Mengembalikan hari dalam seminggu (0-6). `-1` jika VALUE kosong `0` - untuk hari minggu. Jika TIMEZONE dihilangkan maka zona waktu sistem digunakan. (sejak versi 4.7.3)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Mengembalikan perbedaan antara dua tanggal atau datetimes. INTERVAL_TYPE dapat 'tahun', 'bulan', 'hari', 'jam', 'menit'. Kembalikan `null` jika gagal. Hasilnya akan negatif jika VALUE_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Menambah MINUTES ke nilai VALUE datanya. MINUTES bisa negatif.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Menambahkan JAM ke VALUE datetime. JAM bisa negatif.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Menambahkan DAYS ke tanggal atau datetime VALUE. HARI bisa negatif.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Menambahkan WEEKS sampai tanggal atau datetime VALUE. MINGGU bisa negatif.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Menambahkan BULAN ke tanggal atau datetime VALUE. BULAN bisa jadi negatif.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Menambahkan YEARS to date atau datetime VALUE. TAHUN bisa negatif

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Mengembalikan tanggal terdekat atau datetime ke VALUE berdasarkan argumen yang diajukan. (sejak versi 5.0.0)

JENIS bisa menjadi salah satu dari nilai berikut: 'waktu', 'menit', 'jam', 'tanggal', 'bulan', 'dayOfWeek'. TARGET adalah nilai integer atau nilai string. IS_PAST berarti menemukan yang terdekat di masa lalu. Jika TIMEZONE dihilangkan maka zona waktu default digunakan.

Contoh:

`datetime\closest(datetime\now(), 'time', '20:00')` Akan mengembalikan nilai datetime terdekat di masa depan dengan waktu 20:00.

`datetime\closest('2017-11-20', 'date', 1, true)` Akan kembali ke`2017-11-01`, hari pertama setiap bulannya. 

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Akan kembali ke Senin depan (awal hari).

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Mengubah nilai numerik menjadi string yang diformat sesuai dengan format atau pengaturan aplikasi default tertentu. Jika DECIMALS, DECIMAL_MARK ATAU THOUSAND_SEPARATOR maka sistem default digunakan.

Contoh:

`number\format(2.666667, 2)` - hasilnya 2.67;

`number\format(1000, 2)` - hasilnya 1,000.00;

`number\format(10.1, 0)` - hasilnya 10.


#### number\abs
`number\abs(VALUE)` Nilai mutlak. Mengembalikan null jika VALUE tidak numerik.

#### number\round
`number\round(VALUE, PRECISION)` Mengembalikan nilai pembulatan VALUE ke PRECISION yang ditentukan (jumlah digit setelah titik desimal). KETEPATAN juga bisa negatif atau nol (default).

#### number\floor
`number\floor(VALUE)` Mengembalikan nilai integer terendah berikutnya dengan membulatkan nilai jika perlu. (sejak versi 4.9.0)

#### number\ceil
`number\ceil(VALUE)` Mengembalikan nilai integer tertinggi berikutnya dengan nilai pembulatan jika perlu. (sejak versi 4.9.0)

#### entity\isNew
`entity\isNew()` Mengembalikan TRUE jika entitas itu baru (dibuat) dan FALSE jika tidak (sedang diperbarui).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Mengembalikan TRUE jika ATTRIBUTE entitas diubah.

Contoh:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Mengembalikan TRUE jika ATTRIBUTE entitas tidak berubah.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Atribut yang ditetapkan saat entitas target diambil dari database. Sebelum dimodifikasi.

Contoh:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Menambahkan ID ke bidang Tautan Multiple. Misalnya, tambahkan bidang 'someTeamId' ke 'tim'. 

`entity\addLinkMultipleId(LINK, ID_LIST)` Menambahkan daftar id. (sejak versi 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Cek apakah bidang Tautan Multiple memiliki ID khusus.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Menghapus ID khusus dari bidang Tautan Multiple.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Cek apakah entitas target terkait dengan entitas lain yang ditunjukkan oleh LINK dan ID.

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Mengembalikan ATTRIBUTE pengguna saat ini.

#### list
`list(VALUE-1, ... VALUE-N)` Mengembalikan array. (sejak versi 4.7.0)

#### array\includes
`array\includes(LIST, VALUE)` Mengembalikan nilai true jika LIST berisi VALUE. Bisa digunakan untuk bidang Array dan Multi-Enum. (sejak versi 4.7.0)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Menambahkan satu atau lebih elemen ke akhir array dan mengembalikan array baru. (sejak versi 5.0.0)

#### array\length
`array\length(LIST)` Mengembalikan hitungan elemen dalam DAFTAR. (sejak versi 4.8.1)


### Nilai

* Strings. Misalnya 'some string';
* Integer numbers. Misalnya 1, 100, 40300.
* Float numbers. Misalnya 5.2.

### Variabel

Memungkinkan untuk menentukan variabel khusus dalam formula.
```
$someVariableName = 'Test';
description = $test;
```


## Contoh

```
ifThen(
  entity\isNew() && assignedUserId == null,
  assignedUserId = 'managerId'
);

ifThen(
  entity\isNew() && closeDate == null && stage == 'Closed Won',
  datetime\today()
);
```

```
amount = product.listPrice - (product.listPriceConverted * discount / 100.0);
amountCurrency = 'USD';
```

```
someField = string\concatenate(firstName, " '", middleName, "' ", lastName);
```

```
ifThenElse(
  entity\isNew() && status == 'Planned' && dateStart == null,
  dateStart = datetime\addDays(datetime\now(), 10),
  ifThen(
    status == 'Held' && dateStart == null,
    dateStart = datetime\now()
  )
);

```

## Menggunakan rumus dalam Alur Kerja

Anda dapat memanfaatkan rumus dalam kondisi lur kerja dan tindakan. Lihat [dokumentasi alur kerja](workflows.md) untuk informasi lebih lanjut.
