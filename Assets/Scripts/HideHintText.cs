using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class HideHintText : MonoBehaviour
{
    private Text _hintText;
    public float hideDelay;

    private void Awake()
    {
        _hintText = GetComponent<Text>();
        StartCoroutine(HideText());
    }

    private IEnumerator HideText()
    {
        yield return new WaitForSeconds(hideDelay);
        _hintText.enabled = false;
    }
}
