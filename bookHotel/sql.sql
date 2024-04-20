
---- prodViewwithFavorite
CREATE or REPLACE VIEW prodViewwithFavorite as 
SELECT prod.* , categories.* FROM prod
INNER JOIN categories on prod.product_categories =categories.categories_id
 
    SELECT prodViewwithFavorite.*, 1 AS favorite 
        FROM prodViewwithFavorite
        INNER JOIN favorite ON favorite.favorite_productid = prodViewwithFavorite.product_id 
        AND favorite.favorite_usersid = $usersid
        WHERE categories_id=$categoryid

        UNION ALL 

        SELECT *, 0 AS favorite 
        FROM prodViewwithFavorite
        WHERE categories_id=$categoryid AND EXISTS (
            SELECT prodViewwithFavorite.product_id
            FROM prodViewwithFavorite
            INNER JOIN favorite ON favorite.favorite_productid = prodViewwithFavorite.product_id 
            AND favorite.favorite_usersid = $usersid
        )



        -- view for favorit screen

CREATE or REPLACE VIEW favoritproView AS
SELECT favorite.* , prod.* , users.users_id FROM favorite
INNER JOIN users ON users.users_id= favorite.favorite_usersid
INNER JOIN prod ON prod.product_id= favorite.favorite_productid;




        -- view for cardView  // ProdDiscountPrice   // CountProd


CREATE or REPLACE VIEW  cardView AS
SELECT SUM(prod.product_price - prod.product_price*prod.product_discount/100) AS ProdDiscountPrice ,COUNT(card.card_productid) AS CountProd, card.* , prod.* FROM `card` 
INNER JOIN prod on prod.product_id=card.card_productid
where card_orders =0 
GROUP BY card.card_productid ,card.card_usersid,card.card_orders ;


        -- view for cardView  //totalPrice   // totalCount  
        -- بحسب عدد مرات الاصافة يقبل تكرار المنتج ويحسبه مع التوتال


SELECT SUM(ProdDiscountPrice) AS totalPrice,SUM(CountProd) AS totalCount FROM `cardView`
GROUP BY card_usersid;
 








 CREATE or REPLACE VIEW  orderView AS

SELECT orders.*,adress.* FROM orders
LEFT JOIN adress on adress.adress_id = orders.orders_address





CREATE or REPLACE VIEW  orderDetailsView AS
SELECT SUM(prod.product_price - prod.product_price*prod.product_discount/100) AS ProdDiscountPrice ,COUNT(card.card_productid) AS CountProd, card.* , prod.*  FROM `card` 
INNER JOIN prod on prod.product_id=card.card_productid 
where card_orders != 0 
GROUP BY card.card_productid ,card.card_usersid,card.card_orders ;




CREATE or REPLACE VIEW prodtopselling AS
SELECT COUNT(card_id) as  countProd , card.* , prod.*  ,(product_price - (product_price*product_discount / 100)) AS proPriceDiscount 
FROM card
INNER JOIN prod on prod.product_id = card.card_productid
WHERE card_orders != 0

GROUP by card_productid