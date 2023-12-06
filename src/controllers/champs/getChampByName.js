import champ from "../../models/modelChamp.js";
const getChampByName = async (req, res) => {
    try {
      const champData = req.body;
      const [rows] = await champ.getByName(champData.name);
        if (rows.length === 0) {
            res.status(404).json({ error: `nenhum  campeonato encontrado` });
        } else {
            res.json({
            success: "campeonato achado com sucesso",
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
  
  export default getChampByName;