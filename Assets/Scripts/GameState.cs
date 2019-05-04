using UnityEngine;
using UnityEngine.UI;

public class GameState : MonoBehaviour
{
    public int score;
    public int ammo = 15;

    public Text scoreText;
    public Text ammoText;

    public void UpdateScore(int amount)
    {
        score += amount;
        scoreText.text = $"SCORE: {score}";
    }

    public void UpdateAmmo(int amount)
    {
        ammo += amount;
        ammoText.text = $"AMMO: {ammo}";
    }
}
