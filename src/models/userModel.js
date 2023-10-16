import db from '../database/db.js'

const insert = async (user) => {
    const {name, email, pass, photo, access, nickname} = user
    return await db.query('insert into users (name, email, pass, photo, access, nickname) values (?,?,?,?,?,?)',[name, email, pass, photo, access, nickname])
}

export default {insert}