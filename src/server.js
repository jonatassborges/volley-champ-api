//const express = require('express')
import express from 'express'
import bodyParser from 'body-parser'
import cookieParser from 'cookie-parser'
import cors from 'cors'
import { PORT } from './config.js'

import userRouter from './routers/userRouter.js'
import authRouter from './routers/authRouter.js'
import champRouter from './routers/champRouter.js'
import subscribeRouter from './routers/subscribeRouter.js'

const api = express()

// converte toda req com body p objeto e fica salvo
//no req.body
api.use(cors())
api.use(bodyParser.json())
api.use(cookieParser())

api.use('/user', userRouter)
api.use('/auth', authRouter)
api.use('/champ', champRouter)
api.use('/subscribe', subscribeRouter)


api.listen(PORT, () => {
    console.log(`server running at ${PORT}`)
})