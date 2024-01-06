## usersテーブル
| Column             | Type   | Options                   |
| ------             | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association
- has_many :items
- has_many :orders




## itemsテーブル
| Column             | Type   | Options                   |
| ------             | ------ | ------------------------- |
| name               | string | null: false               |
| category           | string | null: false               |
| price              | string | null: false               |
| exhibitor          | string | null: false               |
| item_detail        | text   | null: false               |

### Association
- belongs_to :user
- has_one :order




## ordersテーブル
| Column             | Type   | Options                   |
| ------             | ------ | ------------------------- |
| buyer              | string | null: false, unique: true |
| buyer_address      | text   | null: false               |


### Association
- belongs_to :user
- belongs_to :items