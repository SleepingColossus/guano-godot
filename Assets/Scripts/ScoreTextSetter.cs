using UnityEngine;
using UnityEngine.UI;

public class ScoreTextSetter : MonoBehaviour
{
    private Text _scoreText;

    private void Start()
    {
        _scoreText = GetComponent<Text>();
        _scoreText.text = $"Final Score: {ScoreTracker.Score}";
    }
}
