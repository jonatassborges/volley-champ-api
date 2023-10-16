import user from '../../models/userModel.js'
const createUser = async (req, res, next) => {
    try {
        const userData= req.body
        const [result] = await user.insert(userData)

        if (result.affectedRows === 1) {
            res.json({
                success: "user succesfully created",
                user: {
                    id: result.insertId,
                    ...userData
                }
            })
        } else{
            res.status(404).json({err: `fill the data`}) 
        }



    } catch (error) {
        console.log(error)
        res.status(500).json({
            error: "Server Error"
        })
}

}
export default createUser