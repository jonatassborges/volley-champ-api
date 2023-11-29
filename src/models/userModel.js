import db from '../database/db.js'

const insert = async (user) => {
    const {name, email, pass, photo, access, nickname, sex} = user
    return await db.query('insert into users (name, email, pass, photo, access, nickname,sex) values (?,?,?,?,?,?,?)',[name, email, pass, photo, access, nickname, sex])
}

const getByNickname = async (email) => {
    return await db.query("SELECT * FROM users Where nickname = ?;", [nickname])
}

const getAll = async (id) => {
    return await db.query('select  name, email, pass, photo, access, nickname,sex from users', [id])
}

const getById = async (id) => {
    return await db.query('select name, email, pass, photo, access, nickname,sex from users where id = ?', [id])
}

const update = async (user) => {
    const {name, email, pass, photo, access, nickname, sex} = user
    return await db.query('update users SET name = ?, email = ?, pass = ?, photo = ?, access = ?, nickname = ?, sex = ?',[name, email, pass, photo, access, nickname, sex])
}

const remove = async (id) => {
    return await db.query('delete from users where id = ?', [id])
}

export default {insert, getByNickname, getAll, getById, update, remove}