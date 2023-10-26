import db from '../database/db.js'

const insert = async (user) => {
    const {name, email, pass, photo, access, nickname, sex} = user
    return await db.query('insert into users (name, email, pass, photo, access, nickname,sex) values (?,?,?,?,?,?,?)',[name, email, pass, photo, access, nickname, sex])
}

export default {insert}