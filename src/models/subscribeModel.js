import db from '../database/db.js'

const insert = async (userId, subscribe) => {
    const {category, subscribe_champs, subscribe_duo} = subscribe
    return await db.query('insert into subscribe (category, subscribe_champs, subscribe_user, subscribe_duo) values (?,?,?,?)',[category, subscribe_champs, userId, subscribe_duo])
}

const getSubscribersByIdChamp = async (champId) => {
    return await db.query(`SELECT u1.name as user_name, u2.name as duo_name 
    FROM subscribe as s 
    INNER JOIN users as u1 ON s.subscribe_user = u1.id 
    INNER JOIN users as u2 ON s.subscribe_duo = u2.id
    WHERE s.subscribe_champs = ?;`,[champId])
}

export default {insert, getSubscribersByIdChamp}