import db from '../database/db.js'

const insert = async (userId, champ) => {
    const {name, date, info, local} = champ
    return await db.query('insert into champs (id_user, name, date, info, local) values (?,?,?,?,?)',[userId, name, date, info, local])
}

const getAll = async (id) => {
    return await db.query('select id, name, date, info, local from champs', [id])
}

const getById = async (id) => {
    return await db.query('select id, name, date, info, local, id_user from champs where id = ?', [id])
}

const getByName = async (name) => {
    return await db.query('select id, name, date, info, local from champs where name = ?', [name])
}

const update = async (userId,champ) => {
    const {name, date, info, local} = champ
    return await db.query('update champs SET id_user = ?, name = ?, date = ?, info = ?, local = ? where id_user = ? and id = ?',[userId, name, date, info, local, userId, champ.id])
}

const remove = async (id) => {
    return await db.query('delete from champs where id = ?', [id])
}

export default {insert, getAll, getById, getByName, update, remove}