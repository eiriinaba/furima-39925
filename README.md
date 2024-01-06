## usersテーブル
| Column              | Type    | Options                   |
| ------              | ------  | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| nickname            | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_furigana  | string  | null: false               |
| first_name_furigana | string  | null: false               |
| birthday            | date    | null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル
| Column             | Type       | Options                        |
| ------             | ------     | -------------------------      |
| name               | string     | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item_detail        | text       | null: false                    |
| item_status_id     | integer    | null: false                    |
| region_id          | integer    | null: false                    |

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
- belongs_to :item
- has_one :region


## regionテーブル
| Column             | Type       | Options                        |
| ------             | ------     | -------------------------      |
| user               | references | null: false, foreign_key: true |
| post_code          | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    | 
| house_number       | string     | null: false                    | 
| building           | string     |                                | 
| phone_number       | integer    | null: false                    |

### Association
- belongs_to :order