import champ from "../../models/modelChamp.js";
const listChamps = async (req, res, next) => {
  try {
    const [rows, fields] = await champ.getAll();

    if (rows.length === 0) {
      res.status(404).json({ err: `none champ found` });
    } else {
      res.json({
        success: "champs successfully found",
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

export default listChamps;
