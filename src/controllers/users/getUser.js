import user from "../../models/userModel.js";
const getUser = async (req, res, next) => {
  try {
    const userData = req.body;
    const [rows, fields] = await user.getByNickname(userData.nickname);

    if (rows.length === 0) {
      res.status(404).json({ err: `user nickname:${userData.nickname} not found` });
    } else {
      res.json({
        success: "user successfully found",
        user: rows[0],
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      error: "Server Error",
    });
  }
};

export default getUser;