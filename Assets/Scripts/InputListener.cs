using UnityEngine;
using UnityEngine.SceneManagement;

public class InputListener : MonoBehaviour
{
    private void Update()
    {
        if (Input.anyKeyDown)
        {
            SceneManager.LoadScene("Game");
        }
    }
}
