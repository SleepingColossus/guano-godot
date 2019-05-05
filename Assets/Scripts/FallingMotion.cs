using UnityEngine;

public class FallingMotion : MonoBehaviour
{
    private Rigidbody2D _body;
    private Animator _animator;

    private AudioSource _audioSource;
    public AudioClip fallingSound;
    public AudioClip landSound;

    public Vector2 velocity;
    public float angularVelocity;
    private bool _landed;

    private void Start()
    {
        _body = GetComponent<Rigidbody2D>();
        _body.velocity = velocity;
        _body.angularVelocity = angularVelocity;

        _animator = GetComponent<Animator>();

        _audioSource = GetComponent<AudioSource>();
        _audioSource.clip = fallingSound;
        _audioSource.Play();
    }

    private void LateUpdate()
    {
        if (!_landed && transform.position.y < -2)
        {
            _animator.enabled = false;

            _audioSource.clip = landSound;
            _audioSource.Play();

            _landed = true;
        }
    }
}
