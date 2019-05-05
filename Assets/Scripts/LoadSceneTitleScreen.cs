using System;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoadSceneTitleScreen : MonoBehaviour
{
    public SpriteRenderer idleBird;
    public SpriteRenderer startingBird;
    public SpriteRenderer winkingBird;

    public float animationDelay;

    private bool _animating;
    private AnimationState _animationState;
    private AudioSource _audioSource;

    private void Start()
    {
        _audioSource = GetComponent<AudioSource>();
    }

    private void Update()
    {
        if (!_animating && Input.anyKeyDown)
        {
            _animating = true;
            StartCoroutine(ChangeToStaringFrame());
        }
    }

    private IEnumerator ChangeToStaringFrame()
    {
        yield return new WaitForSeconds(animationDelay); 

        idleBird.enabled = false;
        startingBird.enabled = true;

        StartCoroutine(ChangeToWinkingFrame());
    }

    private IEnumerator ChangeToWinkingFrame()
    {
        yield return new WaitForSeconds(animationDelay);

        startingBird.enabled = false;
        winkingBird.enabled = true;
        _audioSource.Play();
        StartCoroutine(LoadHelpScreen());
    }

    private IEnumerator LoadHelpScreen()
    {
        yield return new WaitForSeconds(animationDelay);
        SceneManager.LoadScene("HelpScreen");
    }

    private enum AnimationState
    {
        Idle,
        Starting,
        Winking,
    }
}
