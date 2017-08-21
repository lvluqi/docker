use 3mjingsocial
db.createCollection('admin_custom_data_record');
db.createCollection('api_record');
db.createCollection('availability_check_mongo');
db.createCollection('conversation');
db.createCollection('conversation_question_answer');
db.createCollection('custom_data_record');
db.createCollection('data_validated_record');
db.createCollection('follower_eav_index');
db.createCollection('question');
db.createCollection('thirdparty_product_eav_entity_collection');
db.createCollection('watsons_callback_msg');

db.conversation_question_answer.ensureIndex({"session_id":1,"conversation_id":1,"openid":1});
db.custom_data_record.ensureIndex({"module_name":1,"created_time":1,"mid":1});
db.follower_eav_index.ensureIndex({"openid":1});
