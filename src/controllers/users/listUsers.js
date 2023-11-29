import user from "../../models/userModel.js";
const listUsers = async (req, res, next) => {
  try {
    const [rows, fields] = await user.getAll();

    if (rows.length === 0) {
      res.status(404).json({ err: `none user found` });
    } else {
      res.json({
        success: "users successfully found",
        users: rows,
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      error: "Server Error",
    });
  }
};

export default listUsers;
