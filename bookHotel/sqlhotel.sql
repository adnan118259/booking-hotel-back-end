
-- view_room_and_categories
 
CREATE or REPLACE VIEW view_room_and_categories as 
SELECT room.* , categories.*  FROM room
INNER JOIN categories on room.room_categories =categories.categories_id;

---- view_room_and_categories_withFavorite
CREATE or REPLACE VIEW view_room_and_categories_withFavorite as 
SELECT room.* , categories.* FROM room
INNER JOIN categories on room.room_categories =categories.categories_id;
 
   
   SELECT view_room_and_categories_withFavorite.*, 1 AS favorite, CAST((room_price - (room_price*room_discount / 100)) AS SIGNED) AS roomPriceDiscount 
        FROM view_room_and_categories_withFavorite
        INNER JOIN favorite ON favorite.favorite_roomid = view_room_and_categories_withFavorite.room_id 
        AND favorite.favorite_usersid = 51 
        
                UNION ALL 

        SELECT view_room_and_categories_withFavorite.*, 0 AS favorite ,CAST((room_price - (room_price*room_discount / 100)) AS SIGNED) AS roomPriceDiscount 
        FROM view_room_and_categories_withFavorite
        WHERE categories_id=1 AND Not EXISTS (
            SELECT view_room_and_categories_withFavorite.room_id
            FROM view_room_and_categories_withFavorite
            INNER JOIN favorite ON favorite.favorite_roomid = view_room_and_categories_withFavorite.room_id 
            AND favorite.favorite_usersid = 51
        )


    --- OFFERS
    SELECT DISTINCT view_room_and_categories.*
    , 1 AS favorite
    , CAST((room_price - (room_price*room_discount / 100)) AS INT) AS roomPriceDiscount
FROM view_room_and_categories

INNER JOIN favorite ON favorite.favorite_roomid = view_room_and_categories.room_id 
WHERE room_discount != 0

UNION ALL 

SELECT DISTINCT view_room_and_categories.*
    , 0 AS favorite 
    , CAST((room_price - (room_price*room_discount / 100)) AS INT) AS roomPriceDiscount
FROM view_room_and_categories
WHERE room_discount != 0 AND NOT EXISTS (
    SELECT favorite.favorite_roomid
    FROM favorite 
    WHERE favorite.favorite_roomid = view_room_and_categories.room_id
);
       


CREATE or REPLACE VIEW viewMyfavorit AS


SELECT favorite.* , room.* , users.users_id FROM favorite
INNER JOIN users ON users.users_id = favorite.favorite_usersid
INNER JOIN room ON  room.room_id = favorite.favorite_roomid;
/*
 SELECT view_room_and_categories_withFavorite.*, 1 AS favorite, CAST((room_price - (room_price*room_discount / 100)) AS SIGNED) AS roomPriceDiscount 
        FROM view_room_and_categories_withFavorite
        INNER JOIN favorite ON favorite.favorite_roomid = view_room_and_categories_withFavorite.room_id 
        AND favorite.favorite_usersid = $usersid */

-- bookView
CREATE or REPLACE VIEW bookView as
SELECT SUM(room.room_price) as roomTotalPrice,COUNT(book_roomid)as countRoom,book.*,room.* FROM book
INNER JOIN room on room.room_id = book.book_roomid
GROUP BY book.book_roomid , book.book_usersid;

-- السعر بعد الخصم 
CREATE or REPLACE VIEW bookView as
SELECT SUM(room.room_price - room.room_price*room.room_discount/100) as roomTotalPrice,COUNT(book_roomid)as countRoom,book.*,room.* FROM book
INNER JOIN room on room.room_id = book.book_roomid
where book_orders =0
GROUP BY book.book_roomid , book.book_usersid;







CREATE or REPLACE VIEW  orderDetailsView AS
SELECT SUM(room.room_price - room.room_price*room.room_discount/100) AS RoomDiscountPrice ,COUNT(book.book_roomid) AS CountRoom, book.* , room.* ,orders.* FROM `book` 
INNER JOIN room on room.room_id=book.book_roomid 
INNER JOIN orders on orders.orders_id=book.book_orders
where book_orders != 0 
GROUP BY book.book_roomid ,book.book_usersid ;



CREATE or REPLACE VIEW roomTopBooking AS
SELECT COUNT(book_id) as  countRoom , book.* , room.*  ,(room_price - (room_price*room_discount / 100)) AS roomPriceDiscount 
FROM book
INNER JOIN room on room.room_id = book.book_roomid
WHERE book_orders != 0

GROUP by book_roomid