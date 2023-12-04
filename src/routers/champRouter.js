import express from 'express'
import createChamp from '../controllers/champs/createChamp.js'
import listChamps from '../controllers/champs/listChamps.js'
import deleteChamp from '../controllers/champs/deleteChamp.js'
import auth from "../middlewares/auth.js"
const router = express.Router()

router.get('/list', listChamps)
router.post('/', auth, createChamp)
router.delete('/', auth, deleteChamp)

export default router