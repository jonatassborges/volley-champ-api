import subscribe from "../../models/subscribeModel.js";
const showSubscribers = async (req, res) => {
  try {
    const champId = req.params.champId;
    const [rows] = await subscribe.getSubscribersByIdChamp(champId);
    if (rows.length === 0) {
      res.status(404).json({ err: `nenhuma  dupla inscrita` });
    } else {

      res.json({
        success: "inscritos achados com sucesso",
        inscritos: rows,
      });
    }
  } catch (error) {
    console.log(error.message);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

export default showSubscribers;
