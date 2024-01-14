import champ from "../../models/modelChamp.js";

const getChamp = async (req, res) => {
  try {
    const champId = req.params?.champId || req.body?.champId;
    if (!champId) {
      return res.status(400).json({ error: "No champId provided" });
    }
    const [rows] = await champ.getById(champId);
    if (rows.length === 0) {
      res.status(404).json({ err: `nenhum  campeonato encontrado` });
    } else {
      res.json({
        success: "campeonato achar com sucesso",
        champ: rows,
      });
    }
  } catch (error) {
    console.log(error.message);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

export default getChamp;
