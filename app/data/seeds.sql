USE ffirnders_db;

INSERT INTO friends (friend_name, image_url) VALUES 
("Isaac Newton", "https://cdn.britannica.com/79/152179-138-028BBA91/Isaac-Newton-formulation-law-gravitation.jpg"), 
("Albert Einstein", "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Frainerzitelmann%2Ffiles%2F2019%2F06%2FE0MG76-e1560965378507-1200x1270.jpg"),
("Che Guevara", "https://www.biography.com/.image/t_share/MTE4MDAzNDEwNTQxMTg0NTI2/che-guevara-9322774-1-402.jpg"),
("Oprah Winfrey", "https://www.coloradocollege.edu/contentAsset/image/5a5d52c2-7fcb-46b0-baf3-d503e66f19a7/fileAsset/filter/Resize/resize_w/700&filetype=.jpg"),
("Ellen DeGeneres", "https://s2.r29static.com/bin/entry/576/720x864,85/2091239/image.webp"),
("Julius Caesar", "https://historyhustle.com/wp-content/uploads/2018/06/caesar.jpg"),
("Miley Cyrus", "https://s2.r29static.com/bin/entry/3f1/720x864,85/2242651/image.webp"),
("Goku", "https://cdna.artstation.com/p/assets/images/images/008/464/506/large/amit-baokar-goku-1-0.jpg?1512968898"),
("Walter White", "https://thoughtcatalog.files.wordpress.com/2013/10/screen-shot-2013-10-17-at-10-29-12-am.png?w=584&h=397"),
("Donald Trump", "https://www.gannett-cdn.com/presto/2019/08/14/USAT/df2a4775-e46d-46fd-b214-d04c020249ee-AP_Trump_1.JPG?crop=3455,1944,x0,y0&width=3200&height=1680&fit=bounds"),
("Sarah Palin", "https://cdn.britannica.com/97/124497-050-7817904E/Sarah-Heath-Palin.jpg"),
("Lady Gaga", "https://www.etonline.com/sites/default/files/styles/max_970x546/public/images/2019-02/gettyimages-1131904693.jpg?itok=Q70II6st&h=1261cb6d"),
("Hulk Hogan", "https://www.onthisday.com/images/people/hulk-hogan-medium.jpg"),
("Macho Man", "https://cdn-s3.si.com/images/1987-Randy-Macho-Man-Savage.jpg"),
("Beethoven", "https://www.biography.com/.image/t_share/MTI2NTgyMzIxOTcyMjU5NDU5/beethoven-600x600jpg.jpg");

INSERT INTO questions (question) VALUES
("How often have you been bothered by feeling down, depressed or hopeless?"),
("How often have you had little interest or pleasure in doing things?"),
("How often have you been bothered by trouble falling or staying asleep, or sleeping too much?"),
("How often have you been bothered by feeling tired or having little energy?"),
("How often have you been bothered by poor appetite or overeating?"),
("How often have you been bothered by feeling bad about yourself, or that you are a failure, or have let yourself or your family down?"),
("How often have you been bothered by feeling nervous, anxious or on edge?"),
("How often have you been bothered by not being able to stop or control worrying?"),
("How often have you been bothered by worrying too much about different things?"),
("How often have you been bothered by having trouble relaxing?");

INSERT INTO scores (friend_id, question_id, score) VALUES 
(1,1,3), (1,2,2), (1,3,4), (1,4,1), (1,5,5), (1,6,4), (1,7,1), (1,8,3), (1,9,4), (1,10,4),
(2,1,4), (2,2,4), (2,3,1), (2,4,2), (2,5,4), (2,6,1), (2,7,4), (2,8,1), (2,9,1), (2,10,3),
(3,1,3), (3,2,3), (3,3,5), (3,4,4), (3,5,5), (3,6,3), (3,7,4), (3,8,1), (3,9,3), (3,10,1),
(4,1,3), (4,2,4), (4,3,4), (4,4,2), (4,5,1), (4,6,5), (4,7,4), (4,8,3), (4,9,4), (4,10,3),
(5,1,4), (5,2,2), (5,3,5), (5,4,2), (5,5,5), (5,6,4), (5,7,3), (5,8,4), (5,9,1), (5,10,5),
(6,1,3), (6,2,4), (6,3,4), (6,4,2), (6,5,4), (6,6,5), (6,7,1), (6,8,3), (6,9,4), (6,10,5),
(7,1,3), (7,2,2), (7,3,5), (7,4,4), (7,5,5), (7,6,1), (7,7,4), (7,8,1), (7,9,4), (7,10,4),
(8,1,3), (8,2,2), (8,3,5), (8,4,2), (8,5,5), (8,6,4), (8,7,1), (8,8,3), (8,9,1), (8,10,1),
(9,1,3), (9,2,4), (9,3,5), (9,4,2), (9,5,1), (9,6,5), (9,7,1), (9,8,4), (9,9,3), (9,10,5),
(10,1,3), (10,2,2), (10,3,4), (10,4,1), (10,5,4), (10,6,5), (10,7,3), (10,8,1), (10,9,4), (10,10,5),