## usersテーブル
| Column              | Type    | Options                   |
| ------              | ------  | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| nickname            | string  | null: false               |
| full_name           | string  | null: false               |
| furigana            | string  | null: false               |
| birthday            | integer | null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル
| Column             | Type    | Options                        |
| ------             | ------  | -------------------------      |
| name               | string  | null: false                    |
| category           | string  | null: false                    |
| price              | integer | null: false                    |
| exhibitor          | string  | null: false, foreign_key: true |
| item_detail        | text    | null: false                    |
| item_status        | string  | null: false                    |
| region             | string  | null: false                    |
| shipping_due       | string  | null: false                    |
| shipping_fee       | string  | null: false                    |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル
| Column             | Type   | Options                   |
| ------             | ------ | ------------------------- |
| user               | string | null: false, unique: true |
| item               | text   | null: false               |

### Association
- belongs_to :user
- belongs_to :items
- has_one :region


## regionテーブル
| Column             | Type    | Options                   |
| ------             | ------  | ------------------------- |
| user               | string  | null: false, unique: true |
| user_address       | text    | null: false               |
| phone_number       | integer | null: false               |

### Association
- belongs_to :user
- belongs_to :item