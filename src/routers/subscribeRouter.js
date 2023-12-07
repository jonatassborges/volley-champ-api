import express from 'express'
import createSubscribe from '../controllers/subscribe/subscribe.js'
import showSubscribers from '../controllers/subscribe/showSubscribers.js'
import auth from "../middlewares/auth.js"

const router = express.Router()

router.post('/', auth, createSubscribe)
router.get('/show/:champId', auth, showSubscribers)





// })
export default router