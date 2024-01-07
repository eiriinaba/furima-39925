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
| Column          | Type       | Options                        |
| ------          | ------     | -------------------------      |
| name            | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| category_id     | integer    | null: false                    |
| item_status_id  | integer    | null: false                    |
| price           | integer    | null: false                    |
| item_detail     | text       | null: false                    |
| region_id       | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル
| Column | Type       | Options                        |
| ------ | ------     | -------------------------      |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :region


## regionテーブル
| Column        | Type       | Options                        |
| ------        | ------     | -------------------------      |
| orders        | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    | 
| house_number  | string     | null: false                    | 
| building      | string     |                                | 
| phone_number  | string     | null: false                    |

### Association
- belongs_to :order